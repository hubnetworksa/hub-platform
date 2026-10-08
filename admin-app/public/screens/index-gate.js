// Listings to fix: content score per listing (out of 15). Information only;
// the optional Google gate lives in the Advanced tab, off by default.
// One site at a time: the top-bar selector, or the chip row below the tiles
// (when "All sites" is chosen the first site is shown).

export async function render(view, ui) {
  const { h, fill, api } = ui;
  ui.page({ title: 'Listings to fix', context: 'Every listing is scored out of 15 for real content. Nothing is hidden from Google — this screen shows what to improve.' });
  fill(view, ui.state.loading());
  let d;
  try {
    d = await api('/api/index-gate?review=6');
  } catch (e) {
    fill(view, ui.state.error(e));
    return;
  }
  if (!d.sites.length) {
    fill(view, ui.state.empty('No sites reported yet.'));
    return;
  }
  const pickSite = () => {
    const g = ui.site();
    return d.sites.some((s) => s.slug === g) ? g : d.sites[0].slug;
  };
  let current = pickSite();

  async function reload(slug) {
    try {
      const r = await api(`/api/index-gate?review=6&refresh=${encodeURIComponent(slug)}`);
      const s = r.sites.find((x) => x.slug === slug);
      if (s) {
        d.sites = d.sites.map((x) => (x.slug === slug ? s : x));
        draw();
      }
    } catch {
      /* keep the old view */
    }
  }

  const draw = () => {
    const s = d.sites.find((x) => x.slug === current) ?? d.sites[0];
    const chips =
      d.sites.length > 1
        ? h(
            'div',
            { class: 'filters' },
            h(
              'div',
              { class: 'seg', role: 'group', 'aria-label': 'Site' },
              d.sites.map((x) =>
                h(
                  'button',
                  {
                    type: 'button',
                    'aria-pressed': String(x.slug === s.slug),
                    onclick: () => {
                      current = x.slug;
                      draw();
                    },
                  },
                  x.name || ui.siteName(x.slug)
                )
              )
            )
          )
        : null;
    fill(view, chips, s.error ? ui.card({ title: s.name || ui.siteName(s.slug), body: ui.state.empty(`Listing data unavailable: ${s.error}`) }) : siteView(ui, s, reload));
  };
  ui.onSiteChange(() => {
    current = pickSite();
    draw();
  });
  draw();
}

function siteView(ui, s, reload) {
  const { h } = ui;
  const f = ui.charts.fmt.int;
  const IG = ui.HELP.indexGate;
  const color = ui.siteColor ? ui.siteColor(s.slug) : 'var(--s1)';
  const max = s.max ?? 15;
  const hist = s.histogram || [];
  const totalListings = s.totals?.listings ?? hist.reduce((a, x) => a + x.total, 0);
  const review = s.reviewThreshold ?? 6;
  const gateOn = (s.threshold ?? 0) > 0;
  const projected = (t) => hist.reduce((a, x) => a + (x.score >= t ? x.total : x.forced || 0), 0);

  const kpis = ui.kpis([
    ['Listings', f(totalListings), null, IG.listings],
    ['Weak', f(s.weakCount ?? 0), null, IG.weak],
    ['Almost there', f(s.almostCount ?? 0), null, IG.almost],
    ['Protected', f(s.totals?.protected ?? 0), null, IG.protected],
  ]);

  // Primary: score histogram; bars below the review score are muted.
  const chart = h('div');
  requestAnimationFrame(() => {
    ui.charts.columnChart(chart, {
      x: hist.map((x) => x.score),
      series: [{ name: 'Listings', color, colorAt: (i) => (hist[i].score < review ? 'var(--muted)' : color), values: hist.map((x) => x.total) }],
      label: 'Listings per content score',
    });
  });
  const primary = ui.card({
    title: `${s.name || ui.siteName(s.slug)}: listings per content score`,
    help: IG.listings,
    sub: `Grey bars are below the review score of ${review}.`,
    actions: h('span', { class: 'pill', title: IG.gate }, gateOn ? `Google gate: on, threshold ${s.threshold}` : 'Google gate: off'),
    body: chart,
  });

  const labels = Object.fromEntries((s.missingSignals || []).map((m) => [m.key, m.label]));
  const almost = s.almost || [];
  const weakest = s.weakest || [];
  const mkTable = (rows, empty) =>
    rows.length
      ? ui.charts.dataTable(
          [
            { key: 'name', label: 'Name', render: (r) => h('a', { href: `https://${s.domain}/business/${r.slug}/`, target: '_blank', rel: 'noopener' }, r.name) },
            { key: 'suburb', label: 'Suburb' },
            { key: 'score', label: 'Score', num: true },
            { key: 'missingText', label: 'Missing' },
          ],
          rows.map((r) => ({ ...r, missingText: (r.missing || []).map((k) => labels[k] || k).join(', ') }))
        )
      : ui.state.empty(empty);

  const missingTab = () => {
    const bars = h('div');
    ui.charts.barList(bars, { items: (s.missingSignals || []).map((m) => ({ label: m.label, value: m.count, sub: `+${m.points} pts`, color })) });
    return ui.card({ title: 'What weak listings are missing', help: IG.missing, body: bars });
  };
  const weakTab = () => ui.card({ title: `Weakest listings (${f(s.weakCount ?? weakest.length)} below ${review})`, help: IG.weakest, body: mkTable(weakest, 'No weak listings.') });
  const almostTab = () => ui.card({ title: `Almost there: one point under the review score of ${review} (${f(s.almostCount ?? almost.length)} in total)`, help: IG.almost, body: mkTable(almost, 'Nothing is one point short.') });

  const advancedTab = () => {
    const input = h('input', { class: 'input', type: 'number', min: '0', max: String(max), step: '1', value: String(s.threshold), inputmode: 'numeric' });
    const live = h('p', { class: 'sub' });
    const msg = h('p', { class: 'msg', role: 'status' });
    const val = () => Math.min(max, Math.max(0, Math.round(Number(input.value) || 0)));
    const update = () => (live.textContent = `Would index ${f(projected(val()))} of ${f(totalListings)} listings`);
    input.addEventListener('input', update);
    update();
    const btn = h('button', { class: 'btn primary', type: 'submit' }, 'Apply & rebuild');
    const form = h(
      'form',
      {
        class: 'form',
        onsubmit: async (e) => {
          e.preventDefault();
          const t = val();
          if (!confirm(`Set ${s.name} threshold to ${t}? About ${f(totalListings - projected(t))} of ${f(totalListings)} listings would be hidden from Google. The site rebuilds within ~15 minutes.`)) return;
          btn.disabled = true;
          try {
            await ui.api('/api/index-gate', 'POST', { site: s.slug, threshold: t });
            msg.className = 'msg ok';
            msg.textContent = 'Saved — rebuilding';
            if (reload) await reload(s.slug);
          } catch (err) {
            msg.className = 'msg err';
            msg.textContent = err.message;
          } finally {
            btn.disabled = false;
          }
        },
      },
      h('label', { class: 'field' }, h('span', {}, 'Minimum content score'), input),
      live,
      h('div', {}, btn),
      msg
    );
    return ui.card({
      body: h('details', { class: 'advanced' }, h('summary', {}, 'Advanced: hide weak listings from Google'), h('p', { class: 'banner' }, 'Off by owner decision — only turn on if you want listings below the score left out of Google.'), form),
    });
  };

  return h(
    'div',
    {},
    kpis,
    primary,
    ui.tabs(
      [
        { id: 'missing', label: 'What’s missing', render: missingTab },
        { id: 'weakest', label: 'Weakest listings', render: weakTab },
        { id: 'almost', label: 'Almost there', render: almostTab },
        { id: 'advanced', label: 'Advanced', render: advancedTab },
      ],
      { store: 'hub.tab.index-gate' }
    )
  );
}
