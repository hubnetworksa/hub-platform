// Analytics: who visits the sites and what they look at, from Google Analytics
// (GA4, filled in each morning by the "Hub Admin Google data" workflow), plus a
// first-party funnel (sessions -> listing views -> contact taps -> enquiries).
// One site at a time; every GA figure covers the report's last 28 days.

const MISSING = 'Not in this report yet — runs tomorrow';
const DAYS = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

export async function render(view, ui) {
  const { h, fill, api, mobileHead, pageHead, errorBox } = ui;
  const head = (d) => [mobileHead('Analytics'), pageHead('Analytics', 'Who visits each site and what they look at, from Google Analytics. Every figure covers the last 28 days.', d?.generated_at ? h('span', { class: 'updated' }, `Analytics data from ${ui.ago(d.generated_at)}`) : null)];
  fill(view, head(), h('div', { class: 'skeleton' }));
  let d;
  try {
    d = await api('/api/analytics');
  } catch (e) {
    fill(view, head(), liveEl, errorBox(e));
    return;
  }
  if (!d.generated_at) {
    fill(view, head(d), liveEl, h('section', { class: 'card' }, h('div', { class: 'empty' }, h('b', {}, 'The first Analytics data arrives tomorrow morning'), 'The “Hub Admin Google data” workflow runs each morning at about 05:40. To fill this in now: GitHub → Actions → Hub Admin Google data → Run workflow.')));
    return;
  }
  if (!d.sites.some((s) => s.analytics)) {
    fill(view, head(d), liveEl, setupNote(ui));
    return;
  }
  let current = d.sites.find((s) => s.slug === (ui.store?.get ? ui.store.get('hub.analyticsSite', '') : ''))?.slug ?? d.sites[0].slug;
  const draw = () => {
    const s = d.sites.find((x) => x.slug === current);
    const tabs = h(
      'div',
      { class: 'filters' },
      h('div', { class: 'seg', role: 'group', 'aria-label': 'Site' }, d.sites.map((x) => h('button', { type: 'button', 'aria-pressed': String(x.slug === current), onclick: () => ((current = x.slug), ui.store?.set && ui.store.set('hub.analyticsSite', current), draw()) }, ui.siteName(x.slug))))
    );
    fill(view, head(d), liveEl, tabs, siteBody(ui, s));
  };
  draw();
}

const num = (v) => Number(v) || 0;
const pct = (v) => `${Math.round(num(v) * 100)}%`;
const mmss = (sec) => {
  const t = Math.round(num(sec));
  return `${Math.floor(t / 60)}:${String(t % 60).padStart(2, '0')}`;
};

// Change vs the previous 28 days. `lowerIsBetter` flips the colour.
function delta(ui, cur, prev, fmtDiff, lowerIsBetter = false) {
  const { h } = ui;
  if (!prev) return h('div', { class: 'delta' }, 'no earlier data');
  const diff = cur - prev;
  const good = lowerIsBetter ? diff < 0 : diff > 0;
  const cls = diff === 0 ? '' : good ? 'up' : 'down';
  return h('div', { class: `delta ${cls}` }, `${diff > 0 ? '▲' : diff < 0 ? '▼' : '■'} ${fmtDiff(Math.abs(diff))} vs the 28 days before`);
}

function card(ui, title, helpText, body, cls = 'card') {
  const { h } = ui;
  return h('section', { class: cls }, h('h3', { class: 'card-sub' }, title, helpText ? ui.help(helpText) : null), body);
}

function missing(ui) {
  return ui.h('p', { class: 'sub', style: 'margin:0' }, MISSING);
}

function siteBody(ui, s) {
  const { h } = ui;
  const a = s.analytics;
  if (!a) return setupNote(ui);
  if (a.error) {
    const hint = /403|permission|scope/i.test(a.error) ? ' (the Google sign-in lacks the Analytics scope, or the account lacks Viewer access to this property)' : '';
    return h('section', { class: 'card' }, h('p', { class: 'sub', style: 'margin-top:0' }, `Analytics: ${a.error}${hint}`));
  }
  const H = ui.HELP.analytics;
  const gap = 'margin-top:16px';
  return h(
    'div',
    {},
    funnel(ui, s, H),
    h('div', { class: 'section-title', style: gap }, 'Who visits'),
    sessionsChart(ui, a),
    whoTiles(ui, a, H),
    h('div', { class: 'three', style: gap }, channelsCard(ui, a, H), sourcesCard(ui, a, H), citiesCard(ui, a, H)),
    h('div', { class: 'three', style: gap }, devicesCard(ui, a, H), hoursCard(ui, a, H), weekdaysCard(ui, a, H)),
    h('div', { class: 'section-title', style: gap }, 'What they look at'),
    h('div', { class: 'three', style: gap }, landingCard(ui, a, H), topPagesCard(ui, a, H), eventsCard(ui, a, H))
  );
}

function funnel(ui, s, H) {
  const { h } = ui;
  const f = ui.charts.fmt.int;
  const fp = s.firstParty || {};
  const taps = num(fp.contacts?.phone) + num(fp.contacts?.whatsapp) + num(fp.contacts?.website);
  const steps = [
    ['Sessions', fp.sessions, H.sessions],
    ['Listing views', fp.views, null],
    ['Contact taps', taps, null],
    ['Enquiries', fp.enquiries, null],
  ];
  const cells = [];
  steps.forEach(([label, value, help], i) => {
    const prev = i ? steps[i - 1][1] : null;
    const note = i === 0 ? 'Google Analytics' : value == null || !prev ? '—' : `${Math.round((num(value) / num(prev)) * 100)}% of ${steps[i - 1][0].toLowerCase()}`;
    cells.push(ui.tile(label, value == null ? '—' : f(value), note, help));
    if (i < steps.length - 1) cells.push(h('div', { class: 'funnel-arrow', 'aria-hidden': 'true', style: 'align-self:center;font-size:20px;color:var(--muted)' }, '→'));
  });
  return card(ui, 'Funnel (last 28 days)', H.funnel, h('div', { style: 'display:grid;grid-template-columns:repeat(auto-fit,minmax(130px,1fr));gap:8px;align-items:stretch' }, cells));
}

function sessionsChart(ui, a) {
  const { h } = ui;
  if (!a.daily?.length) return card(ui, 'Sessions per day (last 90 days)', null, missing(ui));
  const chart = h('div');
  requestAnimationFrame(() => {
    ui.charts.lineChart(chart, {
      x: a.daily.map((x) => x.date),
      series: [{ name: 'Sessions', short: 'Sessions', color: 'var(--s1)', values: a.daily.map((x) => x.sessions) }],
      label: 'Sessions per day',
      height: 220,
    });
  });
  return card(ui, 'Sessions per day (last 90 days)', ui.HELP.analytics.sessions, chart);
}

function whoTiles(ui, a, H) {
  const { h } = ui;
  const e = a.engagement;
  const nr = a.newVsReturning;
  const nrTotal = nr ? nr.new + nr.returning : 0;
  return h(
    'div',
    { class: 'tiles', style: 'margin-top:16px' },
    e ? ui.tile('Engagement rate', pct(e.cur.engagementRate), delta(ui, e.cur.engagementRate, e.prev.engagementRate, (x) => `${Math.round(x * 100)} pts`), H.engagementRate) : ui.tile('Engagement rate', '—', MISSING, H.engagementRate),
    e ? ui.tile('Avg. time on site', mmss(e.cur.averageSessionDuration), delta(ui, e.cur.averageSessionDuration, e.prev.averageSessionDuration, mmss), H.avgTime) : ui.tile('Avg. time on site', '—', MISSING, H.avgTime),
    nr && nrTotal ? ui.tile('New vs returning', `${Math.round((nr.new / nrTotal) * 100)}% / ${Math.round((nr.returning / nrTotal) * 100)}%`, 'new / returning people', H.newVsReturning) : ui.tile('New vs returning', '—', MISSING, H.newVsReturning),
    e ? ui.tile('Bounce rate', pct(e.cur.bounceRate), delta(ui, e.cur.bounceRate, e.prev.bounceRate, (x) => `${Math.round(x * 100)} pts`, true), H.bounceRate) : ui.tile('Bounce rate', '—', MISSING, H.bounceRate)
  );
}

function bars(ui, list, label = 'name', valueKey = 'sessions') {
  const el = ui.h('div');
  ui.charts.barList(el, { items: list.map((x) => ({ label: x[label] || '(not set)', value: x[valueKey] })) });
  return el;
}

const channelsCard = (ui, a, H) => card(ui, 'Channels', H.channels, a.channels ? bars(ui, a.channels) : missing(ui));
const sourcesCard = (ui, a, H) => card(ui, 'Top sources', H.sources, a.sources ? bars(ui, a.sources) : missing(ui));
const citiesCard = (ui, a, H) => card(ui, 'Top cities', H.cities, a.cities ? bars(ui, a.cities) : missing(ui));

function columns(ui, x, values, label) {
  const el = ui.h('div');
  requestAnimationFrame(() => ui.charts.columnChart(el, { x, series: [{ name: 'Sessions', short: 'Sessions', color: 'var(--s1)', values }], label, height: 180 }));
  return el;
}

const cap = (s) => (s ? s[0].toUpperCase() + s.slice(1) : s);
function devicesCard(ui, a, H) {
  return card(ui, 'Devices', H.devices, a.devices?.length ? columns(ui, a.devices.map((x) => cap(x.name)), a.devices.map((x) => x.sessions), 'Sessions by device') : missing(ui));
}
function hoursCard(ui, a, H) {
  return card(ui, 'Busiest hours', H.hours, a.byHour?.length ? columns(ui, a.byHour.map((x) => String(x.hour)), a.byHour.map((x) => x.sessions), 'Sessions by hour of day') : missing(ui));
}
function weekdaysCard(ui, a, H) {
  return card(ui, 'Busiest days', H.weekdays, a.byWeekday?.length ? columns(ui, a.byWeekday.map((x) => DAYS[x.day] ?? String(x.day)), a.byWeekday.map((x) => x.sessions), 'Sessions by day of week') : missing(ui));
}

function landingCard(ui, a, H) {
  if (!a.landing) return card(ui, 'Landing pages by type', H.landing, missing(ui));
  const by = new Map();
  for (const l of a.landing) by.set(l.type, (by.get(l.type) || 0) + num(l.sessions));
  const list = [...by].map(([name, sessions]) => ({ name, sessions })).sort((x, y) => y.sessions - x.sessions);
  return card(ui, 'Landing pages by type', H.landing, bars(ui, list));
}

function topPagesCard(ui, a, H) {
  const f = ui.charts.fmt.int;
  return card(
    ui,
    'Top pages',
    H.topPages,
    a.topPages?.length
      ? ui.charts.dataTable(
          [
            { key: 'path', label: 'Page' },
            { key: 'pageviews', label: 'Page views', num: true, format: f },
            { key: 'users', label: 'Users', num: true, format: f, help: ui.HELP.analytics.users },
          ],
          a.topPages.slice(0, 10)
        )
      : missing(ui)
  );
}

function eventsCard(ui, a, H) {
  return card(
    ui,
    'Top events',
    H.events,
    a.events?.length
      ? ui.charts.dataTable(
          [
            { key: 'name', label: 'Event' },
            { key: 'count', label: 'Times', num: true, format: ui.charts.fmt.int },
          ],
          a.events
        )
      : missing(ui)
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
