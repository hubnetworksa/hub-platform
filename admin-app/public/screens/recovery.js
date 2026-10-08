// Site recovery: is Google bringing a site back after the September 2026 spam
// update? Baseline (the week before 24 September) against now, trends, the
// indexing state of the key pages and a checklist of recovery milestones.
// Data: /api/recovery (daily Google report + daily indexing snapshots).

const CHANGES = [
  ['8 Oct', 'Discovery and shopping-centre routines paused, so no new thin pages are being added.'],
  ['8 Oct', 'Internal linking added: suburb pages now list their businesses, and listings show related listings.'],
  ['8 Oct', 'Listing scoring added as a fix list. Nothing is hidden; weak listings are queued to be improved.'],
  ['8 Oct', 'Sitemaps resubmitted to Google.'],
  ['29 Sep', '3,874 thin Pretoria listings deleted (before this work).'],
  ['24–26 Sep', 'Google September 2026 spam update: impressions fell from about 7,000 a day to about 20.'],
];

export async function render(view, ui) {
  const { h, fill, api } = ui;
  const H = ui.HELP.recovery;
  let picked = null; // a chip choice that overrides the top-bar site
  let lastGlobal = ui.site();

  const draw = async () => {
    const global = ui.site();
    if (global !== lastGlobal) ((lastGlobal = global), (picked = null));
    const slug = picked ?? (global !== 'all' ? global : 'pretoria');
    ui.page({ title: 'Site recovery', context: `Is Google bringing ${ui.siteName(slug)} back? Baseline is the week before 24 September.` });
    fill(view, ui.state.loading());
    let d;
    try {
      d = await api(`/api/recovery?site=${encodeURIComponent(slug)}`);
    } catch (e) {
      fill(view, ui.state.error(e));
      return;
    }
    if (d.generatedAt) ui.setUpdated(d.generatedAt);
    const chips = h(
      'div',
      { class: 'chip-bar', role: 'group', 'aria-label': 'Choose a site' },
      d.sites.map((s) => h('button', { type: 'button', class: 'chip-btn', 'aria-pressed': String(s.slug === d.site), onclick: () => ((picked = s.slug), draw()) }, ui.siteName(s.slug)))
    );
    if (!d.generatedAt || !d.series.length) {
      fill(view, chips, ui.card({ body: ui.state.empty(d.error || 'The first Google data arrives tomorrow morning.') }));
      return;
    }
    fill(
      view,
      chips,
      d.error ? h('p', { class: 'msg err' }, `Google data problem: ${d.error}`) : null,
      tiles(ui, d, H),
      primary(ui, d, H),
      ui.tabs(
        [
          { id: 'milestones', label: 'Milestones', render: () => milestones(ui, d, H) },
          { id: 'indexing', label: 'Indexing', render: () => indexing(ui, d, H) },
          { id: 'searches', label: 'Searches', render: () => searches(ui, d, H) },
          { id: 'changes', label: 'What was changed', render: () => changes(ui) },
        ],
        { store: 'hub.tab.recovery' }
      )
    );
  };
  ui.onSiteChange(draw);
  draw();
}

const pctNote = (ui, p, text) => (p == null ? ui.h('div', { class: 'delta' }, 'no baseline yet') : ui.h('div', { class: `delta ${p >= 50 ? 'up' : p < 25 ? 'down' : ''}` }, `${p}% of ${text}`));

function tiles(ui, d, H) {
  const { h } = ui;
  const f = ui.charts.fmt.int;
  return ui.kpis([
    ['Pages seen in Google (7-day avg)', f(d.now.pagesSeen), pctNote(ui, d.recoveryPct.pagesSeen, `baseline (${f(d.baseline.pagesSeen)})`), H.pagesSeen],
    ['Impressions (7-day avg)', ui.charts.fmt.short(d.now.impressions), pctNote(ui, d.recoveryPct.impressions, `baseline (${ui.charts.fmt.short(d.baseline.impressions)})`), H.impressions],
    ['Key pages indexed', `${d.keyPagesIndexed} of ${d.keyPages.length}`, h('div', { class: 'delta' }, 'home, category, suburb, about'), H.keyPages],
    ['Days since the drop', f(d.daysSinceCollapse), h('div', { class: 'delta' }, `since ${ui.charts.fmt.day(d.collapseDate)}`), H.days],
  ]);
}

function primary(ui, d, H) {
  const { h } = ui;
  const dates = d.series.map((x) => x.date);
  const el = h('div');
  requestAnimationFrame(() =>
    ui.charts.lineChart(el, {
      x: dates,
      series: [
        { name: 'Pages seen', short: 'Seen', color: ui.siteColor(d.site), values: d.series.map((x) => x.pagesSeen) },
        { name: 'Baseline', short: 'Baseline', color: 'var(--ink-3, #8a8a8a)', values: dates.map(() => d.baseline.pagesSeen) },
      ],
      label: 'Pages seen in Google per day against the baseline',
      size: 'sm',
    })
  );
  return ui.card({
    title: `Pages seen in Google per day (drop: ${ui.charts.fmt.dayLong(d.collapseDate)})`,
    help: H.baseline,
    sub: d.baselineNote ?? `The flat line is the baseline: ${ui.charts.fmt.int(d.baseline.pagesSeen)} pages a day in the 7 days before the drop.`,
    body: el,
  });
}

function milestones(ui, d, H) {
  const { h } = ui;
  const done = d.milestones.filter((m) => m.done).length;
  return ui.card({
    title: `Milestones: ${done} of ${d.milestones.length} reached`,
    help: H.milestones,
    body: h(
      'ul',
      { class: 'linklist' },
      d.milestones.map((m) =>
        h(
          'li',
          {},
          h('b', { style: m.done ? 'color:var(--good)' : '' }, m.done ? '✓ ' : '○ '),
          h('b', {}, m.label),
          m.done && m.when ? h('span', { class: 'meta' }, ` · ${ui.charts.fmt.dayLong(m.when)}`) : null,
          h('div', { class: 'meta' }, m.detail)
        )
      )
    ),
  });
}

function indexing(ui, d, H) {
  const { h } = ui;
  const keyTable = ui.charts.dataTable(
    [
      { key: 'path', label: 'Page', render: (r) => h('a', { href: `https://${d.domain}${r.path}`, target: '_blank', rel: 'noopener' }, r.path) },
      { key: 'state', label: 'Google says', help: H.state, render: (r) => h('span', { style: `color:${r.indexed ? 'var(--good)' : 'var(--critical)'}` }, r.state ?? 'Not checked yet') },
      { key: 'lastCrawl', label: 'Last crawl', help: H.lastCrawl, render: (r) => document.createTextNode(r.lastCrawl ?? '—') },
    ],
    d.keyPages
  );
  const typeTable = d.inspection.byType.length
    ? ui.charts.dataTable(
        [
          { key: 'kind', label: 'Page type' },
          { key: 'checked', label: 'Checked', num: true, format: ui.charts.fmt.int },
          { key: 'indexed', label: 'Indexed', help: H.pageType, num: true, format: ui.charts.fmt.int },
        ],
        d.inspection.byType
      )
    : h('p', { class: 'sub' }, 'No pages checked yet.');
  const snaps = d.series.filter((x) => x.sampled);
  let trend;
  if (snaps.length >= 2) {
    const el = h('div');
    requestAnimationFrame(() =>
      ui.charts.lineChart(el, {
        x: snaps.map((x) => x.date),
        series: [
          { name: 'Sampled pages indexed (%)', short: 'Sample %', color: 'var(--good, #2a9d6f)', values: snaps.map((x) => Math.round((x.indexedSample / x.sampled) * 100)) },
          { name: 'Key pages indexed (of 4)', short: 'Key pages', color: ui.siteColor(d.site), values: snaps.map((x) => x.keyPagesIndexed ?? 0) },
        ],
        label: 'Indexed share of the sample and key pages indexed',
        size: 'sm',
      })
    );
    trend = el;
  } else {
    trend = h('p', { class: 'sub' }, 'Trend starts tomorrow — snapshots are saved daily from now.');
  }
  return h(
    'div',
    { class: 'stack' },
    ui.card({ title: 'Key pages', help: H.keyPages, body: keyTable }),
    ui.card({
      title: 'Sampled pages by type',
      help: H.pageType,
      sub: `${ui.charts.fmt.int(d.inspection.indexed)} of ${ui.charts.fmt.int(d.inspection.checked)} sampled pages are indexed (${ui.charts.fmt.int(d.inspection.sitemapUrls)} URLs in the sitemap).`,
      body: typeTable,
    }),
    ui.card({ title: 'Indexing over time', help: H.sample, body: trend })
  );
}

function searches(ui, d, H) {
  const { h } = ui;
  const f = ui.charts.fmt.int;
  const q = d.queries;
  return ui.card({
    title: 'Top searches: this week against last week',
    help: H.queries,
    sub: `Queries with impressions: ${f(q.withImpressionsNow)} this week vs ${f(q.withImpressionsPrev)} last week${q.window ? ` (${q.window.startDate} to ${q.window.endDate})` : ''}.`,
    body: q.top.length
      ? ui.charts.dataTable(
          [
            { key: 'query', label: 'Search' },
            { key: 'impressions', label: 'Impressions (7d)', help: ui.HELP.google.impressions, num: true, format: f },
            { key: 'prev', label: 'Previous 7d', num: true, render: (r) => document.createTextNode(r.prev ? f(r.prev.impressions) : '—') },
            { key: 'position', label: 'Position', help: H.position, num: true, format: (v) => v.toFixed(1) },
          ],
          q.top
        )
      : h('p', { class: 'sub' }, 'No searches recorded yet.'),
  });
}

function changes(ui) {
  const { h } = ui;
  return ui.card({
    title: 'What was changed',
    sub: 'The recovery actions so far, newest first.',
    body: h('ul', { class: 'linklist' }, CHANGES.map(([when, what]) => h('li', {}, h('b', {}, when), h('span', { class: 'meta' }, ` · ${what}`)))),
  });
}
