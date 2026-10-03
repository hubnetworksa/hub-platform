// Listings: how good each city's listings are. A completeness score, what's
// missing (phone, hours, description, map location, address, category),
// likely duplicates, stale listings, listings nobody has viewed, and thin
// category-in-suburb pages. Each listing opens on the site; editing happens
// in that city's admin (Businesses).

let current = null;

export async function render(view, ui, refresh) {
  const { h, fill, api, mobileHead, pageHead, errorBox } = ui;
  const head = () => [mobileHead('Listings'), pageHead('Listings', 'How complete and tidy each city’s listings are, and what to fix first.')];
  if (!view.querySelector('.listings')) fill(view, head(), h('div', { class: 'skeleton' }));
  let d;
  try {
    d = await api(`/api/listings${refresh ? `?refresh=${refresh}` : ''}`);
  } catch (e) {
    fill(view, head(), errorBox(e));
    return;
  }
  if (!current || !d.reports.some((r) => r.site === current)) current = d.reports[0]?.site;
  const body = h('div', { class: 'listings' });
  const draw = () => {
    const r = d.reports.find((x) => x.site === current);
    fill(
      body,
      h(
        'div',
        { class: 'filters' },
        h('div', { class: 'seg', role: 'group', 'aria-label': 'City' }, d.reports.map((x) => h('button', { type: 'button', 'aria-pressed': String(x.site === current), onclick: () => ((current = x.site), draw()) }, `${ui.siteName(x.site)} · ${x.score}%`))),
        h('span', { class: 'updated' }, `Worked out ${ui.ago(r.updated_at)} · `, h('button', { class: 'linkish', type: 'button', onclick: (e) => ((e.currentTarget.disabled = true), render(view, ui, r.site)) }, 'Recheck now'))
      ),
      cityReport(ui, r)
    );
  };
  draw();
  fill(view, head(), body);
}

function cityReport(ui, r) {
  const { h } = ui;
  const site = `https://${r.domain}`;
  const listingLink = (l) => h('li', {}, h('a', { href: `${site}/business/${l.slug}/`, target: '_blank', rel: 'noopener' }, l.name), h('span', { class: 'meta' }, [l.suburb, l.detail].filter(Boolean).map((x) => ` · ${x}`).join('')));
  const more = (count, shown) => (count > shown ? h('li', { class: 'meta' }, `…and ${count - shown} more`) : null);
  const tone = r.score >= 85 ? 'good' : r.score >= 65 ? 'ok' : 'bad';
  return h(
    'div',
    {},
    h(
      'div',
      { class: 'two' },
      h(
        'section',
        { class: 'card score-card' },
        h('div', { class: `score-ring ${tone}`, style: `--p:${r.score}`, role: 'img', 'aria-label': `Data quality ${r.score}%` }, h('b', {}, `${r.score}%`)),
        h(
          'div',
          {},
          h('h2', {}, 'Data quality'),
          h('p', { class: 'sub' }, `${r.complete.toLocaleString('en-ZA')} of ${r.total.toLocaleString('en-ZA')} published listings have everything: a phone, hours, a proper description, a map location, an address and a category.`),
          h('a', { class: 'btn small', href: `${site}/admin/businesses/`, target: '_blank', rel: 'noopener' }, `Edit in ${ui.siteName(r.site)} admin`, ui.icon('ext', 13))
        )
      ),
      h(
        'section',
        { class: 'card' },
        h('h2', { class: 'card-sub' }, 'Tidy-up'),
        h(
          'ul',
          { class: 'rows compact' },
          [
            ['Possible duplicates', r.duplicates.count, 'groups'],
            [`Not updated in ${r.stale.days} days`, r.stale.count, 'listings'],
            ['No views in 90 days', r.no_views.count, 'listings'],
            ['Thin pages (1–2 businesses)', r.thin.count, `of ${r.thin.pages} category-in-suburb pages`],
          ].map(([label, n, unit]) => h('li', {}, h('span', { class: 'row-main' }, label), h('b', {}, n.toLocaleString('en-ZA')), h('span', { class: 'meta' }, unit)))
        )
      )
    ),
    h('h2', { class: 'section-title' }, 'What’s missing'),
    h(
      'div',
      { class: 'inbox' },
      r.checks.map((c) =>
        h(
          'details',
          { class: 'card inbox-item' },
          h('summary', {}, h('span', { class: `pill ${c.count === 0 ? 'pass' : c.count / Math.max(1, r.total) > 0.25 ? 'fail' : 'warn'}` }, c.count.toLocaleString('en-ZA')), h('span', { class: 'inbox-main' }, h('b', {}, c.label), h('span', { class: 'meta' }, c.why)), ui.icon('chevron', 16)),
          h('div', { class: 'inbox-body' }, c.count ? h('ul', { class: 'linklist' }, c.listings.map(listingLink), more(c.count, c.listings.length)) : h('p', { class: 'msg ok' }, 'None. Nice.'))
        )
      )
    ),
    h('h2', { class: 'section-title' }, 'Possible duplicates'),
    h(
      'section',
      { class: 'card' },
      r.duplicates.groups.length
        ? h(
            'ul',
            { class: 'rows' },
            r.duplicates.groups.map((g) => h('li', {}, h('div', { class: 'row-main' }, h('span', { class: 'meta' }, `${g.reason}${g.reason === 'Same name in the same suburb' ? '' : `: ${g.key}`}`), h('ul', { class: 'linklist' }, g.listings.map(listingLink)))))
          )
        : h('div', { class: 'empty' }, h('b', {}, 'No duplicates found'), 'Same phone, same website or same name in the same suburb.'),
      h('p', { class: 'note' }, 'Branches of one business can share a phone or website: only merge or hide the ones that are really the same place.')
    ),
    h('h2', { class: 'section-title' }, 'Stale and unseen'),
    h(
      'div',
      { class: 'two' },
      h('section', { class: 'card' }, h('h3', { class: 'card-sub' }, `Not updated in ${r.stale.days} days (${r.stale.count})`), r.stale.count ? h('ul', { class: 'linklist' }, r.stale.listings.slice(0, 50).map(listingLink), more(r.stale.count, 50)) : h('p', { class: 'msg ok' }, 'None.'), h('p', { class: 'note' }, 'Worth checking these are still open: the closed-business routine also looks for them.')),
      h('section', { class: 'card' }, h('h3', { class: 'card-sub' }, `No views in 90 days (${r.no_views.count})`), r.no_views.count ? h('ul', { class: 'linklist' }, r.no_views.listings.slice(0, 50).map(listingLink), more(r.no_views.count, 50)) : h('p', { class: 'msg ok' }, 'None.'), h('p', { class: 'note' }, 'Listed for more than 90 days with no visits at all: usually a missing description or a very niche category.'))
    ),
    h('h2', { class: 'section-title' }, 'Thin pages'),
    h(
      'section',
      { class: 'card' },
      h('p', { class: 'sub', style: 'margin-top:0' }, `${r.thin.count} of ${r.thin.pages} “category in suburb” pages list only one or two businesses. Google often skips pages like these. Adding a few more businesses to the busiest ones (or better descriptions) helps the whole site.`),
      r.thin.list.length ? h('ul', { class: 'linklist cols' }, r.thin.list.slice(0, 120).map((t) => h('li', {}, h('a', { href: `${site}${t.path}`, target: '_blank', rel: 'noopener' }, t.label), h('span', { class: 'meta' }, ` · ${t.n}`))), more(r.thin.count, Math.min(120, r.thin.list.length))) : null
    )
  );
}
