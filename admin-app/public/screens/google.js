// Google: how the sites do in Google Search, day by day. Clicks and
// impressions, how many pages Google shows (the indexing trend), Google's
// verdict per page ("not indexed" list), and search gaps, both on Google and
// on the sites' own search. Filled in each morning by the "Hub Admin Google
// data" workflow.

export async function render(view, ui) {
  const { h, fill, api, mobileHead, pageHead, errorBox } = ui;
  const head = (d) => [mobileHead('Google'), pageHead('Google', 'How your sites do in Google Search: clicks, pages Google shows, pages it leaves out, and what people search for.', d?.generated_at ? h('span', { class: 'updated' }, `Google data from ${ui.ago(d.generated_at)}`) : null)];
  fill(view, head(), h('div', { class: 'skeleton' }));
  let d;
  try {
    d = await api('/api/google');
  } catch (e) {
    fill(view, head(), errorBox(e));
    return;
  }
  if (!d.generated_at) {
    fill(
      view,
      head(d),
      h(
        'section',
        { class: 'card' },
        h('div', { class: 'empty' }, h('b', {}, 'The first Google data arrives tomorrow morning'), 'The “Hub Admin Google data” workflow runs each morning at about 05:40. To fill this in now: GitHub → Actions → Hub Admin Google data → Run workflow.')
      ),
      gapsOnSite(ui, d)
    );
    return;
  }
  fill(view, head(d), tiles(ui, d), charts(ui, d), perSite(ui, d), indexSection(ui, d), h('h2', { class: 'section-title' }, 'Search gaps'), gapsGoogle(ui, d), gapsOnSite(ui, d));
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
  const idx = all.filter((s) => s.index);
  const indexed = idx.reduce((a, s) => a + s.index.indexed, 0);
  const checked = idx.reduce((a, s) => a + s.index.checked, 0);
  const delta = (cur, prev) => {
    if (!prev) return h('div', { class: 'delta' }, 'no earlier data');
    const p = Math.round(((cur - prev) / prev) * 100);
    return h('div', { class: `delta ${p > 0 ? 'up' : p < 0 ? 'down' : ''}` }, `${p > 0 ? '▲' : p < 0 ? '▼' : '■'} ${Math.abs(p)}% vs the week before`);
  };
  const H = ui.HELP.google;
  const tile = (label, value, d2, help) => ui.tile(label, value, d2, help);
  const f = ui.charts.fmt.int;
  return h(
    'div',
    { class: 'tiles' },
    tile('Clicks from Google (7 days)', f(c7), delta(c7, p7), H.clicks),
    tile('Times shown in Google (7 days)', ui.charts.fmt.short(i7), delta(i7, pi7), H.impressions),
    tile('Pages seen in Google (latest day)', f(seen), seen28 ? h('div', { class: `delta ${seen >= seen28 ? 'up' : 'down'}` }, `${seen >= seen28 ? '▲' : '▼'} from ${f(seen28)} four weeks earlier`) : h('div', { class: 'delta' }, 'pages with at least one impression'), H.pagesSeen),
    tile('Pages Google has indexed', checked ? `${Math.round((indexed / checked) * 100)}%` : '–', h('div', { class: 'delta' }, `of the ${f(checked)} pages checked so far`), H.indexed)
  );
}

function charts(ui, d) {
  const { h } = ui;
  const { lineChart, fmt } = ui.charts;
  const dates = [...new Set(d.sites.flatMap((s) => s.daily.map((x) => x.date)))].sort();
  const series = (key, src = 'daily') =>
    d.sites.map((s) => {
      const m = new Map(s[src].map((x) => [x.date, x[key]]));
      return { name: ui.siteName(s.slug), short: ui.siteName(s.slug), color: ui.siteColor(s.slug), values: (src === 'daily' ? dates : seenDates).map((x) => m.get(x) ?? 0) };
    });
  const seenDates = [...new Set(d.sites.flatMap((s) => s.pages_seen.map((x) => x.date)))].sort().slice(-90);
  const clicks = h('div');
  const impressions = h('div');
  const seen = h('div');
  const ctr = h('div');
  const pos = h('div');
  const H = ui.HELP.google;
  const out = h(
    'div',
    {},
    h('div', { class: 'two' }, h('section', { class: 'card' }, h('h2', { class: 'card-sub' }, 'Clicks from Google per day', ui.help(H.clicks)), clicks), h('section', { class: 'card' }, h('h2', { class: 'card-sub' }, 'Times shown in Google per day', ui.help(H.impressions)), impressions)),
    h(
      'section',
      { class: 'card', style: 'margin-top:16px' },
      h('h2', { class: 'card-sub' }, 'Indexing trend: pages seen in Google per day', ui.help(H.pagesSeen)),
      h('p', { class: 'sub', style: 'margin-top:0' }, 'How many different pages of each site appeared in Google results each day. When Google drops pages from its index, this line falls first.'),
      seen
    ),
    h('div', { class: 'two', style: 'margin-top:16px' }, h('section', { class: 'card' }, h('h2', { class: 'card-sub' }, 'Click-through rate per day', ui.help(H.ctr)), ctr), h('section', { class: 'card' }, h('h2', { class: 'card-sub' }, 'Average position per day (lower is better)', ui.help(H.position)), pos))
  );
  const pct = (v) => `${(v * 100).toFixed(1)}%`;
  requestAnimationFrame(() => {
    lineChart(ctr, { x: dates, series: series('ctr'), format: pct, label: 'Click-through rate per day', height: 200 });
    lineChart(pos, { x: dates, series: series('position'), format: (v) => v.toFixed(1), label: 'Average position per day (lower is better)', height: 200 });
    lineChart(clicks, { x: dates, series: series('clicks'), label: 'Clicks per day', height: 220 });
    lineChart(impressions, { x: dates, series: series('impressions'), format: fmt.short, label: 'Impressions per day', height: 220 });
    lineChart(seen, { x: seenDates, series: series('pages', 'pages_seen'), label: 'Pages seen in Google per day', height: 240 });
  });
  return out;
}

function indexSection(ui, d) {
  const { h } = ui;
  const sites = d.sites.filter((s) => s.index);
  if (!sites.length) return null;
  return h(
    'div',
    {},
    h('h2', { class: 'section-title' }, 'Pages Google leaves out', ui.help(ui.HELP.google.leftOut)),
    h(
      'div',
      { class: 'three' },
      sites.map((s) => {
        const i = s.index;
        const states = h('div');
        ui.charts.barList(states, { items: i.states.slice(0, 6).map((x) => ({ label: x.state, value: x.n, color: x.indexed ? 'var(--good)' : 'var(--critical)' })) });
        return h(
          'section',
          { class: 'card' },
          h('h3', { class: 'card-sub inline-city' }, h('span', { class: 'city-dot', style: `background:${ui.siteColor(s.slug)}` }), ui.siteName(s.slug)),
          h('p', { class: 'sub', style: 'margin-top:0' }, `${i.indexed.toLocaleString('en-ZA')} of ${i.checked.toLocaleString('en-ZA')} pages checked are in Google (${i.sitemap_urls.toLocaleString('en-ZA')} in the sitemap; up to 150 checked a day).`),
          states,
          i.not_indexed_count
            ? h(
                'details',
                { style: 'margin-top:12px' },
                h('summary', {}, `${i.not_indexed_count.toLocaleString('en-ZA')} not in Google`),
                h('ul', { class: 'linklist' }, i.not_indexed.slice(0, 150).map((p) => h('li', {}, h('a', { href: `https://${s.domain}${p.path}`, target: '_blank', rel: 'noopener' }, p.path), h('span', { class: 'meta' }, ` · ${p.kind} · ${p.state}${p.last_crawl ? ` · crawled ${p.last_crawl}` : ''}${p.checked ? ` · checked ${p.checked}` : ''}`))))
              )
            : h('p', { class: 'msg ok' }, 'Every page checked is in Google.')
        );
      })
    ),
    h('p', { class: 'note' }, '“Crawled – currently not indexed” and “Discovered – currently not indexed” mean Google knows the page but chose not to show it yet: usually thin pages or a new site. “Excluded by noindex” is on purpose.')
  );
}

function gapsGoogle(ui, d) {
  const { h } = ui;
  const rows = d.sites.flatMap((s) => s.gaps.map((g) => ({ ...g, slug: s.slug }))).sort((a, b) => b.impressions - a.impressions).slice(0, 25);
  return h(
    'section',
    { class: 'card' },
    h('h3', { class: 'card-sub' }, 'On Google: searches where you’re just off page one', ui.help(ui.HELP.google.gapsGoogle)),
    h('p', { class: 'sub', style: 'margin-top:0' }, 'People search for these and your site appears, but on page 2 or lower (last 30 days). A better page for each could bring real visitors.'),
    rows.length
      ? ui.charts.dataTable(
          [
            { key: 'query', label: 'Search', render: (r) => h('span', { class: 'inline-city' }, h('span', { class: 'city-dot', style: `background:${ui.siteColor(r.slug)}` }), r.query) },
            { key: 'impressions', label: 'Shown', help: ui.HELP.google.impressions, num: true, format: ui.charts.fmt.int },
            { key: 'clicks', label: 'Clicks', help: ui.HELP.google.clicks, num: true, format: ui.charts.fmt.int },
            { key: 'position', label: 'Avg position', help: ui.HELP.google.position, num: true, format: (v) => v.toFixed(1) },
          ],
          rows
        )
      : h('p', { class: 'msg ok' }, 'None yet.')
  );
}

function gapsOnSite(ui, d) {
  const { h } = ui;
  const rows = d.sites.flatMap((s) => s.onsite_thin.map((q) => ({ ...q, slug: s.slug }))).sort((a, b) => b.people - a.people).slice(0, 30);
  return h(
    'section',
    { class: 'card', style: 'margin-top:16px' },
    h('h3', { class: 'card-sub' }, 'On your sites: searches with only one or two results', ui.help(ui.HELP.google.gapsOnSite)),
    h('p', { class: 'sub', style: 'margin-top:0' }, 'What visitors searched for on the sites (last 30 days) that showed only one or two businesses. These tell you which businesses or categories to add next. (Searches with no results at all aren’t recorded by the sites yet.)'),
    rows.length
      ? h('ul', { class: 'linklist cols' }, rows.map((r) => h('li', {}, h('span', { class: 'inline-city' }, h('span', { class: 'city-dot', style: `background:${ui.siteColor(r.slug)}` }), h('b', {}, r.query)), h('span', { class: 'meta' }, ` · ${r.people} ${r.people === 1 ? 'person' : 'people'}, ${r.results} result${r.results === 1 ? '' : 's'}`))))
      : h('p', { class: 'msg ok' }, 'Nothing yet: every common search shows three or more businesses.')
  );
}

function perSite(ui, d) {
  const { h } = ui;
  const H = ui.HELP.google;
  const f = ui.charts.fmt.int;
  return h(
    'div',
    {},
    h('h2', { class: 'section-title' }, 'Per site'),
    d.sites.map((s) => {
      return h(
        'section',
        { class: 'card', style: 'margin-bottom:16px' },
        h('h3', { class: 'card-sub inline-city' }, h('span', { class: 'city-dot', style: `background:${ui.siteColor(s.slug)}` }), ui.siteName(s.slug)),
        s.error ? h('p', { class: 'sub', style: 'margin-top:0;opacity:.7' }, `Google data problem: ${s.error}`) : null,
        h(
          'div',
          { class: 'tiles' },
          ui.tile('Protected pages', s.protectedPages ? f(s.protectedPages.count) : '–', h('div', { class: 'delta' }, s.protectedPages ? 'always kept in Google' : 'list not published yet'), H.protectedPages)
        ),
        h('h4', { class: 'card-sub' }, 'Top Google searches', ui.help(H.topQueries)),
        s.top.length
          ? ui.charts.dataTable(
              [
                { key: 'query', label: 'Query' },
                { key: 'clicks', label: 'Clicks', help: H.clicks, num: true, format: f },
                { key: 'impressions', label: 'Impressions', help: H.impressions, num: true, format: f },
                { key: 'ctr', label: 'CTR', help: H.ctr, num: true, render: (r) => document.createTextNode(`${((r.impressions ? r.clicks / r.impressions : 0) * 100).toFixed(1)}%`) },
                { key: 'position', label: 'Position', help: H.position, num: true, format: (v) => v.toFixed(1) },
              ],
              s.top
            )
          : h('p', { class: 'sub' }, 'No searches recorded yet.')
      );
    })
  );
}
