// Hub Admin: one dashboard for every city site.
//   #/        Overview: every site's health and headline numbers, plus one
//             combined "needs attention" queue (opens the item in that site's admin)
//   #/stats   Stats: traffic, contact taps, enquiries, searches, sign-ups,
//             installs, revenue and Google Search, per city or all together
//   #/manage  Manage: shortcuts to every admin screen of every site
import { lineChart, columnChart, barList, dataTable, fmt } from './charts.js';

const $ = (sel, root = document) => root.querySelector(sel);
const h = (tag, attrs = {}, ...children) => {
  const el = document.createElement(tag);
  for (const [k, v] of Object.entries(attrs)) {
    if (v === undefined || v === null || v === false) continue;
    if (k === 'class') el.className = v;
    else if (k === 'style') el.style.cssText = v;
    else if (k.startsWith('on')) el.addEventListener(k.slice(2), v);
    else el.setAttribute(k, v === true ? '' : v);
  }
  for (const c of children.flat()) if (c !== null && c !== undefined && c !== false) el.append(c instanceof Node ? c : document.createTextNode(String(c)));
  return el;
};

const ICON = {
  home: 'M3 10.5 12 3l9 7.5V20a1 1 0 0 1-1 1h-5v-6H9v6H4a1 1 0 0 1-1-1z',
  chart: 'M4 20V10M10 20V4M16 20v-7M22 20H2',
  grid: 'M4 4h6v6H4zM14 4h6v6h-6zM4 14h6v6H4zM14 14h6v6h-6z',
  ext: 'M14 4h6v6M20 4l-9 9M18 14v5a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h5',
  chevron: 'm9 6 6 6-6 6',
  inbox: 'M3 13h5l2 3h4l2-3h5M5 5h14l2 8v6a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-6z',
  store: 'M4 10v10h16V10M3 4h18l-1 6H4zM9 20v-6h6v6',
  flag: 'M5 21V4h11l-1 4 1 4H5',
  mail: 'M3 6h18v12H3zM3 7l9 6 9-6',
  star: 'm12 3 2.7 5.6 6.1.9-4.4 4.3 1 6.1L12 17l-5.4 2.9 1-6.1-4.4-4.3 6.1-.9z',
  calendar: 'M4 6h16v14H4zM4 10h16M8 3v5M16 3v5',
  users: 'M9 11a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM2 21v-1a7 7 0 0 1 14 0v1M17 11a3 3 0 1 0 0-6M22 21v-1a5 5 0 0 0-4-4.9',
  receipt: 'M6 3h12v18l-3-2-3 2-3-2-3 2zM9 8h6M9 12h6',
  tag: 'M3 12V4h8l10 10-8 8zM7.5 7.5h.01',
  megaphone: 'M3 11v2a1 1 0 0 0 1 1h3l6 5V5L7 10H4a1 1 0 0 0-1 1zM17 8a5 5 0 0 1 0 8',
  news: 'M4 5h13v14H5a1 1 0 0 1-1-1zM17 8h3v10a1 1 0 0 1-1 1h-2M7 9h7M7 13h7',
  layers: 'm12 3 9 5-9 5-9-5zM3 13l9 5 9-5',
  box: 'M3 7l9-4 9 4v10l-9 4-9-4zM3 7l9 4 9-4M12 11v10',
  activity: 'M3 12h4l3-8 4 16 3-8h4',
  settings: 'M12 15a3 3 0 1 0 0-6 3 3 0 0 0 0 6zM19.4 15a1.7 1.7 0 0 0 .3 1.8l.1.1a2 2 0 1 1-2.8 2.8l-.1-.1a1.7 1.7 0 0 0-1.8-.3 1.7 1.7 0 0 0-1 1.5V21a2 2 0 1 1-4 0v-.1a1.7 1.7 0 0 0-1.1-1.5 1.7 1.7 0 0 0-1.8.3l-.1.1a2 2 0 1 1-2.8-2.8l.1-.1a1.7 1.7 0 0 0 .3-1.8 1.7 1.7 0 0 0-1.5-1H3a2 2 0 1 1 0-4h.1a1.7 1.7 0 0 0 1.5-1.1 1.7 1.7 0 0 0-.3-1.8l-.1-.1a2 2 0 1 1 2.8-2.8l.1.1a1.7 1.7 0 0 0 1.8.3H9a1.7 1.7 0 0 0 1-1.5V3a2 2 0 1 1 4 0v.1a1.7 1.7 0 0 0 1 1.5 1.7 1.7 0 0 0 1.8-.3l.1-.1a2 2 0 1 1 2.8 2.8l-.1.1a1.7 1.7 0 0 0-.3 1.8V9a1.7 1.7 0 0 0 1.5 1H21a2 2 0 1 1 0 4h-.1a1.7 1.7 0 0 0-1.5 1z',
  globe: 'M12 21a9 9 0 1 0 0-18 9 9 0 0 0 0 18zM3 12h18M12 3a14 14 0 0 1 0 18M12 3a14 14 0 0 0 0 18',
  refresh: 'M20 11a8 8 0 0 0-14.9-3.9L4 8M4 4v4h4M4 13a8 8 0 0 0 14.9 3.9L20 16M20 20v-4h-4',
};
function icon(name, size = 20) {
  const s = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
  s.setAttribute('viewBox', '0 0 24 24');
  s.setAttribute('width', size);
  s.setAttribute('height', size);
  s.setAttribute('fill', 'none');
  s.setAttribute('stroke', 'currentColor');
  s.setAttribute('stroke-width', '2');
  s.setAttribute('stroke-linecap', 'round');
  s.setAttribute('stroke-linejoin', 'round');
  s.setAttribute('aria-hidden', 'true');
  const p = document.createElementNS('http://www.w3.org/2000/svg', 'path');
  p.setAttribute('d', ICON[name]);
  s.appendChild(p);
  return s;
}

// Each site's admin screens (the existing /admin/ on its own domain).
const ADMIN_SCREENS = [
  ['Admin home', '/admin/', 'home'],
  ['Submissions', '/admin/submissions/', 'inbox'],
  ['Businesses', '/admin/businesses/', 'store'],
  ['Claims', '/admin/claims/', 'flag'],
  ['Reports', '/admin/reports/', 'flag'],
  ['Messages', '/admin/enquiries/', 'mail'],
  ['Reviews', '/admin/reviews/', 'star'],
  ['Events', '/admin/events/', 'calendar'],
  ['News', '/admin/news/', 'news'],
  ['Categories', '/admin/categories/', 'layers'],
  ['Users', '/admin/users/', 'users'],
  ['Invoices', '/admin/invoices/', 'receipt'],
  ['Plans & pricing', '/admin/plans-pricing/', 'tag'],
  ['Ads & sponsors', '/admin/ads-sponsors/', 'megaphone'],
  ['Inventory', '/admin/inventory/', 'box'],
  ['Site analytics', '/admin/analytics/', 'chart'],
  ['Activity log', '/admin/activity/', 'activity'],
  ['Settings', '/admin/settings/', 'settings'],
];

const QUEUE_TYPES = [
  ['all', 'All'],
  ['submission', 'New listings'],
  ['claim', 'Claims'],
  ['report', 'Reports'],
  ['message', 'Messages'],
  ['review', 'Reviews'],
  ['event', 'Events'],
  ['event-claim', 'Event claims'],
];

// ── State ──────────────────────────────────────────────────────────────────
const store = {
  get(k, d) {
    try {
      return localStorage.getItem(k) ?? d;
    } catch {
      return d;
    }
  },
  set(k, v) {
    try {
      localStorage.setItem(k, v);
    } catch {
      /* private mode: preference just isn't remembered */
    }
  },
};
const state = {
  overview: null,
  stats: null,
  range: Number(store.get('hub.range', '30')) || 30,
  site: store.get('hub.site', 'all'),
  queueType: 'all',
  queueSite: 'all',
  queueShown: 20,
};

function siteColor(slug) {
  const sites = state.overview?.sites ?? state.stats?.sites ?? [];
  const i = sites.findIndex((s) => s.slug === slug);
  return i >= 0 && i < 3 ? `var(--s${i + 1})` : 'var(--muted)';
}
function siteName(slug) {
  const s = (state.overview?.sites ?? state.stats?.sites ?? []).find((x) => x.slug === slug);
  return s ? s.city : slug;
}

async function api(path) {
  const res = await fetch(path, { credentials: 'same-origin', headers: { Accept: 'application/json' } });
  if (res.status === 401) throw new Error('Your sign-in has expired. Reload the page to sign in again.');
  const body = await res.json().catch(() => null);
  if (!res.ok || !body?.ok) throw new Error(body?.error || `Request failed (${res.status}).`);
  return body;
}

function ago(iso) {
  const t = new Date(iso.includes('T') ? iso : `${iso.replace(' ', 'T')}Z`).getTime();
  const s = Math.max(0, (Date.now() - t) / 1000);
  if (s < 3600) return `${Math.max(1, Math.round(s / 60))} min ago`;
  if (s < 86400) return `${Math.round(s / 3600)} h ago`;
  const d = Math.round(s / 86400);
  return d === 1 ? 'yesterday' : `${d} days ago`;
}

// ── Shell ──────────────────────────────────────────────────────────────────
const ROUTES = [
  ['#/', 'Overview', 'home'],
  ['#/stats', 'Stats', 'chart'],
  ['#/manage', 'Manage', 'grid'],
];

function themeLabel() {
  const t = store.get('hub.theme', 'auto');
  return t === 'auto' ? 'Theme: automatic' : t === 'dark' ? 'Theme: dark' : 'Theme: light';
}
function applyTheme() {
  const t = store.get('hub.theme', 'auto');
  if (t === 'auto') document.documentElement.removeAttribute('data-theme');
  else document.documentElement.setAttribute('data-theme', t);
}
function cycleTheme() {
  const order = ['auto', 'light', 'dark'];
  const next = order[(order.indexOf(store.get('hub.theme', 'auto')) + 1) % 3];
  store.set('hub.theme', next);
  applyTheme();
  document.querySelectorAll('[data-theme-btn]').forEach((b) => (b.textContent = themeLabel()));
  route();
}

function buildShell() {
  applyTheme();
  const navLinks = (cls) =>
    ROUTES.map(([href, label, ic]) => h('a', { class: cls, href, 'data-route': href }, icon(ic), h('span', {}, label), href === '#/' ? h('span', { class: 'nav-badge', 'data-badge': '', hidden: true }) : null));
  const app = $('#app');
  app.replaceChildren(
    h(
      'div',
      { class: 'shell' },
      h(
        'aside',
        { class: 'side' },
        h('div', { class: 'brand' }, h('img', { src: '/icons/logo-rounded.png', alt: '' }), h('div', {}, h('b', {}, 'Hub Admin'), h('small', {}, 'All sites'))),
        navLinks('nav-link'),
        h('div', { class: 'side-foot' }, h('button', { type: 'button', 'data-theme-btn': '', onclick: cycleTheme }, themeLabel()), h('span', { 'data-user': '' }))
      ),
      h('main', { id: 'view', tabindex: '-1' })
    ),
    h('nav', { class: 'tabbar', 'aria-label': 'Main' }, navLinks(''))
  );
}

function setActive() {
  const hash = location.hash || '#/';
  document.querySelectorAll('[data-route]').forEach((a) => {
    const on = a.getAttribute('data-route') === (hash.startsWith('#/stats') ? '#/stats' : hash.startsWith('#/manage') ? '#/manage' : '#/');
    if (on) a.setAttribute('aria-current', 'page');
    else a.removeAttribute('aria-current');
  });
}

function mobileHead(title) {
  return h(
    'div',
    { class: 'mobile-head' },
    h('img', { src: '/icons/logo-rounded.png', alt: '' }),
    h('b', {}, title),
    h('button', { type: 'button', 'data-theme-btn': '', onclick: cycleTheme, 'aria-label': 'Change theme' }, '◐')
  );
}

function pageHead(title, sub, extra) {
  return h('div', { class: 'page-head' }, h('div', {}, h('h1', {}, title), sub ? h('p', {}, sub) : null), extra || null);
}

function errorBox(err) {
  return h('div', { class: 'banner', role: 'alert' }, err.message || String(err));
}

// ── Overview ───────────────────────────────────────────────────────────────
async function loadOverview(force) {
  if (!state.overview || force) state.overview = await api('/api/overview');
  const total = state.overview.queue.length;
  document.querySelectorAll('[data-badge]').forEach((b) => {
    b.hidden = total === 0;
    b.textContent = total > 99 ? '99+' : String(total);
  });
  document.querySelectorAll('[data-user]').forEach((u) => (u.textContent = state.overview.email || ''));
  return state.overview;
}

async function renderOverview(view) {
  view.replaceChildren(mobileHead('Overview'), pageHead('Overview', 'Everything across your sites that needs you, and how each site is doing.'), h('div', { class: 'skeleton' }));
  let data;
  try {
    data = await loadOverview();
  } catch (e) {
    view.replaceChildren(mobileHead('Overview'), pageHead('Overview'), errorBox(e));
    return;
  }
  const sum = (k) => data.sites.reduce((a, s) => a + (s[k] || 0), 0);
  const refresh = h(
    'button',
    {
      class: 'btn',
      type: 'button',
      onclick: async () => {
        refresh.disabled = true;
        try {
          await loadOverview(true);
          route();
        } catch (e) {
          alert(e.message);
        }
      },
    },
    icon('refresh', 16),
    'Refresh'
  );

  const tiles = h(
    'div',
    { class: 'tiles' },
    tile('Needs attention', fmt.int(data.queue.length)),
    tile('Live listings', fmt.int(sum('listings'))),
    tile('Paid plans', fmt.int(sum('paidPlans'))),
    tile('Revenue this month', fmt.rand(sum('revenueMonthCents'))),
    tile('Registered users', fmt.int(sum('users')))
  );

  const siteCards = h('div', { class: 'three' }, data.sites.map(siteCard));

  view.replaceChildren(
    mobileHead('Overview'),
    pageHead('Overview', 'Everything across your sites that needs you, and how each site is doing.', h('div', { style: 'display:flex;gap:10px;align-items:center' }, h('span', { class: 'updated' }, `Updated ${ago(data.generatedAt)}`), refresh)),
    tiles,
    h('div', { class: 'section-title' }, 'Your sites'),
    siteCards,
    h('div', { class: 'section-title' }, 'Needs attention'),
    queueCard(data)
  );
}

function tile(label, value, delta) {
  return h('div', { class: 'tile' }, h('div', { class: 'label' }, label), h('div', { class: 'value' }, value), delta || null);
}

function siteCard(s) {
  const labels = Object.fromEntries(QUEUE_TYPES);
  const pending = Object.entries(s.pending || {});
  const up = s.health?.ok;
  return h(
    'section',
    { class: 'card site-card', 'aria-label': s.name },
    h(
      'div',
      { class: 'top' },
      h('span', { class: 'city-dot', style: `background:${siteColor(s.slug)}` }),
      h('div', {}, h('h3', {}, s.name), h('div', { class: 'domain' }, s.domain)),
      h('span', { class: `status${up ? '' : ' down'}`, title: up ? `Responded in ${s.health.ms} ms` : `HTTP ${s.health?.status ?? 'error'}` }, up ? 'Online' : 'Down')
    ),
    h(
      'div',
      { class: 'stats-row' },
      h('div', {}, h('b', {}, fmt.int(s.listings)), h('span', {}, 'Listings')),
      h('div', {}, h('b', {}, fmt.int(s.paidPlans)), h('span', {}, 'Paid plans')),
      h('div', {}, h('b', {}, fmt.randShort(s.revenueMonthCents)), h('span', {}, 'This month')),
      h('div', {}, h('b', {}, fmt.int(s.users)), h('span', {}, 'Users'))
    ),
    h(
      'div',
      { class: 'chips' },
      pending.length ? pending.map(([t, n]) => h('span', { class: 'chip hot' }, `${n} ${(labels[t] || t).toLowerCase()}`)) : h('span', { class: 'chip' }, 'Nothing waiting'),
      s.awaitingOwner ? h('span', { class: 'chip' }, `${s.awaitingOwner} awaiting owner`) : null
    ),
    h(
      'div',
      { class: 'actions' },
      h('a', { class: 'btn primary', href: `https://${s.domain}/admin/`, target: '_blank', rel: 'noopener' }, 'Open admin', icon('ext', 15)),
      h('a', { class: 'btn', href: `https://${s.domain}/`, target: '_blank', rel: 'noopener' }, 'View site', icon('ext', 15))
    )
  );
}

function queueCard(data) {
  const card = h('section', { class: 'card', 'aria-label': 'Needs attention' });
  const draw = () => {
    const items = data.queue.filter((it) => (state.queueType === 'all' || it.type === state.queueType) && (state.queueSite === 'all' || it.site === state.queueSite));
    const counts = Object.fromEntries(QUEUE_TYPES.map(([k]) => [k, data.queue.filter((it) => (k === 'all' || it.type === k) && (state.queueSite === 'all' || it.site === state.queueSite)).length]));
    const seg = h(
      'div',
      { class: 'seg', role: 'group', 'aria-label': 'Filter by type' },
      QUEUE_TYPES.filter(([k]) => k === 'all' || counts[k] > 0).map(([k, label]) =>
        h('button', { type: 'button', 'aria-pressed': String(state.queueType === k), onclick: () => ((state.queueType = k), (state.queueShown = 20), draw()) }, `${label} (${counts[k]})`)
      )
    );
    const siteSel = h(
      'select',
      { class: 'select', 'aria-label': 'Filter by site', onchange: (e) => ((state.queueSite = e.target.value), (state.queueShown = 20), draw()) },
      h('option', { value: 'all' }, 'All sites'),
      data.sites.map((s) => h('option', { value: s.slug, selected: state.queueSite === s.slug }, s.city))
    );
    const shown = items.slice(0, state.queueShown);
    const list = items.length
      ? h(
          'ul',
          { class: 'queue' },
          shown.map((it) =>
            h(
              'li',
              {},
              h(
                'a',
                { href: it.link, target: '_blank', rel: 'noopener', title: `Open in ${siteName(it.site)} admin` },
                h('span', { class: 'type' }, it.label),
                h(
                  'span',
                  { style: 'min-width:0' },
                  h('div', { class: 'title' }, it.title || '(untitled)'),
                  h(
                    'div',
                    { class: 'meta' },
                    h('span', { style: 'display:inline-flex;align-items:center;gap:5px' }, h('span', { class: 'city-dot', style: `background:${siteColor(it.site)}` }), siteName(it.site)),
                    it.detail ? h('span', {}, `· ${it.detail}`) : null
                  )
                ),
                h('span', { class: 'age' }, ago(it.created_at), ' ', icon('chevron', 14))
              )
            )
          )
        )
      : h('div', { class: 'empty' }, h('b', {}, 'All clear'), 'Nothing is waiting for you here.');
    const more =
      items.length > shown.length
        ? h('div', { style: 'text-align:center;margin-top:12px' }, h('button', { class: 'btn', type: 'button', onclick: () => ((state.queueShown += 20), draw()) }, `Show more (${items.length - shown.length} left)`))
        : null;
    card.replaceChildren(h('div', { class: 'filters' }, seg, siteSel), list, more);
  };
  draw();
  return card;
}

// ── Stats ──────────────────────────────────────────────────────────────────
async function renderStats(view) {
  const head = () =>
    pageHead(
      'Stats',
      'Visitors, contact taps, enquiries, searches and revenue across your sites.',
      state.stats ? h('span', { class: 'updated' }, `Updated ${ago(state.stats.generatedAt)}`) : null
    );
  const filters = () =>
    h(
      'div',
      { class: 'filters' },
      h(
        'div',
        { class: 'seg', role: 'group', 'aria-label': 'Date range' },
        [7, 30, 90].map((r) =>
          h('button', { type: 'button', 'aria-pressed': String(state.range === r), onclick: () => ((state.range = r), store.set('hub.range', String(r)), loadStats(view)) }, `Last ${r} days`)
        )
      ),
      h(
        'select',
        { class: 'select', 'aria-label': 'Site', onchange: (e) => ((state.site = e.target.value), store.set('hub.site', state.site), loadStats(view)) },
        h('option', { value: 'all' }, 'All sites'),
        (state.stats?.sites ?? state.overview?.sites ?? []).map((s) => h('option', { value: s.slug, selected: state.site === s.slug }, s.name))
      )
    );
  view.replaceChildren(mobileHead('Stats'), head(), filters(), h('div', { id: 'stats-body' }, h('div', { class: 'skeleton' })));
  view._statsHead = head;
  view._statsFilters = filters;
  await loadStats(view);
}

async function loadStats(view) {
  const body = $('#stats-body', view);
  if (!body) return;
  body.style.opacity = '0.5';
  try {
    state.stats = await api(`/api/stats?range=${state.range}&site=${encodeURIComponent(state.site)}`);
  } catch (e) {
    body.style.opacity = '';
    body.replaceChildren(errorBox(e));
    return;
  }
  if (!state.stats.selected.includes(state.site) && state.site !== 'all') state.site = 'all';
  view.replaceChildren(mobileHead('Stats'), view._statsHead(), view._statsFilters(), drawStats());
}

function drawStats() {
  const d = state.stats;
  const R = d.range;
  const cur = (arr) => arr.slice(R);
  const prev = (arr) => arr.slice(0, R);
  const total = (arr) => arr.reduce((a, b) => a + b, 0);
  const sumSites = (key, part) => d.perSite.reduce((a, s) => a + total(part(s.series[key])), 0);
  const days = cur(d.days);
  const multi = d.perSite.length > 1;
  const seriesFor = (key) =>
    d.perSite.map((s) => ({ name: siteName(s.slug), short: siteName(s.slug), color: siteColor(s.slug), values: cur(s.series[key]) }));

  const kpi = (label, key) => {
    const c = sumSites(key, cur);
    const p = sumSites(key, prev);
    let delta = null;
    if (p > 0 || c > 0) {
      const pct = p === 0 ? null : Math.round(((c - p) / p) * 100);
      const dir = c > p ? 'up' : c < p ? 'down' : '';
      const arrow = c > p ? '▲' : c < p ? '▼' : '■';
      delta = h('div', { class: `delta ${dir}` }, pct === null ? `${arrow} new vs previous ${R} days` : `${arrow} ${Math.abs(pct)}% vs previous ${R} days`);
    }
    return tile(label, fmt.int(c), delta);
  };

  const chartCard = (title, sub, draw, table) => {
    const holder = h('div');
    let showTable = false;
    const btn = h('button', { type: 'button', class: 'toggle-table', 'aria-pressed': 'false' }, 'Show table');
    const render = () => {
      holder.replaceChildren();
      if (showTable) holder.appendChild(table());
      else draw(holder);
      btn.textContent = showTable ? 'Show chart' : 'Show table';
      btn.setAttribute('aria-pressed', String(showTable));
    };
    btn.addEventListener('click', () => ((showTable = !showTable), render()));
    const card = h('section', { class: 'card' }, h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, title), sub ? h('p', { class: 'sub' }, sub) : null), table ? btn : null), holder);
    requestAnimationFrame(render);
    return card;
  };

  const dailyTable = (key) => () =>
    dataTable(
      [{ key: 'day', label: 'Day', format: fmt.dayLong }, ...d.perSite.map((s) => ({ key: s.slug, label: siteName(s.slug), num: true, format: fmt.int }))],
      days.map((day, i) => Object.fromEntries([['day', day], ...d.perSite.map((s) => [s.slug, cur(s.series[key])[i]])])).reverse()
    );

  const lineCard = (title, sub, key) =>
    chartCard(title, sub, (el) => lineChart(el, { x: days, series: seriesFor(key), label: title }), dailyTable(key));

  // Contact taps by type, summed across the selected sites.
  const clicks = d.perSite.reduce(
    (a, s) => ({ phone: a.phone + s.clicks.phone_click, whatsapp: a.whatsapp + s.clicks.whatsapp_click, website: a.website + s.clicks.website_click }),
    { phone: 0, whatsapp: 0, website: 0 }
  );
  const clickItems = [
    { label: 'Phone calls', value: clicks.phone },
    { label: 'WhatsApp', value: clicks.whatsapp },
    { label: 'Website visits', value: clicks.website },
  ];

  const top = d.perSite.flatMap((s) => s.top.map((t) => ({ ...t, site: s.slug }))).sort((a, b) => b.views - a.views).slice(0, 15);
  const queries = mergeCounts(d.perSite.flatMap((s) => s.queries.map((q) => ({ key: q.query, n: q.n })))).slice(0, 12);
  const cats = mergeCounts(d.perSite.flatMap((s) => s.categories.map((c) => ({ key: c.name, n: c.views })))).slice(0, 10);

  const revenueSeries = d.perSite.map((s) => ({ name: siteName(s.slug), color: siteColor(s.slug), values: s.revenue }));
  const revTotal = d.perSite.reduce((a, s) => a + s.revenue[s.revenue.length - 1], 0);

  const topViews = Math.max(1, ...top.map((t) => t.views));
  const topTable = top.length
    ? dataTable(
        [
          ...(multi ? [{ key: 'site', label: 'Site', render: (r) => h('span', { style: 'display:inline-flex;align-items:center;gap:6px;white-space:nowrap' }, h('span', { class: 'city-dot', style: `background:${siteColor(r.site)}` }), siteName(r.site)) }] : []),
          { key: 'name', label: 'Business', render: (r) => h('a', { href: r.url, target: '_blank', rel: 'noopener' }, r.name) },
          {
            key: 'views',
            label: 'Views',
            num: true,
            render: (r) => h('span', { class: 'bar-cell', style: 'justify-content:flex-end' }, h('i', { style: `width:${Math.max(2, (r.views / topViews) * 80)}px;background:${siteColor(r.site)}` }), fmt.int(r.views)),
          },
          { key: 'contacts', label: 'Contact taps', num: true, format: fmt.int },
          { key: 'rate', label: 'Tap rate', num: true, render: (r) => document.createTextNode(r.views ? `${Math.round((r.contacts / r.views) * 100)}%` : '–') },
        ],
        top
      )
    : h('p', { class: 'empty' }, 'No listing views recorded in this period yet.');

  const wrap = h(
    'div',
    {},
    h(
      'div',
      { class: 'tiles' },
      kpi('Listing views', 'views'),
      kpi('Contact taps', 'contacts'),
      kpi('Enquiries sent', 'enquiries'),
      kpi('Search appearances', 'searches'),
      kpi('New users', 'signups'),
      kpi('App installs', 'installs')
    ),
    h(
      'div',
      { class: 'two' },
      lineCard('Listing views per day', multi ? 'Each line is one site.' : null, 'views'),
      lineCard('Contact taps per day', 'Phone, WhatsApp and website taps on listings.', 'contacts')
    ),
    h('div', { style: 'height:16px' }),
    h(
      'div',
      { class: 'three' },
      chartCard('How people make contact', `Last ${R} days`, (el) => barList(el, { items: clickItems }), () =>
        dataTable([{ key: 'label', label: 'Channel' }, { key: 'value', label: 'Taps', num: true, format: fmt.int }], clickItems)
      ),
      chartCard('Most-viewed categories', `Last ${R} days`, (el) => barList(el, { items: cats.map((c) => ({ label: c.key, value: c.n })) }), () =>
        dataTable([{ key: 'key', label: 'Category' }, { key: 'n', label: 'Views', num: true, format: fmt.int }], cats)
      ),
      chartCard('What people search for', 'On-site searches, by people searching', (el) => barList(el, { items: queries.map((q) => ({ label: q.key, value: q.n })) }), () =>
        dataTable([{ key: 'key', label: 'Search' }, { key: 'n', label: 'Searchers', num: true, format: fmt.int }], queries)
      )
    ),
    h('div', { style: 'height:16px' }),
    h('section', { class: 'card' }, h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, 'Top listings'), h('p', { class: 'sub' }, `Most-viewed business pages, last ${R} days`))), topTable),
    h('div', { style: 'height:16px' }),
    h(
      'div',
      { class: 'two' },
      chartCard(
        'Revenue by month',
        `Last 12 months · ${fmt.rand(revTotal)} so far this month`,
        (el) => columnChart(el, { x: d.months, series: revenueSeries, format: fmt.randShort, xLabel: fmt.month, xLong: fmt.monthLong, label: 'Revenue by month' }),
        () =>
          dataTable(
            [{ key: 'm', label: 'Month', format: fmt.monthLong }, ...d.perSite.map((s) => ({ key: s.slug, label: siteName(s.slug), num: true, format: fmt.rand }))],
            d.months.map((m, i) => Object.fromEntries([['m', m], ...d.perSite.map((s) => [s.slug, s.revenue[i]])])).reverse()
          )
      ),
      h(
        'div',
        { class: 'grid' },
        lineCard('New users per day', null, 'signups'),
        lineCard('App installs per day', 'Phones that installed the site as an app.', 'installs')
      )
    ),
    seoSection(d)
  );
  return wrap;
}

function mergeCounts(list) {
  const m = new Map();
  for (const { key, n } of list) m.set(key, (m.get(key) || 0) + n);
  return [...m.entries()].map(([key, n]) => ({ key, n })).sort((a, b) => b.n - a.n);
}

function seoSection(d) {
  if (!d.seo?.length) return h('div');
  const order = d.sites.map((s) => s.slug);
  d.seo.sort((a, b) => order.indexOf(a.slug) - order.indexOf(b.slug));
  const win = d.seo.find((s) => s.window)?.window;
  const pct = (c, p) => (p > 0 ? Math.round(((c - p) / p) * 100) : null);
  const deltaEl = (c, p) => {
    const v = pct(c, p);
    if (v === null) return h('div', { class: 'delta' }, 'no earlier data');
    return h('div', { class: `delta ${v > 0 ? 'up' : v < 0 ? 'down' : ''}` }, `${v > 0 ? '▲' : v < 0 ? '▼' : '■'} ${Math.abs(v)}% vs previous 28 days`);
  };
  const cards = d.seo.map((s) =>
    h(
      'section',
      { class: 'card' },
      h('div', { class: 'top', style: 'display:flex;align-items:center;gap:8px;margin-bottom:12px' }, h('span', { class: 'city-dot', style: `background:${siteColor(s.slug)}` }), h('h2', {}, siteName(s.slug))),
      h(
        'div',
        { class: 'tiles', style: 'grid-template-columns:repeat(2,1fr);margin:0' },
        tile('Google clicks', fmt.int(s.clicks), deltaEl(s.clicks, s.prevClicks)),
        tile('Impressions', fmt.short(s.impressions), deltaEl(s.impressions, s.prevImpressions)),
        tile('Pages in results', fmt.int(s.pages)),
        tile('Avg. position', s.position ? s.position.toFixed(1) : '–')
      )
    )
  );
  const pages = d.seo
    .flatMap((s) => s.topPages.map((p) => ({ ...p, site: s.slug })))
    .sort((a, b) => b.clicks - a.clicks)
    .slice(0, 15);
  return h(
    'div',
    {},
    h('div', { class: 'section-title' }, 'Google Search'),
    h('div', { class: d.seo.length > 1 ? 'three' : 'two' }, cards),
    h('div', { style: 'height:16px' }),
    h(
      'section',
      { class: 'card' },
      h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, 'Top pages on Google'), h('p', { class: 'sub' }, 'Pages people clicked on in Google search results'))),
      dataTable(
        [
          { key: 'site', label: 'Site', render: (r) => h('span', { style: 'display:inline-flex;align-items:center;gap:6px;white-space:nowrap' }, h('span', { class: 'city-dot', style: `background:${siteColor(r.site)}` }), siteName(r.site)) },
          { key: 'page', label: 'Page', render: (r) => h('a', { href: r.page.startsWith('http') ? r.page : `https://${(d.sites.find((x) => x.slug === r.site) || {}).domain}${r.page}`, target: '_blank', rel: 'noopener' }, r.page.replace(/^https?:\/\/[^/]+/, '') || '/') },
          { key: 'clicks', label: 'Clicks', num: true, format: fmt.int },
          { key: 'impressions', label: 'Impressions', num: true, format: fmt.int },
          { key: 'position', label: 'Position', num: true, format: (v) => (v ? v.toFixed(1) : '–') },
        ],
        pages
      ),
      h('p', { class: 'note' }, `From the weekly Search Console report${win ? `, ${fmt.dayLong(win.startDate)} to ${fmt.dayLong(win.endDate)}` : ''}. Google's data runs about 3 days behind.`)
    )
  );
}

// ── Manage ─────────────────────────────────────────────────────────────────
async function renderManage(view) {
  view.replaceChildren(mobileHead('Manage'), pageHead('Manage', 'Jump straight into any screen of any site’s admin.'), h('div', { class: 'skeleton' }));
  let data;
  try {
    data = await loadOverview();
  } catch (e) {
    view.replaceChildren(mobileHead('Manage'), pageHead('Manage'), errorBox(e));
    return;
  }
  view.replaceChildren(
    mobileHead('Manage'),
    pageHead('Manage', 'Jump straight into any screen of any site’s admin. Each opens in a new tab, already on that site.'),
    h(
      'div',
      { class: 'grid' },
      data.sites.map((s) =>
        h(
          'section',
          { class: 'card' },
          h(
            'div',
            { class: 'card-head' },
            h('div', { style: 'display:flex;align-items:center;gap:10px' }, h('span', { class: 'city-dot', style: `background:${siteColor(s.slug)}` }), h('div', {}, h('h2', {}, s.name), h('p', { class: 'sub' }, s.domain))),
            h('a', { class: 'btn', href: `https://${s.domain}/`, target: '_blank', rel: 'noopener' }, icon('globe', 16), 'View site')
          ),
          h(
            'div',
            { class: 'launch' },
            ADMIN_SCREENS.map(([label, path, ic]) => h('a', { href: `https://${s.domain}${path}`, target: '_blank', rel: 'noopener' }, icon(ic, 18), label))
          )
        )
      )
    )
  );
}

// ── Router ─────────────────────────────────────────────────────────────────
function route() {
  setActive();
  const view = $('#view');
  const hash = location.hash || '#/';
  if (hash.startsWith('#/stats')) renderStats(view);
  else if (hash.startsWith('#/manage')) renderManage(view);
  else renderOverview(view);
}

buildShell();
window.addEventListener('hashchange', () => {
  route();
  $('#view')?.focus({ preventScroll: true });
  window.scrollTo(0, 0);
});
route();
// Keep the attention badge fresh while the app stays open.
setInterval(() => {
  if (document.visibilityState === 'visible') loadOverview(true).catch(() => {});
}, 5 * 60 * 1000);

if ('serviceWorker' in navigator) navigator.serviceWorker.register('/sw.js').catch(() => {});
