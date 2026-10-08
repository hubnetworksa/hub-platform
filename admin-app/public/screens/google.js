// Google: how the sites do in Google Search, day by day. Clicks and
// impressions, how many pages Google shows (the indexing trend), Google's
// verdict per page ("not indexed" list), and search gaps, both on Google and
// on the sites' own search. Filled in each morning by the "Hub Admin Google
// data" workflow.

export async function render(view, ui) {
  const { h, fill, api } = ui;
  ui.page({ title: 'Google', context: 'How your sites do in Google Search: clicks, pages Google shows, pages it leaves out, and what people search for.' });
  fill(view, ui.state.loading());
  let d;
  try {
    d = await api('/api/google');
  } catch (e) {
    fill(view, ui.state.error(e));
    return;
  }
  if (d.generated_at) ui.setUpdated(d.generated_at);
  if (!d.generated_at) {
    fill(
      view,
      ui.card({
        body: ui.state.empty('The first Google data arrives tomorrow morning. The “Hub Admin Google data” workflow runs each morning at about 05:40. To fill this in now: GitHub → Actions → Hub Admin Google data → Run workflow.'),
      }),
      gapsOnSite(ui, d, d.sites)
    );
    return;
  }

  const draw = () => {
    const site = ui.site();
    const chosen = site === 'all' ? d.sites : d.sites.filter((s) => s.slug === site);
    const sites = chosen.length ? chosen : d.sites;
    const sub = { ...d, sites };
    fill(
      view,
      tiles(ui, sub),
      primary(ui, sub),
      ui.tabs(
        [
          { id: 'ctr', label: 'CTR & position', render: () => ctrPosition(ui, sub) },
          { id: 'indexing', label: 'Indexing', render: () => indexSection(ui, sub) },
          { id: 'top', label: 'Top searches', render: () => perSite(ui, sub) },
          { id: 'gaps', label: 'Search gaps', render: () => h('div', { class: 'stack' }, gapsGoogle(ui, sub), gapsOnSite(ui, sub, sites)) },
        ],
        { store: 'hub.tab.google' }
      )
    );
  };
  ui.onSiteChange(draw);
  draw();
}

const sum = (list, k) => list.reduce((a, r) => a + (r[k] || 0), 0);

function tiles(ui, d) {
  const { h } = ui;
  const all = d.sites;
  const lastN = (s, n, off = 0) => s.daily.slice(Math.max(0, s.daily.length - n - off), s.daily.length - off);
  const c7 = all.reduce((a, s) => a + sum(lastN(s, 7), 'clicks'), 0);
  const p7 = all.reduce((a, s) => a + sum(lastN(s, 7, 7), 'clicks'), 0);
  const i7 = all.reduce((a, s) => a + sum(lastN(s, 7), 'impressions'), 0);
  const pi7 = all.reduce((a, s) => a + sum(lastN(s, 7, 7), 'impressions'), 0);
  const seen = all.reduce((a, s) => a + (s.pages_seen.at(-1)?.pages ?? 0), 0);
  const seen28 = all.reduce((a, s) => a + (s.pages_seen.at(-29)?.pages ?? 0), 0);
  // Average position over the last 7 days, weighted by impressions.
  let posW = 0;
  let posN = 0;
  let prevW = 0;
  let prevN = 0;
  for (const s of all) {
    for (const r of lastN(s, 7)) if (r.position && r.impressions) ((posW += r.position * r.impressions), (posN += r.impressions));
    for (const r of lastN(s, 7, 7)) if (r.position && r.impressions) ((prevW += r.position * r.impressions), (prevN += r.impressions));
  }
  const pos = posN ? posW / posN : 0;
  const prevPos = prevN ? prevW / prevN : 0;
  const delta = (cur, prev) => {
    if (!prev) return h('div', { class: 'delta' }, 'no earlier data');
    const p = Math.round(((cur - prev) / prev) * 100);
    return h('div', { class: `delta ${p > 0 ? 'up' : p < 0 ? 'down' : ''}` }, `${p > 0 ? '▲' : p < 0 ? '▼' : '■'} ${Math.abs(p)}% vs the week before`);
  };
  const H = ui.HELP.google;
  const f = ui.charts.fmt.int;
  return ui.kpis([
    ['Clicks from Google (7 days)', f(c7), delta(c7, p7), H.clicks],
    ['Times shown in Google (7 days)', ui.charts.fmt.short(i7), delta(i7, pi7), H.impressions],
    ['Pages seen in Google (latest day)', f(seen), seen28 ? h('div', { class: `delta ${seen >= seen28 ? 'up' : 'down'}` }, `${seen >= seen28 ? '▲' : '▼'} from ${f(seen28)} four weeks earlier`) : h('div', { class: 'delta' }, 'pages with at least one impression'), H.pagesSeen],
    [
      'Average position (7 days)',
      pos ? pos.toFixed(1) : '–',
      prevPos && pos ? h('div', { class: `delta ${pos <= prevPos ? 'up' : 'down'}` }, `${pos <= prevPos ? '▲' : '▼'} from ${prevPos.toFixed(1)} the week before (lower is better)`) : h('div', { class: 'delta' }, 'lower is better'),
      H.position,
    ],
  ]);
}

// Series for one metric, one line per site.
function series(ui, d, key, src = 'daily', dates) {
  return d.sites.map((s) => {
    const m = new Map(s[src].map((x) => [x.date, x[key]]));
    return { name: ui.siteName(s.slug), short: ui.siteName(s.slug), color: ui.siteColor(s.slug), values: dates.map((x) => m.get(x) ?? 0) };
  });
}
const datesOf = (d, src = 'daily') => [...new Set(d.sites.flatMap((s) => s[src].map((x) => x.date)))].sort();

function primary(ui, d) {
  const { h } = ui;
  const { lineChart, fmt } = ui.charts;
  const H = ui.HELP.google;
  const dates = datesOf(d);
  const clicks = h('div');
  const impressions = h('div');
  requestAnimationFrame(() => {
    lineChart(clicks, { x: dates, series: series(ui, d, 'clicks', 'daily', dates), label: 'Clicks per day', size: 'sm' });
    lineChart(impressions, { x: dates, series: series(ui, d, 'impressions', 'daily', dates), format: fmt.short, label: 'Impressions per day', size: 'sm' });
  });
  return ui.card({
    title: 'Clicks and impressions per day',
    help: H.clicks,
    body: h('div', { class: 'two' }, h('div', {}, h('h3', {}, 'Clicks from Google', ui.help(H.clicks)), clicks), h('div', {}, h('h3', {}, 'Times shown in Google', ui.help(H.impressions)), impressions)),
  });
}

function ctrPosition(ui, d) {
  const { h } = ui;
  const { lineChart } = ui.charts;
  const H = ui.HELP.google;
  const dates = datesOf(d);
  const ctr = h('div');
  const pos = h('div');
  const pct = (v) => `${(v * 100).toFixed(1)}%`;
  requestAnimationFrame(() => {
    lineChart(ctr, { x: dates, series: series(ui, d, 'ctr', 'daily', dates), format: pct, label: 'Click-through rate per day', size: 'sm' });
    lineChart(pos, { x: dates, series: series(ui, d, 'position', 'daily', dates), format: (v) => v.toFixed(1), label: 'Average position per day (lower is better)', size: 'sm' });
  });
  return h(
    'div',
    { class: 'two' },
    ui.card({ title: 'Click-through rate per day', help: H.ctr, body: ctr }),
    ui.card({ title: 'Average position per day (lower is better)', help: H.position, body: pos })
  );
}

function indexSection(ui, d) {
  const { h } = ui;
  const H = ui.HELP.google;
  const seenDates = datesOf(d, 'pages_seen').slice(-90);
  const seen = h('div');
  requestAnimationFrame(() => ui.charts.lineChart(seen, { x: seenDates, series: series(ui, d, 'pages', 'pages_seen', seenDates), label: 'Pages seen in Google per day', size: 'sm' }));
  const trend = ui.card({
    title: 'Pages seen in Google per day',
    help: H.pagesSeen,
    sub: 'How many different pages of each site appeared in Google results each day. When Google drops pages from its index, this line falls first.',
    body: seen,
  });
  const f = ui.charts.fmt.int;
  const sites = d.sites.filter((s) => s.index);
  const blocks = sites.map((s) => {
    const i = s.index;
    const states = h('div');
    ui.charts.barList(states, { items: i.states.slice(0, 6).map((x) => ({ label: x.state, value: x.n, color: x.indexed ? 'var(--good)' : 'var(--critical)' })) });
    return ui.card({
      title: ui.siteName(s.slug),
      sub: `${i.indexed.toLocaleString('en-ZA')} of ${i.checked.toLocaleString('en-ZA')} pages checked are in Google (${i.sitemap_urls.toLocaleString('en-ZA')} in the sitemap; up to 150 checked a day).`,
      body: h(
        'div',
        {},
        errorLine(ui, s),
        ui.tile('Protected pages', s.protectedPages ? f(s.protectedPages.count) : '–', h('div', { class: 'delta' }, s.protectedPages ? 'always kept in Google' : 'list not published yet'), H.protectedPages),
        states,
        i.not_indexed_count
          ? h(
              'details',
              {},
              h('summary', {}, `${i.not_indexed_count.toLocaleString('en-ZA')} not in Google`),
              h('ul', { class: 'linklist' }, i.not_indexed.slice(0, 150).map((p) => h('li', {}, h('a', { href: `https://${s.domain}${p.path}`, target: '_blank', rel: 'noopener' }, p.path), h('span', { class: 'meta' }, ` · ${p.kind} · ${p.state}${p.last_crawl ? ` · crawled ${p.last_crawl}` : ''}${p.checked ? ` · checked ${p.checked}` : ''}`))))
            )
          : h('p', { class: 'msg ok' }, 'Every page checked is in Google.')
      ),
    });
  });
  // Sites without an index report still show their protected pages and any Google error.
  const others = d.sites
    .filter((s) => !s.index)
    .map((s) =>
      ui.card({
        title: ui.siteName(s.slug),
        body: h('div', {}, ui.tile('Protected pages', s.protectedPages ? f(s.protectedPages.count) : '–', h('div', { class: 'delta' }, s.protectedPages ? 'always kept in Google' : 'list not published yet'), H.protectedPages), errorLine(ui, s)),
      })
    );
  return h(
    'div',
    { class: 'stack' },
    trend,
    h('h3', {}, 'Pages Google leaves out', ui.help(H.leftOut)),
    h('div', { class: d.sites.length > 1 ? 'three' : '' }, blocks, others),
    d.sites.some((s) => s.index) ? h('p', { class: 'note' }, '“Crawled – currently not indexed” and “Discovered – currently not indexed” mean Google knows the page but chose not to show it yet: usually thin pages or a new site. “Excluded by noindex” is on purpose.') : null
  );
}

function errorLine(ui, s) {
  return s.error ? ui.h('p', { class: 'msg err' }, `${ui.siteName(s.slug)}: Google data problem: ${s.error}`) : null;
}

function gapsGoogle(ui, d) {
  const { h } = ui;
  const rows = d.sites.flatMap((s) => s.gaps.map((g) => ({ ...g, slug: s.slug }))).sort((a, b) => b.impressions - a.impressions).slice(0, 25);
  return ui.card({
    title: 'On Google: searches where you’re just off page one',
    help: ui.HELP.google.gapsGoogle,
    sub: 'People search for these and your site appears, but on page 2 or lower (last 30 days). A better page for each could bring real visitors.',
    body: rows.length
      ? ui.charts.dataTable(
          [
            { key: 'query', label: 'Search', render: (r) => h('span', { class: 'inline-city' }, h('span', { class: 'city-dot', style: `background:${ui.siteColor(r.slug)}` }), r.query) },
            { key: 'impressions', label: 'Shown', help: ui.HELP.google.impressions, num: true, format: ui.charts.fmt.int },
            { key: 'clicks', label: 'Clicks', help: ui.HELP.google.clicks, num: true, format: ui.charts.fmt.int },
            { key: 'position', label: 'Avg position', help: ui.HELP.google.position, num: true, format: (v) => v.toFixed(1) },
          ],
          rows
        )
      : h('p', { class: 'msg ok' }, 'None yet.'),
  });
}

function gapsOnSite(ui, d, sites) {
  const { h } = ui;
  const rows = (sites ?? d.sites).flatMap((s) => (s.onsite_thin ?? []).map((q) => ({ ...q, slug: s.slug }))).sort((a, b) => b.people - a.people).slice(0, 30);
  return ui.card({
    title: 'On your sites: searches with only one or two results',
    help: ui.HELP.google.gapsOnSite,
    sub: 'What visitors searched for on the sites (last 30 days) that showed only one or two businesses. These tell you which businesses or categories to add next. (Searches with no results at all aren’t recorded by the sites yet.)',
    body: rows.length
      ? h('ul', { class: 'linklist cols' }, rows.map((r) => h('li', {}, h('span', { class: 'inline-city' }, h('span', { class: 'city-dot', style: `background:${ui.siteColor(r.slug)}` }), h('b', {}, r.query)), h('span', { class: 'meta' }, ` · ${r.people} ${r.people === 1 ? 'person' : 'people'}, ${r.results} result${r.results === 1 ? '' : 's'}`))))
      : h('p', { class: 'msg ok' }, 'Nothing yet: every common search shows three or more businesses.'),
  });
}

function perSite(ui, d) {
  const { h } = ui;
  const H = ui.HELP.google;
  const f = ui.charts.fmt.int;
  return h(
    'div',
    { class: 'stack' },
    d.sites.map((s) =>
      ui.card({
        title: ui.siteName(s.slug),
        help: H.topQueries,
        sub: s.top_window ? `Top Google searches, last 7 days: ${s.top_window.startDate} to ${s.top_window.endDate}, compared with ${s.top_window.prevStartDate} to ${s.top_window.prevEndDate}` : 'Top Google searches, last 7 days',
        body: h(
          'div',
          {},
          errorLine(ui, s),
          s.top.length
            ? ui.charts.dataTable(
                [
                  { key: 'query', label: 'Search' },
                  { key: 'impressions', label: 'Impressions (7d)', help: H.impressions, num: true, format: f },
                  {
                    key: 'prev',
                    label: 'Previous 7d',
                    num: true,
                    render: (r) => {
                      if (!r.prev) return document.createTextNode('—');
                      const dl = r.impressions - r.prev.impressions;
                      const span = h('span', {}, f(r.prev.impressions));
                      if (dl !== 0) span.append(' ', h('small', { style: `opacity:.75;color:${dl > 0 ? 'var(--good)' : 'var(--critical)'}` }, `${dl > 0 ? '▲' : '▼'}${f(Math.abs(dl))}`));
                      return span;
                    },
                  },
                  { key: 'clicks', label: 'Clicks', help: H.clicks, num: true, format: f },
                  { key: 'position', label: 'Position', help: H.position, num: true, format: (v) => v.toFixed(1) },
                ],
                s.top
              )
            : h('p', { class: 'sub' }, 'No searches recorded yet.')
        ),
      })
    )
  );
}
