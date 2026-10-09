// Google Visibility: Google's own live index verdict for every published
// business page (Search Console URL Inspection, checked per page — not a
// search-results scrape). KPIs and the trend chart come from
// /api/gsv?summary=1 and /api/gsv?trend=1; the URLs tab is a hand-rolled
// table (search/status/sort/paginate/bulk-select), the same pattern as
// listings.js's bulk-select, extended with sort+paginate since there's no
// server list to hand-roll against there. Settings edits gsv_config.
// Data: admin-app/functions/api/gsv.ts (query-param branching on one GET,
// one POST with an `action`), logic in admin-app/functions/_lib/gsv.ts.

const PAGE_SIZE = 20; // mirrors api/gsv.ts's PER_PAGE

const STATUS_FILTERS = [
  ['', 'All'],
  ['pending', 'Pending'],
  ['indexed', 'Indexed'],
  ['not_indexed', 'Not indexed'],
  ['unknown', 'Unknown'],
];

function domainOf(url) {
  try {
    return new URL(url).hostname;
  } catch {
    return '';
  }
}

function statusLabel(status) {
  return { pending: 'Pending', indexed: 'Indexed', not_indexed: 'Not indexed', unknown: 'Unknown' }[status] || status;
}

function statusPill(ui, row) {
  const { h } = ui;
  let cls = 'pill';
  if (row.status === 'indexed') cls = 'pill pass';
  else if (row.status === 'not_indexed') cls = row.consecutiveNotIndexed >= 3 ? 'pill fail' : 'pill warn';
  return h('span', { class: cls }, statusLabel(row.status));
}

export async function render(view, ui) {
  const { h, fill, api } = ui;
  const H = ui.HELP.gsv;
  ui.page({
    title: 'Google Visibility',
    context: 'Google’s own live index verdict for every business page — Search Console URL Inspection, checked per page. Not a search-results scrape.',
  });
  fill(view, ui.state.loading());

  let summary;
  try {
    summary = await api('/api/gsv?summary=1');
  } catch (e) {
    fill(view, ui.state.error(e));
    return;
  }
  if (summary.lastRun) ui.setUpdated(summary.lastRun);

  // Table filter/sort/page state and the bulk-select set live here (not
  // inside urlsTab) so they survive switching to Settings and back.
  const tableState = { q: '', status: '', sort: '-lastAttemptAt', page: 1 };
  const selected = new Set();

  const draw = () => {
    fill(
      view,
      kpiBlock(ui, summary, H),
      trendCard(ui),
      ui.tabs(
        [
          { id: 'by-site', label: 'By site', render: () => bySiteTab(ui, H) },
          { id: 'urls', label: 'URLs', render: () => urlsTab(ui, tableState, selected) },
          { id: 'settings', label: 'Settings', render: () => settingsTab(ui, summary, H) },
        ],
        { store: 'hub.tab.gsv' }
      )
    );
  };
  // The trend chart and the URLs table both read the top-bar site selector;
  // the 4 KPIs are global totals (summaryMode in gsv.ts has no site filter),
  // so there's nothing to refetch there on a site change.
  ui.onSiteChange(draw);
  draw();
}

function kpiBlock(ui, summary, H) {
  const { h } = ui;
  const f = ui.charts.fmt.int;
  const pct = summary.pctIndexed ?? (summary.indexed + summary.notIndexed > 0 ? Math.round((summary.indexed / (summary.indexed + summary.notIndexed)) * 1000) / 10 : 0);
  const kpiRow = ui.kpis([
    ['Indexed', f(summary.indexed), null, H.indexed],
    ['Not indexed', f(summary.notIndexed), null, H.notIndexed],
    ['% indexed', `${pct}%`, null, H.percentIndexed],
    ['Checked in last 24h', f(summary.checked24h), null, H.checked24h],
  ]);
  const lastRun = summary.lastRun ? ui.ago(summary.lastRun) : 'never';
  return h(
    'div',
    { class: 'block' },
    kpiRow,
    h(
      'p',
      { class: 'note' },
      'Pending ', f(summary.pending), ui.help(H.pending),
      ' · Unknown ', f(summary.unknown), ui.help(H.unknown),
      ' · Last run: ', lastRun, ui.help(H.lastRun)
    )
  );
}

// Trend chart: /api/gsv?trend=1&site=&from=&to= returns one gsv_daily row
// per (day, site); with "All sites" selected that's up to 2 rows per day,
// so they're summed into one point per day before charting.
function trendCard(ui) {
  const { h, api } = ui;
  const site = ui.site();
  const holder = h('div');
  ui.fill(holder, ui.state.loading());

  (async () => {
    let rows;
    try {
      const to = new Date().toISOString().slice(0, 10);
      const from = new Date(Date.now() - 30 * 86_400_000).toISOString().slice(0, 10);
      const q = new URLSearchParams({ trend: '1', from, to });
      if (site !== 'all') q.set('site', site);
      const d = await api(`/api/gsv?${q.toString()}`);
      rows = d.rows;
    } catch (e) {
      ui.fill(holder, ui.state.error(e));
      return;
    }
    if (!holder.isConnected) return;
    if (!rows.length) {
      ui.fill(holder, ui.state.empty('No trend data yet. It appears once URLs have been checked.'));
      return;
    }
    const byDay = new Map();
    for (const r of rows) {
      const cur = byDay.get(r.day) || { indexed: 0, notIndexed: 0, unknown: 0, pending: 0 };
      cur.indexed += r.indexed;
      cur.notIndexed += r.notIndexed;
      cur.unknown += r.unknown;
      cur.pending += r.pending;
      byDay.set(r.day, cur);
    }
    const days = [...byDay.keys()].sort();
    const chart = h('div');
    ui.fill(holder, chart);
    requestAnimationFrame(() =>
      ui.charts.lineChart(chart, {
        x: days,
        series: [
          { name: 'Indexed', short: 'Indexed', color: 'var(--good)', values: days.map((d) => byDay.get(d).indexed) },
          { name: 'Not indexed', short: 'Not idx.', color: 'var(--critical)', values: days.map((d) => byDay.get(d).notIndexed) },
          { name: 'Unknown', short: 'Unknown', color: 'var(--muted)', values: days.map((d) => byDay.get(d).unknown) },
          { name: 'Pending', short: 'Pending', color: 'var(--action)', values: days.map((d) => byDay.get(d).pending) },
        ],
        label: 'Index status per day',
        size: 'sm',
      })
    );
  })();

  return ui.card({
    title: 'Index status over time',
    sub: site === 'all' ? 'Last 30 days, all sites' : `Last 30 days, ${ui.siteName(site)}`,
    body: holder,
  });
}

// "By site" tab: /api/gsv?bySite=1 returns, for each site, its status totals
// plus a breakdown of not_indexed rows by Google's coverage_state (mapped to
// a plain-language label in _lib/gsv.ts's reasonLabel). Unlike the KPI block
// and trend chart above, this always shows every site regardless of the
// top-bar site selector — the point of the tab is comparing sites.
function bySiteTab(ui, H) {
  const { h, fill, api } = ui;
  const root = h('div', { class: 'stack' });
  fill(root, ui.state.loading());

  (async () => {
    let sites;
    try {
      const d = await api('/api/gsv?bySite=1');
      sites = d.sites;
    } catch (e) {
      fill(root, ui.state.error(e));
      return;
    }
    if (!root.isConnected) return;
    if (!sites.length) {
      fill(root, ui.state.empty('No sites configured.'));
      return;
    }
    fill(root, sites.map((s) => siteBreakdownCard(ui, s, H)));
  })();

  return root;
}

function siteBreakdownCard(ui, s, H) {
  const { h } = ui;
  const f = ui.charts.fmt.int;
  const totalSeen = s.indexed + s.notIndexed + s.unknown;

  const kpiRow = ui.kpis([
    ['On Google', f(s.indexed), null, H.onGoogle],
    ['Not on Google', f(s.notIndexed), null, H.notOnGoogle],
    ['Pending', f(s.pending), null, H.pending],
    ['Unknown', f(s.unknown), null, H.unknown],
  ]);

  let rest;
  if (totalSeen === 0) {
    rest = ui.state.empty('No pages checked yet for this site — everything is still pending.');
  } else if (!s.notIndexed) {
    rest = h('p', { class: 'msg ok' }, 'Everything checked so far is on Google.');
  } else {
    const bars = h('div');
    ui.charts.barList(bars, {
      items: s.reasons.map((r) => ({
        label: r.label,
        value: r.count,
        // The raw Google term, shown only when it differs from the plain
        // label, for anyone who wants the literal coverage_state string.
        sub: r.coverageState && r.coverageState !== r.label ? r.coverageState : undefined,
      })),
    });
    rest = h('div', {}, h('h3', {}, 'Why pages aren’t on Google', ui.help(H.reasons)), bars);
  }

  return ui.card({
    title: s.name,
    sub: totalSeen > 0 ? `${s.pctIndexed}% of checked pages are on Google` : null,
    body: h('div', {}, kpiRow, rest),
  });
}

function urlsTab(ui, state, selected) {
  const { h, fill, api } = ui;
  const root = h('div', { class: 'stack' });
  const chipBar = h('div', { class: 'chip-bar', role: 'group', 'aria-label': 'Filter by status' });
  const tableHolder = h('div');
  const detail = h('div');
  const bar = h('div', { class: 'bulkbar', hidden: true });

  let lastRows = [];
  let total = 0;
  let loadSeq = 0;
  let searchTimer = null;

  const drawChips = () => {
    fill(
      chipBar,
      STATUS_FILTERS.map(([val, label]) =>
        h(
          'button',
          {
            type: 'button',
            class: 'chip-btn',
            'aria-pressed': String(state.status === val),
            onclick: () => {
              state.status = val;
              state.page = 1;
              drawChips();
              load();
            },
          },
          label
        )
      )
    );
  };

  const searchInput = h('input', {
    class: 'input',
    type: 'search',
    placeholder: 'Search by name or URL',
    value: state.q,
    'aria-label': 'Search URLs',
    oninput: (e) => {
      const v = e.target.value;
      clearTimeout(searchTimer);
      searchTimer = setTimeout(() => {
        state.q = v;
        state.page = 1;
        load();
      }, 350);
    },
  });

  const syncBar = () => {
    bar.hidden = selected.size === 0;
    if (!selected.size) return;
    const msg = h('span', { role: 'status' }, `${selected.size} selected`);
    const recheckBtn = h('button', { class: 'btn small', type: 'button' }, `Recheck ${selected.size} selected`);
    recheckBtn.addEventListener('click', async () => {
      recheckBtn.disabled = true;
      const ids = [...selected];
      let done = 0;
      const errs = [];
      for (let i = 0; i < ids.length; i += 25) {
        msg.textContent = `Rechecking… ${done}/${ids.length}`;
        try {
          // Raw fetch, not ui.api: doRecheck legitimately returns ok:false
          // on a partial failure (some ids ok, some not) with HTTP 200, and
          // ui.api() throws away the body whenever body.ok is false.
          const res = await fetch('/api/gsv', {
            method: 'POST',
            credentials: 'same-origin',
            headers: { 'Content-Type': 'application/json', Accept: 'application/json', 'X-Hub-Admin': '1' },
            body: JSON.stringify({ action: 'recheck', ids: ids.slice(i, i + 25) }),
          });
          const out = await res.json().catch(() => ({ done: [], failed: [{ error: `HTTP ${res.status}` }] }));
          done += out.done?.length ?? 0;
          if (out.failed?.length) errs.push(...out.failed.map((f) => f.error));
        } catch (e) {
          errs.push(e.message);
        }
      }
      msg.textContent = errs.length ? `Rechecked ${done} of ${ids.length}; ${errs[0]}` : `Rechecked ${done}.`;
      selected.clear();
      await load();
    });
    const clearBtn = h('button', { class: 'btn small', type: 'button', onclick: () => (selected.clear(), drawTable()) }, 'Clear');
    bar.replaceChildren(msg, recheckBtn, clearBtn);
  };

  const toggleSort = (key) => {
    state.sort = state.sort === key ? `-${key}` : key;
    state.page = 1;
    load();
  };
  const thSort = (key, label, ...extra) => {
    const asc = state.sort === key;
    const desc = state.sort === `-${key}`;
    return h(
      'th',
      {
        tabindex: '0',
        role: 'button',
        'aria-sort': asc ? 'ascending' : desc ? 'descending' : 'none',
        style: 'cursor:pointer;user-select:none',
        onclick: () => toggleSort(key),
        onkeydown: (e) => {
          if (e.key !== 'Enter' && e.key !== ' ') return;
          e.preventDefault();
          toggleSort(key);
        },
      },
      label,
      asc ? ' ▲' : desc ? ' ▼' : '',
      ...extra
    );
  };

  const openDetail = async (r) => {
    const close = h('button', { class: 'btn small', type: 'button', onclick: () => fill(detail) }, 'Close');
    fill(detail, ui.card({ title: `History: ${r.name}`, actions: close, body: ui.state.loading() }));
    try {
      const d = await api(`/api/gsv?history=${r.id}`);
      fill(
        detail,
        ui.card({
          title: `History: ${r.name}`,
          sub: r.coverageState ? `Current reason Google gives: ${r.coverageState}` : 'Google has not given a reason (indexed, pending, or an unknown result).',
          actions: close,
          body: d.rows.length
            ? ui.charts.dataTable(
                [
                  { key: 'checkedAt', label: 'Checked', render: (x) => document.createTextNode(ui.ago(x.checkedAt)) },
                  { key: 'status', label: 'Status', render: (x) => document.createTextNode(statusLabel(x.status)) },
                  { key: 'coverageState', label: 'Coverage state', render: (x) => document.createTextNode(x.coverageState || x.error || '—') },
                ],
                d.rows
              )
            : ui.state.empty('No checks yet for this URL.'),
        })
      );
    } catch (e) {
      fill(detail, ui.card({ title: `History: ${r.name}`, actions: close, body: ui.state.error(e) }));
    }
  };

  const row = (r) => {
    const domain = domainOf(r.url);
    const searchUrl = `https://www.google.com/search?q=site:${domain}+${encodeURIComponent(r.slug)}`;
    return h(
      'tr',
      {
        onclick: (e) => {
          if (e.target.closest('button, a, input, label')) return;
          openDetail(r);
        },
      },
      h(
        'td',
        {},
        h(
          'label',
          { class: 'pick', title: 'Select' },
          h('input', {
            type: 'checkbox',
            'aria-label': `Select ${r.name}`,
            checked: selected.has(r.id),
            onchange: (e) => (e.target.checked ? selected.add(r.id) : selected.delete(r.id), syncBar()),
          })
        )
      ),
      h('td', {}, r.name),
      h('td', {}, domain),
      h('td', {}, statusPill(ui, r)),
      h('td', {}, r.lastAttemptAt ? ui.ago(r.lastAttemptAt) : 'never'),
      h('td', {}, r.consecutiveNotIndexed > 0 ? String(r.consecutiveNotIndexed) : ''),
      h(
        'td',
        {},
        h(
          'div',
          { class: 'actions' },
          h(
            'button',
            {
              class: 'btn small',
              type: 'button',
              onclick: async (e) => {
                const btn = e.currentTarget;
                btn.disabled = true;
                try {
                  const out = await api('/api/gsv', 'POST', { action: 'check', id: r.id });
                  if (out.row) Object.assign(r, out.row);
                  drawTable();
                } catch (err) {
                  alert(err.message);
                } finally {
                  btn.disabled = false;
                }
              },
            },
            'Check now'
          ),
          h('a', { class: 'btn small', href: r.url, target: '_blank', rel: 'noopener' }, 'Open page'),
          h('a', { class: 'btn small', href: searchUrl, target: '_blank', rel: 'noopener' }, 'Search Google')
        )
      )
    );
  };

  const drawTable = () => {
    if (!lastRows.length) {
      fill(tableHolder, ui.state.empty('No URLs match these filters.'));
      syncBar();
      return;
    }
    const table = h(
      'table',
      { class: 'data-table' },
      h(
        'thead',
        {},
        h(
          'tr',
          {},
          h('th', {}),
          thSort('name', 'Business name'),
          h('th', {}, 'Domain'),
          thSort('status', 'Status'),
          thSort('lastAttemptAt', 'Last checked'),
          thSort('consecutiveNotIndexed', 'Consecutive not-indexed', ui.help(ui.HELP.gsv.consecutiveNotIndexed)),
          h('th', {}, 'Actions', ui.help(ui.HELP.gsv.searchGoogleLink))
        )
      ),
      h('tbody', {}, lastRows.map(row))
    );
    const pages = Math.max(1, Math.ceil(total / PAGE_SIZE));
    const pageBar = h(
      'div',
      { class: 'filters' },
      h('span', { class: 'meta' }, `${total} URL${total === 1 ? '' : 's'} · page ${state.page} of ${pages}`),
      h(
        'button',
        { class: 'btn small', type: 'button', disabled: state.page <= 1, onclick: () => ((state.page -= 1), load()) },
        'Prev'
      ),
      h(
        'button',
        { class: 'btn small', type: 'button', disabled: state.page >= pages, onclick: () => ((state.page += 1), load()) },
        'Next'
      )
    );
    fill(tableHolder, h('div', { class: 'table-wrap' }, table), pageBar);
    syncBar();
  };

  const load = async () => {
    const seq = ++loadSeq;
    fill(tableHolder, ui.state.loading());
    const q = new URLSearchParams();
    const site = ui.site();
    if (site !== 'all') q.set('site', site);
    if (state.status) q.set('status', state.status);
    if (state.q) q.set('q', state.q);
    q.set('sort', state.sort);
    q.set('page', String(state.page));
    try {
      const d = await api(`/api/gsv?${q.toString()}`);
      if (seq !== loadSeq) return;
      lastRows = d.rows;
      total = d.total;
      drawTable();
    } catch (e) {
      if (seq !== loadSeq) return;
      fill(tableHolder, ui.state.error(e));
    }
  };

  drawChips();
  fill(root, h('div', { class: 'filters' }, searchInput, chipBar), tableHolder, detail, bar);
  load();
  return root;
}

function settingsTab(ui, summary, H) {
  const { h, api } = ui;
  const cfg = summary.config;
  const quota = summary.quota || {};

  const toggleBtn = h('button', { class: 'btn', type: 'button' }, cfg.enabled ? 'Pause checking' : 'Resume checking');
  const toggleMsg = h('p', { class: 'msg', role: 'status' });
  toggleBtn.addEventListener('click', async () => {
    toggleBtn.disabled = true;
    try {
      const out = await api('/api/gsv', 'POST', { action: cfg.enabled ? 'pause' : 'resume' });
      Object.assign(cfg, out.config);
      toggleBtn.textContent = cfg.enabled ? 'Pause checking' : 'Resume checking';
      toggleMsg.className = 'msg ok';
      toggleMsg.textContent = cfg.enabled ? 'Checking resumed.' : 'Checking paused. No new checks will run until resumed.';
    } catch (e) {
      toggleMsg.className = 'msg err';
      toggleMsg.textContent = e.message;
    } finally {
      toggleBtn.disabled = false;
    }
  });

  const batchInput = h('input', { class: 'input', type: 'number', min: '1', max: '500', step: '1', value: String(cfg.batchSizePerSite) });
  const intervalInput = h('input', { class: 'input', type: 'number', min: '1', max: '24', step: '1', value: String(cfg.intervalHours) });
  const saveMsg = h('p', { class: 'msg', role: 'status' });
  const saveBtn = h('button', { class: 'btn primary', type: 'submit' }, 'Save');
  const form = h(
    'form',
    {
      class: 'form',
      onsubmit: async (e) => {
        e.preventDefault();
        saveBtn.disabled = true;
        try {
          const out = await api('/api/gsv', 'POST', {
            action: 'set-config',
            batchSizePerSite: Number(batchInput.value),
            intervalHours: Number(intervalInput.value),
          });
          Object.assign(cfg, out.config);
          saveMsg.className = 'msg ok';
          saveMsg.textContent = 'Saved.';
        } catch (err) {
          saveMsg.className = 'msg err';
          saveMsg.textContent = err.message;
        } finally {
          saveBtn.disabled = false;
        }
      },
    },
    h('label', { class: 'field' }, h('span', {}, 'Batch size per site', ui.help(H.batchSize)), batchInput),
    h('label', { class: 'field' }, h('span', {}, 'Interval between runs (hours)', ui.help(H.interval)), intervalInput),
    h('div', {}, saveBtn),
    saveMsg
  );

  const quotaItems = Object.entries(quota);
  const quotaList = h(
    'ul',
    { class: 'linklist' },
    quotaItems.length
      ? quotaItems.map(([slug, n]) => h('li', {}, h('b', {}, ui.siteName(slug)), h('span', { class: 'meta' }, ` · ${n.toLocaleString('en-ZA')} of ~2,000 free inspections used today`)))
      : h('li', {}, 'No checks run yet today.')
  );

  return h(
    'div',
    { class: 'stack' },
    ui.card({
      title: 'Checking status',
      body: h('div', {}, h('p', {}, cfg.enabled ? 'Checking is running on schedule.' : 'Checking is paused — no new checks will run until resumed.'), toggleBtn, toggleMsg),
    }),
    ui.card({
      title: 'Batch size and interval',
      sub: 'How many URLs each site checks per run, and how often the run repeats. Takes effect from the next run.',
      body: form,
    }),
    ui.card({
      title: 'Google quota',
      help: H.quota,
      sub: 'Search Console gives each site about 2,000 free URL Inspection calls a day. Checking pauses automatically if it’s hit.',
      body: quotaList,
    })
  );
}
