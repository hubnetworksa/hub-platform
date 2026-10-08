// Indexing: which listings each city shows to Google (content score gate), and
// the per-city threshold the owner can tune.

export async function render(view, ui) {
  const { h, fill, api, mobileHead, pageHead, errorBox } = ui;
  const head = [mobileHead('Indexing'), pageHead('Indexing', 'Only listings with enough real content are shown to Google. Everything else stays live but hidden from Google’s index.')];
  fill(view, head, h('div', { class: 'skeleton' }));
  let d;
  try {
    d = await api('/api/index-gate');
  } catch (e) {
    fill(view, head, errorBox(e));
    return;
  }
  const grid = h('div', { class: 'three', style: 'margin-top:16px' });
  const slot = {};
  for (const s of d.sites) {
    slot[s.slug] = h('section', { class: 'card' });
    grid.appendChild(slot[s.slug]);
    paint(ui, slot[s.slug], s, reload);
  }
  fill(view, head, grid);

  async function reload(slug) {
    try {
      const r = await api(`/api/index-gate?refresh=${encodeURIComponent(slug)}`);
      const s = r.sites.find((x) => x.slug === slug);
      if (s) paint(ui, slot[slug], s, reload);
    } catch {
      /* keep the old card */
    }
  }
}

function paint(ui, card, s, reload) {
  const { h } = ui;
  const f = ui.charts.fmt.int;
  const color = ui.siteColor ? ui.siteColor(s.slug) : 'var(--s1)';
  const title = h('h3', { class: 'card-sub inline-city' }, h('span', { class: 'city-dot', style: `background:${color}` }), s.name || ui.siteName(s.slug));
  if (s.error) {
    card.replaceChildren(title, h('p', { class: 'sub', style: 'margin-top:0' }, `Indexing data unavailable: ${s.error}`));
    return;
  }
  const max = s.max ?? 15;
  const hist = s.histogram || [];
  const totalListings = s.totals?.listings ?? hist.reduce((a, x) => a + x.total, 0);
  const projected = (t) => hist.reduce((a, x) => a + (x.score >= t ? x.total : x.forced || 0), 0);

  const tile = (label, value, tip) => h('div', { class: 'tile', title: tip }, h('div', { class: 'label' }, label), h('div', { class: 'value' }, value));
  const tiles = h(
    'div',
    { class: 'tiles' },
    tile('Indexed', f(s.totals?.indexed ?? 0), 'Listings Google is allowed to show'),
    tile('Noindex', f(s.totals?.noindex ?? 0), 'Live for visitors, hidden from Google until improved'),
    tile('Protected', f(s.totals?.protected ?? 0), 'Had Google impressions in the last 90 days — never hidden'),
    tile('Threshold', String(s.threshold), 'Minimum content score (0–15) a listing needs')
  );

  const chart = h('div');
  requestAnimationFrame(() => {
    ui.charts.columnChart(chart, {
      x: hist.map((x) => x.score),
      series: [{ name: 'Listings', color, colorAt: (i) => (hist[i].score < s.threshold ? 'var(--muted)' : color), values: hist.map((x) => x.total) }],
      label: 'Listings per content score',
      height: 200,
    });
  });

  const bars = h('div');
  ui.charts.barList(bars, { items: (s.missingSignals || []).map((m) => ({ label: m.label, value: m.count, sub: `+${m.points} pts`, color })) });

  const input = h('input', { class: 'input', type: 'number', min: '0', max: String(max), step: '1', value: String(s.threshold), style: 'max-width:100px', inputmode: 'numeric' });
  const live = h('p', { class: 'sub', style: 'margin:0' });
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
        if (!confirm(`Set ${s.name} threshold to ${t}? About ${f(projected(t))} of ${f(totalListings)} listings will be indexed. The site rebuilds within ~15 minutes.`)) return;
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

  const labels = Object.fromEntries((s.missingSignals || []).map((m) => [m.key, m.label]));
  const almost = s.almost || [];
  const table = almost.length
    ? ui.charts.dataTable(
        [
          {
            key: 'name',
            label: 'Name',
            render: (r) => h('a', { href: `https://${s.domain}/business/${r.slug}/`, target: '_blank', rel: 'noopener' }, r.name),
          },
          { key: 'suburb', label: 'Suburb' },
          { key: 'score', label: 'Score', num: true },
          { key: 'missingText', label: 'Missing' },
        ],
        almost.map((r) => ({ ...r, missingText: (r.missing || []).map((k) => labels[k] || k).join(', ') }))
      )
    : null;

  card.replaceChildren(
    title,
    s.protectedList?.source === 'missing' ? h('p', { class: 'banner' }, 'No Search Console page list yet — the gate stays off for this city until the weekly Search Console report has run.') : null,
    tiles,
    h('p', { class: 'sub' }, 'Listings per content score'),
    chart,
    h('p', { class: 'sub' }, 'What noindexed listings are missing'),
    bars,
    h('p', { class: 'sub' }, 'Threshold'),
    form,
    table ? h('p', { class: 'sub' }, `Almost there: listings one point short of the threshold — the quickest wins (${f(s.almostCount ?? almost.length)} in total)`) : null,
    table
  );
}
