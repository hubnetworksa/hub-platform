// Listings: how good each city's listings are. A completeness score, what's
// missing (phone, hours, description, address, category), likely
// duplicates, stale listings, listings nobody has viewed, and thin
// category-in-suburb pages. Each listing opens on the site; tick listings to
// hide them in bulk (api/bulk-listings.ts); editing happens in that city's
// admin (Businesses). One city at a time, chosen with the top-bar site selector.

export async function render(view, ui) {
  const { h, fill, api } = ui;
  ui.page({ title: 'Listings', context: 'How complete and tidy each city’s listings are, and what to fix first.' });
  fill(view, ui.state.loading());
  let d;
  const load = async (refresh) => {
    d = await api(`/api/listings${refresh ? `?refresh=${refresh}` : ''}`);
  };
  try {
    await load();
  } catch (e) {
    fill(view, ui.state.error(e));
    return;
  }
  if (!d.reports.length) {
    fill(view, ui.state.empty('No listing reports yet.'));
    return;
  }
  const draw = () => {
    const site = ui.site();
    const r = d.reports.find((x) => x.site === site) ?? d.reports[0];
    const recheck = h(
      'button',
      {
        class: 'btn small',
        type: 'button',
        onclick: async (e) => {
          const btn = e.currentTarget;
          btn.disabled = true;
          try {
            await load(r.site);
            draw();
          } catch (err) {
            btn.disabled = false;
            alert(err.message);
          }
        },
      },
      'Recheck now'
    );
    ui.page({ title: 'Listings', context: 'How complete and tidy each city’s listings are, and what to fix first.', actions: [h('span', { class: 'updated' }, `${ui.siteName(r.site)} · worked out ${ui.ago(r.updated_at)}`), recheck] });
    ui.setUpdated(r.updated_at);
    fill(view, cityReport(ui, r));
  };
  ui.onSiteChange(draw);
  draw();
}

function cityReport(ui, r) {
  const { h } = ui;
  const site = `https://${r.domain}`;
  // Ticked listings, for "Hide selected".
  const picked = new Set();
  const bar = h('div', { class: 'bulkbar', hidden: true });
  const syncBar = () => {
    bar.hidden = picked.size === 0;
    if (!picked.size) return;
    const msg = h('span', { role: 'status' }, `${picked.size} selected`);
    const hide = h(
      'button',
      {
        class: 'btn small',
        type: 'button',
        onclick: async () => {
          if (!confirm(`Hide ${picked.size} listing${picked.size === 1 ? '' : 's'} from ${ui.siteName(r.site)}? They stay in the database and can be published again from the site’s admin.`)) return;
          hide.disabled = true;
          const slugs = [...picked];
          let done = 0;
          const errors = [];
          for (let i = 0; i < slugs.length; i += 25) {
            msg.textContent = `Hiding… ${done}/${slugs.length}`;
            try {
              const out = await ui.api('/api/bulk-listings', 'POST', { site: r.site, slugs: slugs.slice(i, i + 25), status: 'hidden' });
              done += out.done.length;
            } catch (e) {
              errors.push(e.message);
            }
          }
          msg.textContent = errors.length ? `Hid ${done}; ${errors[0]}` : `Hid ${done}. The site updates after its next rebuild (a few minutes). Recheck to refresh this list.`;
          picked.clear();
          document.querySelectorAll('.pick input:checked').forEach((c) => ((c.checked = false), (c.disabled = true)));
        },
      },
      'Hide selected'
    );
    const clear = h('button', { class: 'btn small', type: 'button', onclick: () => (picked.clear(), document.querySelectorAll('.pick input').forEach((c) => (c.checked = false)), syncBar()) }, 'Clear');
    bar.replaceChildren(msg, hide, clear);
  };
  const pick = (slug) =>
    h('label', { class: 'pick', title: 'Select' }, h('input', { type: 'checkbox', 'aria-label': 'Select listing', checked: picked.has(slug), onchange: (e) => (e.target.checked ? picked.add(slug) : picked.delete(slug), syncBar()) }));
  const listingLink = (l) => h('li', {}, pick(l.slug), h('a', { href: `${site}/business/${l.slug}/`, target: '_blank', rel: 'noopener' }, l.name), h('span', { class: 'meta' }, [l.suburb, l.detail].filter(Boolean).map((x) => ` · ${x}`).join('')));
  const more = (count, shown) => (count > shown ? h('li', { class: 'meta' }, `…and ${count - shown} more`) : null);
  // The "No opening hours" check's own row: type them in and save right
  // here, instead of opening the full Edit modal just for one field.
  const hoursRow = (l, pill) => {
    const input = h('input', { class: 'input', type: 'text', placeholder: 'e.g. Mon–Fri 08:00–17:00, Sat 09:00–13:00', 'aria-label': `Opening hours for ${l.name}` });
    const saveBtn = h('button', { class: 'btn small', type: 'button' }, 'Save');
    const closeBtn = h('button', { class: 'btn small danger', type: 'button' }, 'Mark closed');
    const noInfoBtn = h('button', { class: 'btn small', type: 'button', title: 'No fixed hours to find — stop flagging this one' }, 'No information');
    const li = h(
      'li',
      {},
      h('a', { href: `${site}/business/${l.slug}/`, target: '_blank', rel: 'noopener' }, l.name),
      h('span', { class: 'meta' }, l.suburb ? ` · ${l.suburb}` : ''),
      h('div', { class: 'filters' }, input, saveBtn, closeBtn, noInfoBtn)
    );
    const done = () => {
      li.remove();
      if (pill) pill.textContent = String(Math.max(0, Number(pill.textContent.replace(/[^\d]/g, '')) - 1));
    };
    const busy = (b) => {
      input.disabled = b;
      saveBtn.disabled = b;
      closeBtn.disabled = b;
      noInfoBtn.disabled = b;
    };
    saveBtn.onclick = async () => {
      const hours = input.value.trim();
      if (!hours) return input.focus();
      busy(true);
      try {
        await ui.api('/api/set-business-hours', 'POST', { site: r.site, slug: l.slug, hours });
        done();
      } catch (err) {
        alert(err.message);
        busy(false);
      }
    };
    closeBtn.onclick = async () => {
      busy(true);
      try {
        await ui.api('/api/toggle-business-closed', 'POST', { site: r.site, slug: l.slug, closed: true });
        done();
      } catch (err) {
        alert(err.message);
        busy(false);
      }
    };
    noInfoBtn.onclick = async () => {
      busy(true);
      try {
        await ui.api('/api/dismiss-check', 'POST', { site: r.site, checkKey: 'hours', slug: l.slug });
        done();
      } catch (err) {
        alert(err.message);
        busy(false);
      }
    };
    return li;
  };
  const f = (n) => n.toLocaleString('en-ZA');
  const checkPill = (c) => h('span', { class: `pill ${c.count === 0 ? 'pass' : c.count / Math.max(1, r.total) > 0.25 ? 'fail' : 'warn'}` }, f(c.count));

  // ── KPIs ──
  const unclaimed = r.owners ? r.owners.unclaimed.length : null;
  const kpis = ui.kpis([
    ['Quality score', `${r.score}%`, `${f(r.complete)} of ${f(r.total)} listings complete`, ui.HELP.listings.quality],
    ['Possible duplicates', f(r.duplicates.count), 'groups to check', ui.HELP.listings.duplicates],
    [`Not updated ${r.stale.days} days`, f(r.stale.count), 'listings', ui.HELP.listings.stale],
    ['Unclaimed', unclaimed == null ? '–' : f(unclaimed), 'getting enquiries', ui.HELP.listings.unclaimed],
  ]);

  // ── Primary: score ring + what's missing bars ──
  const tone = r.score >= 85 ? 'good' : r.score >= 65 ? 'ok' : 'bad';
  const bars = h('div');
  ui.charts.barList(bars, { items: r.checks.map((c) => ({ label: c.label, value: c.count, color: c.count === 0 ? 'var(--good)' : c.count / Math.max(1, r.total) > 0.25 ? 'var(--critical)' : 'var(--warn)' })) });
  const primary = ui.card({
    title: 'Data quality',
    help: ui.HELP.listings.quality,
    actions: h('a', { class: 'btn small', href: `${site}/admin/businesses/`, target: '_blank', rel: 'noopener' }, `Edit in ${ui.siteName(r.site)} admin`, ui.icon('ext', 13)),
    body: h(
      'div',
      { class: 'two' },
      h(
        'div',
        { class: 'score-card' },
        h('div', { class: `score-ring ${tone}`, style: `--p:${r.score}`, role: 'img', 'aria-label': `Data quality ${r.score}%` }, h('b', {}, `${r.score}%`)),
        h('p', { class: 'sub' }, `${f(r.complete)} of ${f(r.total)} published listings have everything: a phone, hours, a proper description, an address and a category.`)
      ),
      h('div', {}, h('h3', {}, 'What’s missing'), bars)
    ),
  });

  // ── Tabs ──
  const hoursTab = () => {
    const c = r.checks.find((x) => x.key === 'hours');
    if (!c) return ui.state.empty('No opening-hours check for this city.');
    const pill = checkPill(c);
    return ui.card({
      title: c.label,
      sub: c.why,
      actions: pill,
      body: c.count ? h('ul', { class: 'linklist' }, c.listings.map((l) => hoursRow(l, pill)), more(c.count, c.listings.length)) : h('p', { class: 'msg ok' }, 'None. Nice.'),
    });
  };
  const basicsTab = () => {
    const others = r.checks.filter((x) => x.key !== 'hours');
    if (!others.length) return ui.state.empty('No other checks for this city.');
    return h(
      'div',
      { class: 'inbox' },
      others.map((c) =>
        h(
          'details',
          { class: 'card inbox-item' },
          h('summary', {}, checkPill(c), h('span', { class: 'inbox-main' }, h('b', {}, c.label), h('span', { class: 'meta' }, c.why)), ui.icon('chevron', 16)),
          h('div', { class: 'inbox-body' }, c.count ? h('ul', { class: 'linklist' }, c.listings.map(listingLink), more(c.count, c.listings.length)) : h('p', { class: 'msg ok' }, 'None. Nice.'))
        )
      )
    );
  };
  const dupTab = () =>
    ui.card({
      title: 'Possible duplicates',
      help: ui.HELP.listings.duplicates,
      body: h(
        'div',
        {},
        r.duplicates.groups.length
          ? h(
              'ul',
              { class: 'rows' },
              r.duplicates.groups.map((g) => {
                const li = h(
                  'li',
                  {},
                  h('div', { class: 'row-main' }, h('span', { class: 'meta' }, `${g.reason}${g.reason === 'Same name in the same suburb' ? '' : `: ${g.key}`}`), h('ul', { class: 'linklist' }, g.listings.map(listingLink))),
                  h(
                    'button',
                    {
                      class: 'btn small',
                      type: 'button',
                      onclick: async (e) => {
                        if (!confirm('Mark this as not a duplicate? It won’t be flagged again.')) return;
                        // Captured now: e.currentTarget is only live for the
                        // synchronous part of the handler — by the time the
                        // awaited call below resolves it's already null.
                        const btn = e.currentTarget;
                        btn.disabled = true;
                        try {
                          await ui.api('/api/dismiss-duplicate', 'POST', { site: r.site, groupKey: g.groupKey });
                          li.remove();
                        } catch (err) {
                          alert(err.message);
                          btn.disabled = false;
                        }
                      },
                    },
                    'Not duplicate'
                  )
                );
                return li;
              })
            )
          : ui.state.empty('No duplicates found. Same phone, same website or same name in the same suburb.'),
        h('p', { class: 'note' }, 'Branches of one business can share a phone or website: only merge or hide the ones that are really the same place.')
      ),
    });
  const staleTab = () => {
    // Indexed / Noindex totals (cached an hour by the Indexing screen's API).
    const gateCount = h('b', {}, '…');
    const gateNote = h('span', { class: 'meta' }, '');
    const gateRow = h('li', {}, h('span', { class: 'row-main' }, 'Index gate', ui.help(ui.HELP.listings.indexScore)), gateCount, gateNote, h('a', { class: 'meta', href: '#/index-gate' }, 'Open Listings to fix'));
    ui.api('/api/index-gate')
      .then((g) => {
        const x = g.sites.find((s) => s.slug === r.site);
        if (!x || x.error || !x.totals) throw new Error(x?.error || 'no data');
        gateCount.textContent = `${x.totals.indexed.toLocaleString('en-ZA')} indexed`;
        gateNote.textContent = `${x.totals.noindex.toLocaleString('en-ZA')} noindex`;
      })
      .catch(() => ((gateCount.textContent = '–'), (gateNote.textContent = 'not available yet')));
    const tidy = ui.card({
      title: 'Tidy-up',
      body: h(
        'ul',
        { class: 'rows compact' },
        [
          ['Possible duplicates', r.duplicates.count, 'groups', ui.HELP.listings.duplicates],
          [`Not updated in ${r.stale.days} days`, r.stale.count, 'listings', ui.HELP.listings.stale],
          ['No views in 90 days', r.no_views.count, 'listings', ui.HELP.listings.noViews],
          ['Thin pages (1–2 businesses)', r.thin.count, `of ${r.thin.pages} pages, always noindexed`, ui.HELP.listings.thin],
        ].map(([label, n, unit, tip]) => h('li', {}, h('span', { class: 'row-main' }, label, ui.help(tip)), h('b', {}, f(n)), h('span', { class: 'meta' }, unit))),
        // Per-listing scores aren't available yet: show the city's totals from the Indexing screen.
        gateRow
      ),
    });
    return h(
      'div',
      { class: 'stack' },
      tidy,
      h(
        'div',
        { class: 'two' },
        ui.card({
          title: `Not updated in ${r.stale.days} days (${f(r.stale.count)})`,
          help: ui.HELP.listings.stale,
          body: h('div', {}, r.stale.count ? h('ul', { class: 'linklist' }, r.stale.listings.slice(0, 50).map(listingLink), more(r.stale.count, 50)) : h('p', { class: 'msg ok' }, 'None.'), h('p', { class: 'note' }, 'Worth checking these are still open: the closed-business routine also looks for them.')),
        }),
        ui.card({
          title: `No views in 90 days (${f(r.no_views.count)})`,
          help: ui.HELP.listings.noViews,
          body: h('div', {}, r.no_views.count ? h('ul', { class: 'linklist' }, r.no_views.listings.slice(0, 50).map(listingLink), more(r.no_views.count, 50)) : h('p', { class: 'msg ok' }, 'None.'), h('p', { class: 'note' }, 'Listed for more than 90 days with no visits at all: usually a missing description or a very niche category.')),
        })
      )
    );
  };
  const ownersTab = () => ownersSection(ui, r, listingLink);

  return h(
    'div',
    {},
    kpis,
    primary,
    ui.tabs(
      [
        { id: 'hours', label: 'Hours', render: hoursTab },
        { id: 'basics', label: 'Missing basics', render: basicsTab },
        { id: 'duplicates', label: 'Duplicates', render: dupTab },
        { id: 'stale', label: 'Stale & unseen', render: staleTab },
        { id: 'owners', label: 'Owners & enquiries', render: ownersTab },
      ],
      { store: 'hub.tab.listings' }
    ),
    bar
  );
}

function ownersSection(ui, r, listingLink) {
  const { h } = ui;
  const o = r.owners;
  if (!o) return ui.state.empty('No owner data for this city yet.');
  const card = (title, items, row, empty, note, tip) =>
    ui.card({ title: `${title} (${items.length})`, help: tip, body: h('div', {}, items.length ? h('ul', { class: 'linklist' }, items.map(row)) : h('p', { class: 'msg ok' }, empty), note ? h('p', { class: 'note' }, note) : null) });
  return h(
    'div',
    { class: 'three' },
    card('Enquiries that never reached the business', o.unreached, (x) => listingLink({ slug: x.slug, name: x.name, detail: `${x.n} enquir${x.n === 1 ? 'y' : 'ies'}, last ${ui.ago(x.last)}` }), 'None: every enquiry was emailed on.', 'No email address on file, so visitors’ enquiries went nowhere (last 60 days). Find an email for these, or the business loses customers.'),
    card('Unclaimed businesses getting enquiries', o.unclaimed, (x) => listingLink({ slug: x.slug, name: x.name, detail: `${x.n} enquir${x.n === 1 ? 'y' : 'ies'}` }), 'None.', 'Good candidates to contact: invite them to claim their free listing (and later, a paid plan).', ui.HELP.listings.unclaimed),
    card('Owners who never confirmed', o.unconfirmed, (x) => h('li', {}, h('b', {}, x.name), h('span', { class: 'meta' }, ` · approved ${ui.ago(x.approved)}${x.reminded ? `, reminded ${ui.ago(x.reminded)}` : ''}`)), 'None waiting.', 'Approved listings still waiting for the owner to confirm by email. Resend the email from the site’s Submissions screen.')
  );
}
