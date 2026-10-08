// Health: is everything working? Uptime per site (checked every 5 minutes) up
// top; GitHub deploys and scheduled jobs, Cloudflare database usage, routines,
// security checks and the weekly broken-links report live in tabs.

const pct = (v) => (v == null ? '–' : `${v.toFixed(v >= 99.95 || v === 0 ? 0 : 2)}%`);
const ms = (v) => (v == null ? '–' : v >= 1000 ? `${(v / 1000).toFixed(1)} s` : `${v} ms`);
const big = (n) => (n >= 1e6 ? `${(n / 1e6).toFixed(2)}M` : n >= 1e4 ? `${Math.round(n / 1000)}k` : Math.round(n).toLocaleString('en-ZA'));

export async function render(view, ui, refresh = '') {
  const { h, fill, api } = ui;
  const btn = h('button', { class: 'btn', type: 'button', onclick: () => render(view, ui) }, ui.icon('refresh', 15), 'Refresh');
  ui.page({ title: 'Health', context: 'Is everything working? Sites, deploys, routines, the database and security', actions: btn });
  if (!view.querySelector('.health')) fill(view, ui.state.loading());
  btn.disabled = true;
  let d;
  try {
    d = await api(`/api/health${refresh ? `?refresh=${refresh}` : ''}`);
  } catch (e) {
    btn.disabled = false;
    fill(view, ui.state.error(e));
    return;
  }
  btn.disabled = false;
  ui.setUpdated(new Date());
  const issues = d.security.checks.filter((c) => c.result !== 'pass').length;
  const broken = d.links ? Object.values(d.links.sites ?? {}).reduce((a, s) => a + (s.broken?.length ?? 0), 0) : 0;
  fill(
    view,
    h(
      'div',
      { class: 'health' },
      summary(ui, d),
      h('div', { class: 'three block' }, d.sites.map((s) => siteCard(ui, s))),
      ui.tabs(
        [
          { id: 'deploys', label: 'Deploys', render: () => workflowsCard(ui, d) },
          { id: 'database', label: 'Database', render: () => usageCard(ui, d.d1) },
          { id: 'routines', label: 'Routines', render: () => routinesCard(ui, d.routines) },
          { id: 'security', label: issues ? `Security (${issues})` : 'Security', render: () => securityCard(ui, d.security, () => render(view, ui, 'security')) },
          { id: 'links', label: broken ? `Broken links (${broken})` : 'Broken links', render: () => linksCard(ui, d.links) },
        ],
        { store: 'hub.tab.health' }
      )
    )
  );
}

function summary(ui, d) {
  const up = d.sites.filter((s) => s.latest?.ok).length;
  const failing = d.workflows.filter((w) => w.conclusion === 'failure' || w.conclusion === 'timed_out').length;
  const today = d.d1.today.reduce((a, r) => a + r.rows_read, 0);
  const usagePct = Math.round((today / d.d1.limits.rows_read) * 100);
  // Alerts fire on whichever of reads or writes is closer to its limit, so show both.
  const writtenToday = d.d1.today.reduce((a, r) => a + r.rows_written, 0);
  const writtenPct = Math.round((writtenToday / d.d1.limits.rows_written) * 100);
  const late = routineRows(d.routines).filter((r) => r.status === 'late').length;
  const H = ui.HELP.health;
  const tile = (label, value, note, help, bad) => ui.tile(label, value, note, help, { bad });
  return ui.kpis([
    tile('Sites up', `${up}/${d.sites.length}`, d.sites.every((s) => s.latest) ? 'checked every 5 min' : 'first checks pending', H.sitesUp, up < d.sites.length),
    tile('Failing jobs', String(failing), failing ? 'see Deploys' : 'all passing', H.failingJobs, failing > 0),
    tile('Database today', d.d1.error ? '–' : `${usagePct}% / ${writtenPct}%`, d.d1.error ? 'needs permission' : 'rows read / written, of the free daily limit', H.database, Math.max(usagePct, writtenPct) >= 70),
    tile('Late routines', String(late), late ? 'see Routines' : 'all on time', H.lateRoutines, late > 0),
  ]);
}

function siteCard(ui, s) {
  const { h, siteColor } = ui;
  const l = s.latest;
  const state = !l ? ['Not checked yet', ''] : l.ok ? (l.ms > 4000 ? ['Slow', 'warn'] : ['Up', '']) : ['Down', 'down'];
  const strip = h(
    'div',
    { class: 'hourstrip', role: 'img', 'aria-label': 'Last 24 hours, one block per hour' },
    s.hours.map((b) =>
      h('span', {
        class: !b.checks ? 'none' : b.ok === b.checks ? (b.ms > 4000 ? 'slow' : 'ok') : b.ok ? 'part' : 'bad',
        title: `${new Date(`${b.at.replace(' ', 'T')}Z`).toLocaleTimeString('en-ZA', { hour: '2-digit', minute: '2-digit' })}: ${b.checks ? `${b.ok}/${b.checks} OK, ${ui.charts.fmt.int(b.ms ?? 0)} ms` : 'no checks'}`,
      })
    )
  );
  return h(
    'section',
    { class: 'card site-card' },
    h('div', { class: 'top' }, h('span', { class: 'city-dot', style: `background:${siteColor(s.slug)}` }), h('div', {}, h('h3', {}, s.name), h('div', { class: 'domain' }, s.domain)), h('span', { class: `status ${state[1]}` }, state[0])),
    h(
      'dl',
      { class: 'kv' },
      h('div', {}, h('dt', {}, 'Uptime 24 h'), h('dd', {}, pct(s.uptime_24h))),
      h('div', {}, h('dt', {}, 'Uptime 7 days', ui.help(ui.HELP.health.uptime7)), h('dd', {}, pct(s.uptime_7d))),
      h('div', {}, h('dt', {}, 'Response', ui.help(ui.HELP.health.response)), h('dd', {}, ms(s.avg_ms_24h))),
      // db_ok is recorded separately from the homepage check.
      h('div', {}, h('dt', {}, 'Database', ui.help(ui.HELP.health.dbAnswering)), h('dd', {}, !l ? '–' : l.db_ok ? 'Answering' : 'Not answering'))
    ),
    strip,
    h('div', { class: 'strip-legend' }, h('span', {}, '24 h ago'), h('span', {}, 'now')),
    l && l.problem ? h('p', { class: 'msg err' }, l.problem) : null,
    s.incidents.length
      ? h(
          'details',
          { class: 'incidents' },
          h('summary', {}, `${s.incidents.length} outage${s.incidents.length === 1 ? '' : 's'} in 7 days`),
          h('ul', {}, s.incidents.map((i) => h('li', {}, `${ui.ago(i.from)}: ${i.to ? `about ${i.checks * 5} min` : 'still down'}${i.problem ? ` (${i.problem})` : ''}`)))
        )
      : null
  );
}

function resultChip(h, r) {
  if (r.status !== 'completed') return h('span', { class: 'pill info' }, r.status === 'queued' ? 'Queued' : 'Running');
  if (r.conclusion === 'success') return h('span', { class: 'pill pass' }, 'Passed');
  if (r.conclusion === 'failure' || r.conclusion === 'timed_out') return h('span', { class: 'pill fail' }, r.conclusion === 'timed_out' ? 'Timed out' : 'Failed');
  return h('span', { class: 'pill' }, r.conclusion === 'cancelled' ? 'Cancelled' : r.conclusion === 'skipped' ? 'Skipped' : r.conclusion || '–');
}

function workflowsCard(ui, d) {
  const { h } = ui;
  const title = 'Deploys & scheduled jobs';
  if (!d.workflows.length)
    return ui.card({ title, body: h('div', { class: 'empty' }, h('b', {}, 'No runs received yet'), 'The 5-minute check sends these from GitHub. They appear within a few minutes of this update going live.') });
  const order = (w) => (w.conclusion === 'failure' || w.conclusion === 'timed_out' ? 0 : w.status !== 'completed' ? 1 : 2);
  const list = [...d.workflows].sort((a, b) => order(a) - order(b) || b.created_at.localeCompare(a.created_at));
  return ui.card({
    title,
    body: h(
      'div',
      {},
      h(
        'ul',
        { class: 'rows' },
        list.map((w) =>
          h(
            'li',
            {},
            h(
              'div',
              { class: 'row-main' },
              h('b', {}, w.name),
              h('span', { class: 'meta' }, `${ui.ago(w.updated_at)} · ${w.event === 'schedule' ? 'scheduled' : w.event === 'push' ? 'after a change' : w.event === 'workflow_dispatch' ? 'started by hand' : w.event}`),
              w.error && (w.error.step || w.error.message)
                ? h('div', { class: 'msg err' }, w.error.step ? `Step “${w.error.step}”` : '', w.error.message ? `${w.error.step ? ': ' : ''}${w.error.message}` : '')
                : null
            ),
            resultChip(h, w),
            w.url ? h('a', { class: 'btn small', href: w.url, target: '_blank', rel: 'noopener' }, 'Open', ui.icon('ext', 13)) : null
          )
        )
      ),
      h('p', { class: 'note' }, `Latest run of each GitHub workflow, updated ${d.runs_updated_at ? ui.ago(d.runs_updated_at) : 'every 5 minutes'}. A new failure sends a “deploy” alert.`)
    ),
  });
}

function meter(h, label, used, limit, fmt) {
  const p = Math.min(100, (used / limit) * 100);
  return h(
    'div',
    { class: 'meter-row' },
    h('div', { class: 'meter-top' }, h('b', {}, label), h('span', {}, `${fmt(used)} of ${fmt(limit)} (${Math.round(p)}%)`)),
    h('div', { class: 'meter', role: 'meter', 'aria-valuemin': '0', 'aria-valuemax': String(limit), 'aria-valuenow': String(used), 'aria-label': label }, h('span', { class: p >= 90 ? 'bad' : p >= 70 ? 'warn' : '', style: `width:${Math.max(0.5, p)}%` }))
  );
}

function usageCard(ui, d1) {
  const { h } = ui;
  const title = 'Database usage';
  const help = ui.HELP.health.database;
  if (d1.error) {
    return ui.card({
      title,
      help,
      body: h(
        'div',
        {},
        h('div', { class: 'banner' }, d1.error),
        h(
          'ol',
          { class: 'steps' },
          h('li', {}, 'Cloudflare dashboard → your profile (top right) → API Tokens.'),
          h('li', {}, 'Edit the token GitHub uses (the one in the CLOUDFLARE_API_TOKEN secret).'),
          h('li', {}, 'Add permission: Account → Account Analytics → Read. Save.'),
          h('li', {}, 'The meter fills in within 5 minutes.')
        )
      ),
    });
  }
  if (!d1.daily.length) {
    return ui.card({ title, help, body: h('div', { class: 'empty' }, h('b', {}, 'No usage received yet'), 'The 5-minute check sends this from Cloudflare. It appears within a few minutes of this update going live.') });
  }
  const read = d1.today.reduce((a, r) => a + r.rows_read, 0);
  const written = d1.today.reduce((a, r) => a + r.rows_written, 0);
  const byDb = h('div');
  ui.charts.barList(byDb, {
    items: [...d1.today].sort((a, b) => b.rows_read - a.rows_read).map((r) => ({ label: r.database, sub: r.size_bytes ? `${(r.size_bytes / 1e6).toFixed(1)} MB` : '', value: r.rows_read })),
    format: big,
  });
  const chart = h('div');
  const wChart = h('div');
  const body = h(
    'div',
    {},
    h('p', { class: 'sub' }, 'Today so far (Cloudflare counts per UTC day, so it resets at 02:00 South African time). At 100% every site stops answering until the reset.'),
    meter(h, 'Rows read', read, d1.limits.rows_read, big),
    meter(h, 'Rows written', written, d1.limits.rows_written, big),
    h('h3', { class: 'card-sub' }, 'Rows read today, per database'),
    byDb,
    h('h3', { class: 'card-sub' }, 'Rows read per day (all databases)'),
    chart,
    h('h3', { class: 'card-sub' }, 'Rows written per day (all databases)', ui.help(ui.HELP.health.rowsWritten)),
    wChart,
    h('p', { class: 'note' }, `Free limit: ${big(d1.limits.rows_read)} rows read and ${big(d1.limits.rows_written)} rows written a day across all databases. Alerts at 70% and 90%.${d1.updated_at ? ` Updated ${ui.ago(d1.updated_at)}.` : ''}`)
  );
  const x = d1.daily.map((d) => d.day);
  ui.charts.columnChart(chart, {
    x,
    series: [{ name: 'Rows read', color: 'var(--s1)', values: d1.daily.map((d) => d.rows_read) }],
    format: big,
    xLabel: (v) => ui.charts.fmt.day(v),
    label: 'Rows read per day',
    size: 'sm',
  });
  ui.charts.columnChart(wChart, {
    x,
    series: [{ name: 'Rows written', color: 'var(--s2)', values: d1.daily.map((d) => d.rows_written) }],
    format: big,
    xLabel: (v) => ui.charts.fmt.day(v),
    label: 'Rows written per day',
    size: 'sm',
  });
  return ui.card({ title, help, body });
}

const ROUTINE_NAMES = { discovery: 'New businesses', centres: 'Shopping centres', enrichment: 'Better descriptions', 'closed-check': 'Closed businesses', events: 'Events', news: 'News', tourism: 'Tourism', fuel: 'Fuel prices' };

// Each city's list also carries the all-city fuel routine: keep it once.
const routineRows = (routines) => routines.flatMap((s, i) => s.rows.filter((r) => r.city === s.site || (r.city === 'all' && i === 0)));

function routinesCard(ui, routines) {
  const { h, siteName, siteColor } = ui;
  const rows = routineRows(routines);
  const title = 'Routines';
  if (!rows.length) return ui.card({ title, body: h('div', { class: 'empty' }, h('b', {}, 'No routine health yet'), 'The daily routine health check (07:30 UTC) fills this in.') });
  const chip = (st) => h('span', { class: `pill ${st === 'ok' ? 'pass' : st === 'late' ? 'fail' : st === 'off' ? '' : 'warn'}` }, st === 'ok' ? 'On time' : st === 'late' ? 'Late' : st === 'off' ? 'Off' : 'Never ran');
  const checked = routines.map((s) => s.checkedAt).filter(Boolean).sort().pop();
  const table = ui.charts.dataTable(
    [
      { key: 'routine', label: 'Routine', render: (r) => document.createTextNode(ROUTINE_NAMES[r.routine] ?? r.routine) },
      { key: 'city', label: 'City', render: (r) => (r.city === 'all' ? document.createTextNode('All cities') : h('span', { class: 'inline-city' }, h('span', { class: 'city-dot', style: `background:${siteColor(r.city)}` }), siteName(r.city))) },
      { key: 'lastRun', label: 'Last ran', render: (r) => document.createTextNode(r.lastRun ? `${r.lastRun}${r.daysAgo != null ? ` (${r.daysAgo} d ago)` : ''}` : 'never') },
      { key: 'status', label: 'Status', render: (r) => chip(r.status) },
    ],
    rows.sort((a, b) => (a.status === 'late' ? -1 : 0) - (b.status === 'late' ? -1 : 0))
  );
  const paused = rows.filter((r) => r.status === 'off');
  const pausedLine = paused.length
    ? h('p', { class: 'sub' }, h('b', {}, 'Routines paused'), ui.help(ui.HELP.health.pausedRoutines), `: ${[...new Set(paused.map((r) => ROUTINE_NAMES[r.routine] ?? r.routine))].join(', ')}`)
    : null;
  return ui.card({ title, body: h('div', {}, pausedLine, table, h('p', { class: 'note' }, `From the routines’ own logs, checked daily${checked ? ` (last ${ui.ago(checked)})` : ''}. A routine that turns late sends a “routine” alert.`)) });
}

function securityCard(ui, sec, recheck) {
  const { h, siteName, siteColor } = ui;
  const groups = [...new Set(sec.checks.map((c) => c.site))];
  const icon = { pass: '✓', warn: '!', fail: '✕' };
  return ui.card({
    title: 'Security checks',
    help: ui.HELP.health.security,
    sub: `Checked ${ui.ago(sec.checked_at)}. Re-checked every 6 hours when you open this screen.`,
    actions: h('button', { class: 'btn small', type: 'button', onclick: (e) => ((e.currentTarget.disabled = true), recheck()) }, 'Check now'),
    body: h(
      'div',
      {},
      groups.map((g) =>
        h(
          'div',
          { class: 'sec-group' },
          h('h3', { class: 'card-sub' }, g === 'hub' ? 'Hub Admin' : h('span', { class: 'inline-city' }, h('span', { class: 'city-dot', style: `background:${siteColor(g)}` }), siteName(g))),
          h(
            'ul',
            { class: 'checklist' },
            sec.checks
              .filter((c) => c.site === g)
              .sort((a, b) => ['fail', 'warn', 'pass'].indexOf(a.result) - ['fail', 'warn', 'pass'].indexOf(b.result))
              .map((c) => h('li', { class: c.result }, h('span', { class: 'mark', 'aria-label': c.result }, icon[c.result]), h('div', {}, h('b', {}, c.name), h('div', { class: 'meta' }, c.detail), c.fix ? h('div', { class: 'fix' }, c.fix) : null)))
          )
        )
      )
    ),
  });
}

function linksCard(ui, links) {
  const { h, siteName, siteColor } = ui;
  const title = 'Broken links';
  const help = ui.HELP.health.brokenLinks;
  if (!links || !links.sites)
    return ui.card({ title, help, body: h('div', { class: 'empty' }, h('b', {}, 'First report on Sunday night'), 'Every page and internal link on each site, plus every business’s own website, is checked once a week. You can also run “Hub Admin weekly checks” in GitHub Actions.') });
  return ui.card({
    title,
    help,
    sub: `Checked ${ui.ago(links.checked_at ?? links.updated_at)}.`,
    body: h(
      'div',
      {},
      Object.entries(links.sites).map(([slug, s]) =>
        h(
          'div',
          { class: 'sec-group' },
          h('h3', { class: 'card-sub' }, h('span', { class: 'inline-city' }, h('span', { class: 'city-dot', style: `background:${siteColor(slug)}` }), siteName(slug)), h('span', { class: 'meta' }, ` · ${s.pages ?? 0} pages, ${s.websites?.checked ?? 0} business websites`)),
          s.broken?.length
            ? h('details', { open: s.broken.length <= 5 }, h('summary', {}, `${s.broken.length} broken link${s.broken.length === 1 ? '' : 's'} on the site`), h('ul', { class: 'linklist' }, s.broken.slice(0, 100).map((b) => h('li', {}, h('a', { href: b.url, target: '_blank', rel: 'noopener' }, b.url.replace(/^https:\/\/[^/]+/, '')), h('span', { class: 'meta' }, ` · ${b.status || b.error}${b.found_on && b.found_on !== 'sitemap' ? ` · linked from ${b.found_on.replace(/^https:\/\/[^/]+/, '')}` : b.found_on === 'sitemap' ? ' · in the sitemap' : ''}`)))))
            : h('p', { class: 'msg ok' }, 'No broken links on the site.'),
          s.websites?.dead?.length
            ? h(
                'details',
                {},
                h('summary', {}, `${s.websites.dead.length} business website${s.websites.dead.length === 1 ? '' : 's'} not answering (the business may have closed)`),
                h('ul', { class: 'linklist' }, s.websites.dead.slice(0, 200).map((b) => h('li', {}, h('a', { href: b.url, target: '_blank', rel: 'noopener' }, b.name), h('span', { class: 'meta' }, ` · ${b.website} · ${b.status ? `answers ${b.status}` : b.error === 'ENOTFOUND' ? 'domain no longer exists' : b.error === 'TIMEOUT' ? 'no answer in 15 s' : 'can’t connect'}`))))
              )
            : null
        )
      )
    ),
  });
}
