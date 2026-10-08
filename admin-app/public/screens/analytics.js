// Analytics: visits to the sites from Google Analytics (GA4): sessions, users
// and page views, and the most viewed pages. Filled in each morning by the
// "Hub Admin Google data" workflow.

export async function render(view, ui) {
  const { h, fill, api, mobileHead, pageHead, errorBox } = ui;
  const head = (d) => [mobileHead('Analytics'), pageHead('Analytics', 'Visits to your sites from Google Analytics: sessions, people, page views and the pages people read most.', d?.generated_at ? h('span', { class: 'updated' }, `Analytics data from ${ui.ago(d.generated_at)}`) : null)];
  fill(view, head(), h('div', { class: 'skeleton' }));
  let d;
  try {
    d = await api('/api/analytics');
  } catch (e) {
    fill(view, head(), errorBox(e));
    return;
  }
  if (!d.generated_at) {
    fill(view, head(d), h('section', { class: 'card' }, h('div', { class: 'empty' }, h('b', {}, 'The first Analytics data arrives tomorrow morning'), 'The “Hub Admin Google data” workflow runs each morning at about 05:40. To fill this in now: GitHub → Actions → Hub Admin Google data → Run workflow.')));
    return;
  }
  if (!d.sites.some((s) => s.analytics)) {
    fill(view, head(d), setupNote(ui));
    return;
  }
  fill(view, head(d), tiles(ui, d), chartCard(ui, d), perSite(ui, d));
}

function tiles(ui, d) {
  const { h } = ui;
  const ok = d.sites.filter((s) => s.analytics && !s.analytics.error && s.analytics.daily);
  if (!ok.length) return null;
  const f = ui.charts.fmt.int;
  const tot = (key, k) => ok.reduce((a, s) => a + (s.analytics[key]?.[k] || 0), 0);
  const delta = (cur, prev) => {
    if (!prev) return h('div', { class: 'delta' }, 'no earlier data');
    const p = Math.round(((cur - prev) / prev) * 100);
    return h('div', { class: `delta ${p > 0 ? 'up' : p < 0 ? 'down' : ''}` }, `${p > 0 ? '▲' : p < 0 ? '▼' : '■'} ${Math.abs(p)}% vs the week before`);
  };
  const tile = (label, value, d2) => h('div', { class: 'tile' }, h('div', { class: 'label' }, label), h('div', { class: 'value' }, value), d2);
  return h(
    'div',
    { class: 'tiles' },
    tile('Sessions (7 days)', f(tot('totals7', 'sessions')), delta(tot('totals7', 'sessions'), tot('prev7', 'sessions'))),
    tile('Active users (7 days)', f(tot('totals7', 'users')), delta(tot('totals7', 'users'), tot('prev7', 'users'))),
    tile('Page views (7 days)', f(tot('totals7', 'pageviews')), delta(tot('totals7', 'pageviews'), tot('prev7', 'pageviews'))),
    tile('Page views (28 days)', f(tot('totals28', 'pageviews')), h('div', { class: 'delta' }, 'all sites together'))
  );
}

function chartCard(ui, d) {
  const { h } = ui;
  const ok = d.sites.filter((s) => s.analytics && !s.analytics.error && s.analytics.daily);
  if (!ok.length) return null;
  const dates = [...new Set(ok.flatMap((s) => s.analytics.daily.map((x) => x.date)))].sort();
  const chart = h('div');
  requestAnimationFrame(() => {
    ui.charts.lineChart(chart, {
      x: dates,
      series: ok.map((s) => {
        const m = new Map(s.analytics.daily.map((x) => [x.date, x.sessions]));
        return { name: ui.siteName(s.slug), short: ui.siteName(s.slug), color: ui.siteColor(s.slug), values: dates.map((x) => m.get(x) ?? 0) };
      }),
      label: 'Sessions per day',
      height: 220,
    });
  });
  return h('section', { class: 'card', style: 'margin-top:16px' }, h('h2', { class: 'card-sub' }, 'Sessions per day (last 90 days)'), chart);
}

function perSite(ui, d) {
  const { h } = ui;
  const f = ui.charts.fmt.int;
  return h(
    'div',
    { class: 'three', style: 'margin-top:16px' },
    d.sites
      .filter((s) => s.analytics)
      .map((s) => {
        const a = s.analytics;
        const title = h('h3', { class: 'card-sub inline-city' }, h('span', { class: 'city-dot', style: `background:${ui.siteColor(s.slug)}` }), ui.siteName(s.slug));
        if (a.error) {
          const hint = /403|permission|scope/i.test(a.error) ? ' (the Google sign-in lacks the Analytics scope, or the account lacks Viewer access to this property)' : '';
          return h('section', { class: 'card' }, title, h('p', { class: 'sub', style: 'margin-top:0' }, `Analytics: ${a.error}${hint}`));
        }
        return h(
          'section',
          { class: 'card' },
          title,
          h('p', { class: 'sub', style: 'margin-top:0' }, 'Top pages (28 days)'),
          a.topPages?.length
            ? ui.charts.dataTable(
                [
                  { key: 'path', label: 'Page' },
                  { key: 'pageviews', label: 'Page views', num: true, format: f },
                  { key: 'users', label: 'Users', num: true, format: f },
                ],
                a.topPages.slice(0, 10)
              )
            : h('p', { class: 'msg ok' }, 'No visits recorded yet.')
        );
      })
  );
}

function setupNote(ui) {
  const { h } = ui;
  return h(
    'section',
    { class: 'card' },
    h('h3', { class: 'card-sub' }, 'Traffic for every page (Google Analytics)'),
    h('p', { class: 'sub', style: 'margin-top:0' }, 'The sites already send visits to Google Analytics. To show them here, the Google sign-in used by the reports needs read access to Analytics:'),
    h(
      'ol',
      { class: 'steps' },
      h('li', {}, 'Run “node scripts/google-auth.mjs” to create a new refresh token for the same Google account with the extra scope “analytics.readonly”.'),
      h('li', {}, 'Replace the GOOGLE_REFRESH_TOKEN repository secret with it.'),
      h('li', {}, 'Re-run the “Hub Admin Google data” workflow (GitHub → Actions): the next report adds page traffic here.')
    )
  );
}
