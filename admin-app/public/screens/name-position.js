// Name Search Rank: Google's own recorded reading for a search of each
// business's exact NAME — not gsv.js's live index verdict, and not the
// blended "average position across every query" KPI elsewhere, which can
// say "position 3" while a name search finds nothing. Most businesses will
// show no data (nobody searches most business names directly), so the KPI
// row and table both keep "no data" and "never checked" as distinct, legible
// states rather than collapsing everything into a blank cell.
// Data: admin-app/functions/api/name-position.ts (summary + businesses
// list), logic in admin-app/functions/_lib/name-position.ts.

const PAGE_SIZE = 20; // mirrors api/name-position.ts's PER_PAGE

export async function render(view, ui) {
  const { h, fill, api } = ui;
  const H = ui.HELP.namePosition;
  ui.page({
    title: 'Name Search Rank',
    context:
      'Google’s own recorded reading for a search of each business’s exact name — not a live SERP check, and not the blended average-position number elsewhere, which can say “position 3” while a name search finds nothing.',
  });
  fill(view, ui.state.loading());

  let summary;
  try {
    summary = await api('/api/name-position?summary=1');
  } catch (e) {
    fill(view, ui.state.error(e));
    return;
  }
  if (summary.lastRun) ui.setUpdated(summary.lastRun);

  // Table state lives here (not inside businessesTab) so it survives
  // switching to Settings and back, same as gsv.js's tableState.
  const tableState = { q: '', sort: '-checkedAt', page: 1 };

  const draw = () => {
    fill(
      view,
      kpiBlock(ui, summary, H),
      ui.tabs(
        [
          { id: 'businesses', label: 'Businesses', render: () => businessesTab(ui, tableState) },
          { id: 'settings', label: 'Settings', render: () => settingsTab(ui, summary, H) },
        ],
        { store: 'hub.tab.namePosition' }
      )
    );
  };
  // The table reads the top-bar site selector; the 4 KPIs are global totals
  // (summaryMode has no site filter), so there's nothing else to refetch.
  ui.onSiteChange(draw);
  draw();
}

function kpiBlock(ui, summary, H) {
  const { h } = ui;
  const f = ui.charts.fmt.int;
  const avg = summary.avgPosition != null ? summary.avgPosition.toFixed(1) : '–';
  // Order matters: "has a position" is the minority case here, so it leads,
  // followed immediately by the two states that make up the realistic
  // majority — this isn't a dashboard where a big empty number is bad news.
  const kpiRow = ui.kpis([
    ['Has a name-search position', f(summary.withData), null, H.withData],
    ['No searches recorded for name', f(summary.noData), null, H.noData],
    ['Never checked', f(summary.neverChecked), null, H.neverChecked],
    ['Average position', avg, null, H.avgPosition],
  ]);
  const lastRun = summary.lastRun ? ui.ago(summary.lastRun) : 'never';
  return h('div', { class: 'block' }, kpiRow, h('p', { class: 'note' }, 'Last run: ', lastRun));
}

// Three distinct states a position cell can be in — a real number, "no
// data" (Google saw the query, nothing matched this exact name), and "not
// checked yet" (no reading has run at all). Collapsing any two of these
// would hide that "no data" is the expected majority, not a problem.
function positionCell(ui, r) {
  const { h } = ui;
  if (r.position != null) return h('span', {}, r.position.toFixed(1));
  if (r.checkedAt) return h('span', { class: 'meta' }, 'No data');
  return h('span', { class: 'meta' }, 'Not checked yet');
}

// Same three states as positionCell, for the date of the last real
// impression rather than the aggregate number — a business can have a
// decent position while its underlying impressions are weeks old, which is
// exactly the gap this column exists to surface.
function lastImpressionCell(ui, r) {
  const { h } = ui;
  if (r.lastImpressionDate) return h('span', {}, ui.ago(r.lastImpressionDate));
  if (r.checkedAt) return h('span', { class: 'meta' }, 'No data');
  return h('span', { class: 'meta' }, 'Not checked yet');
}

function businessesTab(ui, state) {
  const { h, fill, api } = ui;
  const root = h('div', { class: 'stack' });
  const tableHolder = h('div');

  let lastRows = [];
  let total = 0;
  let loadSeq = 0;
  let searchTimer = null;

  const searchInput = h('input', {
    class: 'input',
    type: 'search',
    placeholder: 'Search by business name',
    value: state.q,
    'aria-label': 'Search businesses',
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

  const row = (r, showSite) => {
    const nameCell = r.url ? h('a', { href: r.url, target: '_blank', rel: 'noopener' }, r.name) : h('span', {}, r.name);
    return h(
      'tr',
      {},
      h('td', {}, nameCell),
      ...(showSite
        ? [h('td', {}, h('span', { class: 'inline-city nowrap' }, h('span', { class: 'city-dot', style: `background:${ui.siteColor(r.site)}` }), ui.siteName(r.site)))]
        : []),
      h('td', { class: 'num' }, positionCell(ui, r)),
      h('td', {}, lastImpressionCell(ui, r)),
      h('td', { class: 'num' }, r.impressions != null ? ui.charts.fmt.int(r.impressions) : ''),
      h('td', { class: 'num' }, r.clicks != null ? ui.charts.fmt.int(r.clicks) : ''),
      h('td', {}, r.checkedAt ? ui.ago(r.checkedAt) : '')
    );
  };

  const drawTable = () => {
    if (!lastRows.length) {
      fill(tableHolder, ui.state.empty('No businesses match these filters.'));
      return;
    }
    const showSite = ui.site() === 'all';
    const table = h(
      'table',
      { class: 'data-table' },
      h(
        'thead',
        {},
        h(
          'tr',
          {},
          thSort('name', 'Business name'),
          ...(showSite ? [h('th', {}, 'Site')] : []),
          thSort('position', 'Position', ui.help(ui.HELP.namePosition.position)),
          thSort('lastImpressionDate', 'Last impression'),
          thSort('impressions', 'Impressions'),
          thSort('clicks', 'Clicks'),
          thSort('checkedAt', 'Last checked')
        )
      ),
      h('tbody', {}, lastRows.map((r) => row(r, showSite)))
    );
    const pages = Math.max(1, Math.ceil(total / PAGE_SIZE));
    const pageBar = h(
      'div',
      { class: 'filters' },
      h('span', { class: 'meta' }, `${total} business${total === 1 ? '' : 'es'} · page ${state.page} of ${pages}`),
      h('button', { class: 'btn small', type: 'button', disabled: state.page <= 1, onclick: () => ((state.page -= 1), load()) }, 'Prev'),
      h('button', { class: 'btn small', type: 'button', disabled: state.page >= pages, onclick: () => ((state.page += 1), load()) }, 'Next')
    );
    fill(tableHolder, h('div', { class: 'table-wrap' }, table), pageBar);
  };

  const load = async () => {
    const seq = ++loadSeq;
    fill(tableHolder, ui.state.loading());
    const q = new URLSearchParams();
    const site = ui.site();
    if (site !== 'all') q.set('site', site);
    if (state.q) q.set('q', state.q);
    q.set('sort', state.sort);
    q.set('page', String(state.page));
    try {
      const d = await api(`/api/name-position?${q.toString()}`);
      if (seq !== loadSeq) return;
      lastRows = d.rows;
      total = d.total;
      drawTable();
    } catch (e) {
      if (seq !== loadSeq) return;
      fill(tableHolder, ui.state.error(e));
    }
  };

  fill(root, h('div', { class: 'filters' }, searchInput), tableHolder);
  load();
  return root;
}

function settingsTab(ui, summary, H) {
  const { h, api } = ui;
  const cfg = summary.config;

  const toggleBtn = h('button', { class: 'btn', type: 'button' }, cfg.enabled ? 'Pause checking' : 'Resume checking');
  const toggleMsg = h('p', { class: 'msg', role: 'status' });
  toggleBtn.addEventListener('click', async () => {
    toggleBtn.disabled = true;
    try {
      const out = await api('/api/name-position', 'POST', { action: cfg.enabled ? 'pause' : 'resume' });
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

  // batchSizePerSite's range mirrors api/name-position.ts's doSetConfig
  // validation (1-2000); intervalHours mirrors its 1-24.
  const batchInput = h('input', { class: 'input', type: 'number', min: '1', max: '2000', step: '1', value: String(cfg.batchSizePerSite) });
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
          const out = await api('/api/name-position', 'POST', {
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

  return h(
    'div',
    { class: 'stack' },
    ui.card({
      title: 'Checking status',
      body: h('div', {}, h('p', {}, cfg.enabled ? 'Checking is running on schedule.' : 'Checking is paused — no new checks will run until resumed.'), toggleBtn, toggleMsg),
    }),
    ui.card({
      title: 'Batch size and interval',
      sub: 'How many businesses each site checks per run, and how often the run repeats. Takes effect from the next run.',
      body: form,
    })
  );
}
