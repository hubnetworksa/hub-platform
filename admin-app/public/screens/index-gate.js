// Listings to fix: content score per listing (out of 15). Information only;
// the optional Google gate lives in a collapsed Advanced card.

export async function render(view, ui) {
  const { h, fill, api, mobileHead, pageHead, errorBox } = ui;
  const head = [mobileHead('Listings to fix'), pageHead('Listings to fix', 'Every listing is scored out of 15 for real content. Nothing is hidden from Google — this screen shows what to improve.')];
  fill(view, head, h('div', { class: 'skeleton' }));
  let d;
  try {
    d = await api('/api/index-gate?review=6');
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
      const r = await api(`/api/index-gate?review=6&refresh=${encodeURIComponent(slug)}`);
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
    card.replaceChildren(title, h('p', { class: 'sub', style: 'margin-top:0' }, `Listing data unavailable: ${s.error}`));
    return;
  }
  const max = s.max ?? 15;
  const hist = s.histogram || [];
  const totalListings = s.totals?.listings ?? hist.reduce((a, x) => a + x.total, 0);
  const review = s.reviewThreshold ?? 6;
  const gateOn = (s.threshold ?? 0) > 0;
  const projected = (t) => hist.reduce((a, x) => a + (x.score >= t ? x.total : x.forced || 0), 0);

  const tile = (label, value, tip) => h('div', { class: 'tile', title: tip }, h('div', { class: 'label' }, label), h('div', { class: 'value' }, value));
  const tiles = h(
    'div',
    { class: 'tiles' },
    tile('Listings', f(totalListings), ui.HELP.indexGate.listings),
    tile('Weak', f(s.weakCount ?? 0), ui.HELP.indexGate.weak),
    tile('Almost there', f(s.almostCount ?? 0), ui.HELP.indexGate.almost),
    tile('Protected', f(s.totals?.protected ?? 0), ui.HELP.indexGate.protected)
  );
  title.appendChild(h('span', { class: 'pill', title: ui.HELP.indexGate.gate, style: 'margin-left:8px;font-size:12px' }, gateOn ? `Google gate: on, threshold ${s.threshold}` : 'Google gate: off'));

  const chart = h('div');
  requestAnimationFrame(() => {
    ui.charts.columnChart(chart, {
      x: hist.map((x) => x.score),
      series: [{ name: 'Listings', color, colorAt: (i) => (hist[i].score < review ? 'var(--muted)' : color), values: hist.map((x) => x.total) }],
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

  const labels = Object.fromEntries((s.missingSignals || []).map((m) => [m.key, m.label]));
  const almost = s.almost || [];
  const weakest = s.weakest || [];
  const mkTable = (rows) =>
    rows.length
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
          rows.map((r) => ({ ...r, missingText: (r.missing || []).map((k) => labels[k] || k).join(', ') }))
        )
      : null;
  const table = mkTable(almost);
  const weakTable = mkTable(weakest);
  const advanced = h(
    'details',
    { class: 'advanced' },
    h('summary', {}, 'Advanced: hide weak listings from Google'),
    h('p', { class: 'banner' }, 'Off by owner decision — only turn on if you want listings below the score left out of Google.'),
    form
  );
  const sect = (text, tip) => h('p', { class: 'sub' }, text + ' ', ui.help(tip));

  card.replaceChildren(
    title,
    tiles,
    sect('Listings per content score', ui.HELP.indexGate.listings),
    chart,
    sect('What weak listings are missing', ui.HELP.indexGate.missing),
    bars,
    table ? sect(`Almost there: one point under the review score of ${review} (${f(s.almostCount ?? almost.length)} in total)`, ui.HELP.indexGate.almost) : null,
    table,
    weakTable ? sect(`Weakest listings (${f(s.weakCount ?? weakest.length)} below ${review})`, ui.HELP.indexGate.weakest) : null,
    weakTable,
    advanced
  );
}
