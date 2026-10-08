// Hub Admin: one dashboard for every city site.
//   #/         Overview: today's briefing, every site's health and headline
//              numbers, and one combined "needs attention" queue
//   #/stats    Site activity: traffic, contact taps, enquiries, searches, sign-ups,
//              installs, revenue and Google Search, per city or all together
//   #/upgrades To-do: the list of improvements to build on the sites
//   #/manage   Manage: shortcuts to every admin screen of every site
//   #/settings Settings: sign-in, password, weekly email, admins and push
//              notifications on this device
// The other screens are separate modules in screens/, loaded when opened:
//   #/inbox, #/health, #/listings, #/google, #/analytics, #/index-gate, #/money, #/activity, #/social
import { lineChart, columnChart, barList, dataTable, fmt } from './charts.js';
import { motion } from './motion.js';
import { HELP, helpIcon, attachTip } from './help.js';

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

// Replaces an element's contents, skipping empty slots (null/undefined/false)
// so an optional part never shows up as the text "null".
const fill = (el, ...kids) => el.replaceChildren(...kids.flat(Infinity).filter((k) => k !== null && k !== undefined && k !== false));

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
  bulb: 'M9 18h6M10 22h4M12 2a7 7 0 0 0-4 12.7V17h8v-2.3A7 7 0 0 0 12 2z',
  bell: 'M6 8a6 6 0 1 1 12 0c0 7 3 9 3 9H3s3-2 3-9M10.3 21a1.9 1.9 0 0 0 3.4 0',
  plus: 'M12 5v14M5 12h14',
  trash: 'M3 6h18M8 6V4h8v2M6 6l1 14h10l1-14',
  edit: 'M12 20h9M16.5 3.5a2.1 2.1 0 0 1 3 3L7 19l-4 1 1-4z',
  moon: 'M21 12.8A9 9 0 1 1 11.2 3a7 7 0 0 0 9.8 9.8z',
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
// The sidebar's rail/full state is applied before anything is drawn, so the
// shell never flashes at the wrong width. (The CSP forbids an inline <script>
// in index.html; this is the earliest app code that runs.)
if (store.get('hub.sidebar', 'full') === 'rail') document.documentElement.dataset.sidebar = 'rail';
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

async function api(path, method = 'GET', data) {
  const headers = { Accept: 'application/json' };
  if (method !== 'GET') Object.assign(headers, { 'Content-Type': 'application/json', 'X-Hub-Admin': '1' });
  const res = await fetch(path, { method, credentials: 'same-origin', headers, body: data === undefined ? undefined : JSON.stringify(data) });
  const body = await res.json().catch(() => null);
  if (res.status === 401 && body?.signedOut) {
    setTimeout(start, 0);
    throw new Error('Please sign in again.');
  }
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
// [hash, label, icon, on the phone tab bar]. Screens not on the tab bar are
// under "More" on phones; the computer sidebar shows them all.
const ROUTES = [
  ['#/', 'Overview', 'home', true],
  ['#/inbox', 'Inbox', 'inbox', true],
  ['#/stats', 'Site activity', 'chart', true],
  ['#/health', 'Health', 'activity', true],
  ['#/listings', 'Listings', 'layers'],
  ['#/google', 'Google', 'globe'],
  ['#/analytics', 'Analytics', 'chart'],
  ['#/index-gate', 'Listings to fix', 'globe'],
  ['#/money', 'Money', 'receipt'],
  // Sales reps (#/reps) is hidden until the rep programme launches; re-add the route here.
  ['#/activity', 'Activity log', 'news'],
  ['#/upgrades', 'To-do', 'bulb'],
  ['#/social', 'Social', 'megaphone'],
  ['#/manage', 'Manage', 'grid'],
  ['#/settings', 'Settings', 'settings'],
];
const TAB_ROUTES = ROUTES.filter((r) => r[3]).map((r) => r[0]);
const currentRoute = () => {
  let hash = (location.hash || '#/').split('?')[0];
  if (hash.startsWith('#/alerts')) hash = '#/settings'; // old links
  if (hash.startsWith('#/more')) return '#/more';
  return ROUTES.find(([r]) => r !== '#/' && hash.startsWith(r))?.[0] ?? '#/';
};
const hashParams = () => new URLSearchParams((location.hash.split('?')[1] || ''));

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
  // Only the text buttons carry the label; the icon buttons keep their icon.
  document.querySelectorAll('[data-theme-label]').forEach((b) => (b.textContent = themeLabel()));
  document.querySelectorAll('[data-theme-btn]').forEach((b) => b.setAttribute('title', themeLabel()));
  route();
}

// ── Sidebar rail ───────────────────────────────────────────────────────────
const isRail = () => document.documentElement.dataset.sidebar === 'rail';
function setSidebar(rail) {
  if (rail) document.documentElement.dataset.sidebar = 'rail';
  else delete document.documentElement.dataset.sidebar;
  store.set('hub.sidebar', rail ? 'rail' : 'full');
  const t = $('[data-sidebar-toggle]');
  if (t) {
    t.setAttribute('aria-expanded', String(!rail));
    t.setAttribute('aria-label', rail ? 'Expand sidebar' : 'Collapse sidebar');
    t.setAttribute('data-tip', rail ? 'Expand sidebar  ( [ )' : 'Collapse sidebar  ( [ )');
  }
  // Re-place the nav highlight now and once the width transition is done.
  setActive();
  setTimeout(setActive, 200);
}
const typing = (el) => el instanceof Element && el.closest('input, textarea, select, [contenteditable=""], [contenteditable="true"]') !== null;
let shortcutsBound = false;
function bindShortcuts() {
  if (shortcutsBound) return;
  shortcutsBound = true;
  document.addEventListener('keydown', (e) => {
    if (e.key !== '[' || e.ctrlKey || e.metaKey || e.altKey || typing(e.target)) return;
    const side = $('.side');
    if (!side || !side.offsetParent) return;
    e.preventDefault();
    setSidebar(!isRail());
  });
}

// ── Top bar: title, site selector, updated, theme, account ────────────────
let leaveFns = [];
let siteListeners = [];
let updatedAt = null;
let navId = 0;

function parseIso(iso) {
  return new Date(iso.includes('T') ? iso : `${iso.replace(' ', 'T')}Z`);
}
function topbarSites() {
  const live = state.overview?.sites ?? state.stats?.sites;
  if (live?.length) {
    const list = live.map((x) => ({ slug: x.slug, name: x.city || x.name || x.slug }));
    store.set('hub.sites', JSON.stringify(list));
    return list;
  }
  try {
    const cached = JSON.parse(store.get('hub.sites', '[]'));
    return Array.isArray(cached) ? cached : [];
  } catch {
    return [];
  }
}
function syncSiteSelect() {
  const sel = $('#tb-site');
  if (!sel) return;
  const list = topbarSites();
  fill(sel, h('option', { value: 'all' }, 'All sites'), list.map((x) => h('option', { value: x.slug }, x.name)));
  sel.value = list.some((x) => x.slug === state.site) ? state.site : 'all';
}
function onSiteSelect(e) {
  state.site = e.target.value;
  store.set('hub.site', state.site);
  const ls = siteListeners.slice();
  ls.forEach((fn) => fn(state.site));
  // Site activity (not yet on the new skeleton) reads state.site when it draws.
  if (!ls.length && currentRoute() === '#/stats') route();
}
function renderUpdated() {
  const el = $('#tb-updated');
  if (!el) return;
  if (!updatedAt) {
    el.textContent = '';
    return;
  }
  const mins = Math.round((Date.now() - updatedAt.getTime()) / 60000);
  el.textContent = mins < 1 ? 'Updated just now' : mins < 60 ? `Updated ${mins} min ago` : `Updated ${ago(updatedAt.toISOString())}`;
}
async function refreshNow() {
  const btn = $('#tb-refresh');
  if (btn) btn.disabled = true;
  state.stats = null;
  await loadOverview(true).catch(() => {});
  if (btn) btn.disabled = false;
  route();
}
function topbarSet({ title, context, actions } = {}) {
  const h1 = $('#tb-title');
  if (!h1) return;
  fill(h1, title ?? '');
  const plain = [title].flat(Infinity).filter((x) => typeof x === 'string').join('');
  if (plain) document.title = `${plain} · Hub Admin`;
  const c = $('#tb-context');
  if (c) c.textContent = context || '';
  const a = $('#tb-actions');
  if (a) fill(a, actions ?? []);
}

// ── Phone "More" sheet ─────────────────────────────────────────────────────
let sheetEl = null;
function sheetKey(e) {
  if (e.key === 'Escape') closeSheet();
}
function closeSheet() {
  if (!sheetEl) return;
  sheetEl.remove();
  sheetEl = null;
  document.removeEventListener('keydown', sheetKey);
  const more = $('[data-more]');
  if (more) {
    more.setAttribute('aria-expanded', 'false');
    more.focus({ preventScroll: true });
  }
}
function openSheet() {
  if (sheetEl) return closeSheet();
  const cur = currentRoute();
  const backdrop = h('div', { class: 'sheet-backdrop', onclick: closeSheet });
  const sheet = h(
    'div',
    { class: 'sheet', role: 'dialog', 'aria-modal': 'true', 'aria-label': 'All screens' },
    h('div', { class: 'sheet-grab', 'aria-hidden': 'true' }),
    h('p', { class: 'sheet-title' }, 'All screens'),
    ROUTES.map(([href, label, ic]) => h('a', { href, 'aria-current': href === cur ? 'page' : null, onclick: () => setTimeout(closeSheet, 0) }, icon(ic), h('span', {}, label))),
    h('hr'),
    h('button', { type: 'button', class: 'sheet-btn', onclick: cycleTheme }, icon('moon'), h('span', { 'data-theme-label': '' }, themeLabel()))
  );
  sheetEl = h('div', {}, backdrop, sheet);
  document.body.append(sheetEl);
  document.addEventListener('keydown', sheetKey);
  $('[data-more]')?.setAttribute('aria-expanded', 'true');
  sheet.querySelector('a')?.focus({ preventScroll: true });
}

function buildShell() {
  applyTheme();
  const rail = isRail();
  const link = (cls, [href, label, ic], withTip) => {
    const a = h('a', { class: cls, href, 'data-route': href, 'aria-label': label }, icon(ic), h('span', { class: 'nav-label' }, label), href === '#/inbox' ? h('span', { class: 'nav-badge', 'data-badge': '', hidden: true }) : null);
    if (withTip) attachTip(a, label, { side: 'right', active: isRail });
    return a;
  };
  const navLinks = () => ROUTES.map((r) => link('nav-link', r, true));
  const tabLinks = () => [
    ...ROUTES.filter((r) => r[3]).map((r) => link('', r)),
    h('button', { type: 'button', 'data-more': '', 'data-route': '#/more', 'aria-haspopup': 'dialog', 'aria-expanded': 'false', onclick: openSheet }, icon('grid'), h('span', {}, 'More')),
  ];
  const toggle = h('button', { type: 'button', class: 'side-btn side-toggle', 'data-sidebar-toggle': '', 'aria-expanded': String(!rail), 'aria-label': rail ? 'Expand sidebar' : 'Collapse sidebar', onclick: () => setSidebar(!isRail()) }, icon('chevron', 18), h('span', { class: 'nav-label' }, 'Collapse'));
  attachTip(toggle, rail ? 'Expand sidebar  ( [ )' : 'Collapse sidebar  ( [ )', { side: 'right', active: isRail });
  const themeSide = h('button', { type: 'button', class: 'side-btn', 'data-theme-btn': '', title: themeLabel(), 'aria-label': 'Change theme', onclick: cycleTheme }, icon('moon', 18), h('span', { class: 'nav-label', 'data-theme-label': '' }, themeLabel()));
  attachTip(themeSide, 'Change theme', { side: 'right', active: isRail });
  fill(
    $('#app'),
    h(
      'div',
      { class: 'shell' },
      h(
        'aside',
        { class: 'side' },
        h('div', { class: 'brand' }, h('img', { src: '/icons/logo-rounded.png', alt: '' }), h('div', { class: 'brand-text' }, h('b', {}, 'Hub Admin'), h('small', {}, 'All sites'))),
        h('nav', { class: 'side-nav', 'aria-label': 'Screens' }, navLinks()),
        h('div', { class: 'side-foot' }, themeSide, toggle, h('span', { class: 'user', 'data-user': '' }))
      ),
      h(
        'div',
        { class: 'content' },
        h(
          'header',
          { class: 'topbar' },
          h('div', { class: 'tb-title' }, h('h1', { id: 'tb-title' }), h('p', { class: 'tb-context', id: 'tb-context' })),
          h(
            'div',
            { class: 'tb-tools' },
            h('div', { class: 'tb-actions', id: 'tb-actions' }),
            h('select', { class: 'select tb-select', id: 'tb-site', 'aria-label': 'Site', onchange: onSiteSelect }),
            h('button', { type: 'button', class: 'tb-btn tb-updated', id: 'tb-refresh', title: 'Refresh this screen', 'aria-label': 'Refresh', onclick: refreshNow }, h('span', { id: 'tb-updated' }), icon('refresh', 16)),
            h('button', { type: 'button', class: 'tb-btn icon tb-theme', 'data-theme-btn': '', title: themeLabel(), 'aria-label': 'Change theme', onclick: cycleTheme }, '◐'),
            h('a', { class: 'tb-btn icon tb-account', href: '#/settings', title: 'Settings and account', 'aria-label': 'Settings and account' }, icon('settings', 16))
          )
        ),
        h('main', { id: 'view', tabindex: '-1' })
      )
    ),
    h('nav', { class: 'tabbar', 'aria-label': 'Main' }, tabLinks())
  );
  syncSiteSelect();
  bindShortcuts();
  if (!buildShell.timer) buildShell.timer = setInterval(renderUpdated, 30000);
}

function setActive() {
  const cur = currentRoute();
  document.querySelectorAll('[data-route]').forEach((a) => {
    const r = a.getAttribute('data-route');
    // On phones, a screen that isn't on the tab bar lights up "More".
    const on = r === cur || (r === '#/more' && !!a.closest('.tabbar') && !TAB_ROUTES.includes(cur));
    if (on) a.setAttribute('aria-current', 'page');
    else a.removeAttribute('aria-current');
  });
  // The highlight slides to the active item (sidebar and phone tab bar).
  requestAnimationFrame(() => {
    for (const nav of document.querySelectorAll('.side-nav, .tabbar')) {
      const active = nav.querySelector('[aria-current="page"]');
      if (active && active.offsetParent) motion.nav(nav, active);
    }
  });
}

// Each time a screen finishes rendering (its loading placeholder is gone),
// play its entrance.
function watchView() {
  const view = $('#view');
  if (!view) return;
  new MutationObserver(() => {
    if (!view.querySelector(':scope > .skeleton')) motion.page(view, navId);
  }).observe(view, { childList: true });
}
window.addEventListener('resize', () => setActive());

// The old phone header is gone (the top bar covers it); kept as a no-op so
// screens that still call it keep working.
function mobileHead() {
  return document.createDocumentFragment();
}

// Sets the top bar. Anything passed as `extra` (a refresh button, an
// "updated" note) still shows, in a small row above the screen's content.
function pageHead(title, sub, extra) {
  ui.page({ title, context: sub });
  return extra ? h('div', { class: 'page-actions' }, extra) : document.createDocumentFragment();
}

function errorBox(err) {
  return h('div', { class: 'banner', role: 'alert' }, err.message || String(err));
}

// ── Overview ───────────────────────────────────────────────────────────────
async function loadOverview(force) {
  if (!state.overview || force) state.overview = await api('/api/overview');
  // The real number waiting (the queue list itself is capped).
  const total = state.overview.queueTotal ?? state.overview.queue.length;
  document.querySelectorAll('[data-badge]').forEach((b) => {
    const text = total > 99 ? '99+' : String(total);
    const changed = b.textContent !== text;
    b.hidden = total === 0;
    b.textContent = text;
    if (changed) motion.badge(b);
  });
  document.querySelectorAll('[data-user]').forEach((u) => (u.textContent = state.username || ''));
  syncSiteSelect();
  return state.overview;
}

async function renderOverview(view) {
  fill(view, mobileHead('Overview'), pageHead('Overview', 'Everything across your sites that needs you, and how each site is doing.'), h('div', { class: 'skeleton' }));
  let data;
  try {
    data = await loadOverview();
  } catch (e) {
    fill(view, mobileHead('Overview'), pageHead('Overview'), errorBox(e));
    return;
  }
  const sum = (k) => data.sites.reduce((a, s) => a + (s[k] || 0), 0);
  if (data.generatedAt) ui.setUpdated(parseIso(data.generatedAt));
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
    tile('Needs attention', fmt.int(data.queueTotal ?? data.queue.length), null, HELP.overview.needsAttention),
    tile('Live listings', fmt.int(sum('listings')), null, HELP.overview.listings),
    tile('Paid plans', fmt.int(sum('paidPlans')), null, HELP.overview.paidPlans),
    tile('Revenue this month', fmt.rand(sum('revenueMonthCents')), null, HELP.overview.revenueMonth),
    tile('Registered users', fmt.int(sum('users')), null, HELP.overview.users)
  );

  const siteCards = h('div', { class: 'three' }, data.sites.map(siteCard));
  const liveLine = h('div', { class: 'live-line-wrap' });
  api('/api/analytics-live')
    .then((d) => liveLine.replaceChildren(ui.liveCard(d, { compact: true })))
    .catch(() => {});

  fill(view,
    mobileHead('Overview'),
    heroBanner(data, refresh),
    ...[await passkeyNudge()].filter(Boolean),
    briefingCard(),
    tiles,
    liveLine,
    h('div', { class: 'section-title' }, 'Your sites'),
    siteCards,
    h('div', { class: 'section-title' }, 'Needs attention', help(HELP.overview.needsAttention)),
    queueCard(data)
  );
}

// Today's briefing: written each morning by a Claude routine (it posts to
// /api/briefing/submit). Until it arrives, a plain summary of the numbers.
// Loads on its own so the Overview never waits for it.
let briefingCache = null;
function briefingCard() {
  const card = h('section', { class: 'card briefing', 'aria-label': 'Today’s briefing', 'aria-live': 'polite' });
  const head = (b) =>
    h(
      'div',
      { class: 'card-head' },
      h(
        'div',
        {},
        h('h2', {}, 'Today’s briefing'),
        h(
          'p',
          { class: 'sub' },
          b ? (b.ai ? h('span', { class: 'ai-badge' }, '✦ Written by Claude') : h('span', { class: 'ai-badge plain' }, 'Summary')) : null,
          b ? (b.pending ? ' · from the numbers right now' : ` · morning routine, ${ago(b.created_at)}`) : 'Reading all three sites…'
        )
      )
    );
  const draw = (b) => {
    const x = b.briefing;
    fill(card,
      head(b),
      h('p', { class: 'brief-headline' }, x.headline),
      x.needs_you.length
        ? h('div', { class: 'brief-block' }, h('h3', {}, 'Needs you today'), h('ul', { class: 'brief-list' }, x.needs_you.map((n) => h('li', {}, n.site && n.site !== 'all' ? h('span', { class: 'city-dot', style: `background:${siteColor(n.site)}` }) : h('span', { class: 'city-dot', style: 'background:var(--muted)' }), h('span', {}, n.text)))))
        : null,
      h('div', { class: 'brief-block' }, h('h3', {}, 'Your sites'), h('ul', { class: 'brief-list' }, x.sites.map((s) => h('li', {}, h('span', { class: 'city-dot', style: `background:${siteColor(s.slug)}` }), h('span', {}, h('b', {}, siteName(s.slug)), ` ${s.summary}`))))),
      x.worth_knowing.length ? h('div', { class: 'brief-block' }, h('h3', {}, 'Worth knowing'), h('ul', { class: 'brief-list dots' }, x.worth_knowing.map((w) => h('li', {}, h('span', { class: 'bullet' }), h('span', {}, w))))) : null,
      b.pending ? h('p', { class: 'note' }, 'Claude’s briefing for today arrives at about 6am; this summary is built from the live numbers until then.') : null
    );
    motion.brief(card);
  };
  if (briefingCache && !briefingCache.pending && briefingCache.day === new Date(Date.now() + 2 * 3600000).toISOString().slice(0, 10)) draw(briefingCache);
  else {
    fill(card, head(null), h('div', { class: 'brief-loading' }, h('span'), h('span'), h('span')));
    api('/api/briefing')
      .then((b) => {
        briefingCache = b;
        draw(b);
      })
      .catch((err) => fill(card, head(null), h('p', { class: 'msg err' }, `The briefing couldn’t be loaded: ${err.message}`)));
  }
  return card;
}

// The Overview's header: the three-city banner with a greeting.
function heroBanner(data, refresh) {
  const hour = Number(new Date().toLocaleString('en-ZA', { hour: 'numeric', hour12: false, timeZone: 'Africa/Johannesburg' }));
  const greeting = hour >= 5 && hour < 12 ? 'Good morning' : hour >= 12 && hour < 18 ? 'Good afternoon' : 'Good evening';
  const waiting = data.queueTotal ?? data.queue.length;
  refresh.classList.add('glass');
  return h(
    'section',
    { class: 'hero', 'aria-label': 'Welcome' },
    h('div', { class: 'hero-bg', 'aria-hidden': 'true' }),
    h(
      'div',
      { class: 'hero-content' },
      h('div', { class: 'hero-cities' }, data.sites.map((s) => h('span', {}, h('span', { class: 'city-dot', style: `background:${siteColor(s.slug)}` }), s.city))),
      h('h1', {}, `${greeting}${state.username ? `, ${state.username}` : ''}`),
      h('p', {}, waiting ? `${waiting} item${waiting === 1 ? '' : 's'} across your sites need${waiting === 1 ? 's' : ''} you.` : 'Everything across your sites is up to date.'),
      h('div', { class: 'hero-actions' }, refresh, h('span', { class: 'hero-updated' }, `Updated ${ago(data.generatedAt)}`))
    )
  );
}

// One stat tile for every screen. `delta` is an element or a plain note
// (string); `help` adds the (i) tooltip after the label; `opts.bad` marks it red.
function help(text) {
  return helpIcon(text);
}
function tile(label, value, delta, helpText, opts = {}) {
  const note = typeof delta === 'string' ? h('div', { class: 'delta' }, delta) : delta;
  return h('div', { class: `tile${opts.bad ? ' bad' : ''}` }, h('div', { class: 'label' }, label, helpText ? help(helpText) : null), h('div', { class: 'value' }, value), note || null);
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
      h('span', { class: `status${up ? '' : ' down'}`, title: up ? `Responded in ${s.health.ms} ms` : `HTTP ${s.health?.status ?? 'error'}` }, up ? `Online · ${s.health.ms} ms` : `Down · HTTP ${s.health?.status ?? 'error'}`, help(HELP.overview.online))
    ),
    h(
      'div',
      { class: 'stats-row' },
      h('div', {}, h('b', {}, fmt.int(s.listings)), h('span', {}, 'Listings')),
      h('div', {}, h('b', {}, fmt.int(s.paidPlans)), h('span', {}, 'Paid plans')),
      h('div', {}, h('b', {}, fmt.randShort(s.revenueMonthCents)), h('span', {}, 'This month')),
      h('div', {}, h('b', {}, fmt.int(s.users)), h('span', {}, 'Users')),
      h('div', {}, h('b', {}, s.indexable == null ? '–' : fmt.int(s.indexable)), h('span', {}, 'Indexable', help(HELP.overview.indexable)))
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
    // True counts per type (the list below holds only the newest 25 of each).
    const counts = Object.fromEntries(QUEUE_TYPES.map(([k]) => [k, data.sites.filter((s) => state.queueSite === 'all' || s.slug === state.queueSite).reduce((a, s) => a + (k === 'all' ? s.waiting ?? 0 : s.pending?.[k] ?? 0), 0)]));
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
    const capped = counts[state.queueType] > items.length ? h('p', { class: 'note' }, `Showing the newest ${items.length} of ${counts[state.queueType]}. Clear some and refresh to see the rest.`) : null;
    fill(card, h('div', { class: 'filters' }, seg, siteSel), list, more, capped);
  };
  draw();
  return card;
}

// ── Stats ──────────────────────────────────────────────────────────────────
async function renderStats(view) {
  const head = () =>
    pageHead(
      'Site activity',
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
  fill(view, mobileHead('Site activity'), head(), filters(), h('div', { id: 'stats-body' }, h('div', { class: 'skeleton' })));
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
    fill(body, errorBox(e));
    return;
  }
  if (!state.stats.selected.includes(state.site) && state.site !== 'all') state.site = 'all';
  fill(view, mobileHead('Site activity'), view._statsHead(), view._statsFilters(), drawStats());
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

  const kpi = (label, key, helpText, extra) => {
    const c = sumSites(key, cur);
    const p = sumSites(key, prev);
    let delta = null;
    if (p > 0 || c > 0) {
      const pct = p === 0 ? null : Math.round(((c - p) / p) * 100);
      const dir = c > p ? 'up' : c < p ? 'down' : '';
      const arrow = c > p ? '▲' : c < p ? '▼' : '■';
      delta = h('div', { class: `delta ${dir}` }, pct === null ? `${arrow} new vs previous ${R} days` : `${arrow} ${Math.abs(pct)}% vs previous ${R} days`);
    }
    return tile(label, fmt.int(c), extra ? h('div', {}, extra, delta) : delta, helpText);
  };
  const opensTotal = sumSites('opens', cur);

  const chartCard = (title, sub, draw, table, helpText) => {
    const holder = h('div');
    let showTable = false;
    const btn = h('button', { type: 'button', class: 'toggle-table', 'aria-pressed': 'false' }, 'Show table');
    const render = () => {
      fill(holder, );
      if (showTable) holder.appendChild(table());
      else draw(holder);
      btn.textContent = showTable ? 'Show chart' : 'Show table';
      btn.setAttribute('aria-pressed', String(showTable));
    };
    btn.addEventListener('click', () => ((showTable = !showTable), render()));
    const card = h('section', { class: 'card' }, h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, title, helpText ? help(helpText) : null), sub ? h('p', { class: 'sub' }, sub) : null), table ? btn : null), holder);
    requestAnimationFrame(render);
    return card;
  };

  const dailyTable = (key) => () =>
    dataTable(
      [{ key: 'day', label: 'Day', format: fmt.dayLong }, ...d.perSite.map((s) => ({ key: s.slug, label: siteName(s.slug), num: true, format: fmt.int }))],
      days.map((day, i) => Object.fromEntries([['day', day], ...d.perSite.map((s) => [s.slug, cur(s.series[key])[i]])])).reverse()
    );

  const lineCard = (title, sub, key, helpText) =>
    chartCard(title, sub, (el) => lineChart(el, { x: days, series: seriesFor(key), label: title }), dailyTable(key), helpText);

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
            help: HELP.siteActivity.views,
            render: (r) => h('span', { class: 'bar-cell', style: 'justify-content:flex-end' }, h('i', { style: `width:${Math.max(2, (r.views / topViews) * 80)}px;background:${siteColor(r.site)}` }), fmt.int(r.views)),
          },
          { key: 'contacts', label: 'Contact taps', num: true, format: fmt.int, help: HELP.siteActivity.contacts },
          { key: 'phone', label: 'Phone', num: true, format: fmt.int, help: HELP.siteActivity.channelSplit },
          { key: 'whatsapp', label: 'WhatsApp', num: true, format: fmt.int, help: HELP.siteActivity.channelSplit },
          { key: 'website', label: 'Website', num: true, format: fmt.int, help: HELP.siteActivity.channelSplit },
          { key: 'enquiries', label: 'Enquiries', num: true, format: fmt.int, help: HELP.siteActivity.enquiriesPerListing },
          { key: 'rate', label: 'Tap rate', num: true, help: HELP.siteActivity.tapRate, render: (r) => document.createTextNode(r.views ? `${Math.round((r.contacts / r.views) * 100)}%` : '–') },
        ],
        top
      )
    : h('p', { class: 'empty' }, 'No listing views recorded in this period yet.');

  // Paid vs free: average views and contact taps per listing, all selected sites.
  const pvf = (paid) => d.perSite.reduce((a, s) => { const g = (s.paidVsFree || []).find((x) => x.paid === paid) || { listings: 0, views: 0, taps: 0 }; return { listings: a.listings + g.listings, views: a.views + g.views, taps: a.taps + g.taps }; }, { listings: 0, views: 0, taps: 0 });
  const pvfRows = [['Paid listings', pvf(true)], ['Free listings', pvf(false)]].map(([label, g]) => ({ label, listings: g.listings, views: g.listings ? g.views / g.listings : 0, taps: g.listings ? g.taps / g.listings : 0 }));
  const oneDp = (v) => (v >= 10 ? Math.round(v).toLocaleString('en-ZA') : v.toFixed(1));
  const pvfCard = h(
    'section',
    { class: 'card' },
    h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, 'Paid vs free', help(HELP.siteActivity.paidVsFree)), h('p', { class: 'sub' }, `Per listing, last ${R} days`))),
    dataTable(
      [
        { key: 'label', label: 'Group' },
        { key: 'listings', label: 'Listings', num: true, format: fmt.int },
        { key: 'views', label: 'Views per listing', num: true, format: oneDp },
        { key: 'taps', label: 'Contact taps per listing', num: true, format: oneDp },
      ],
      pvfRows
    )
  );

  const wrap = h(
    'div',
    {},
    h(
      'div',
      { class: 'tiles' },
      kpi('Listing views', 'views', HELP.siteActivity.views),
      kpi('Contact taps', 'contacts', HELP.siteActivity.contacts),
      kpi('Enquiries sent', 'enquiries', HELP.siteActivity.enquiries),
      kpi('Listing appearances in search', 'searches', HELP.siteActivity.searchAppearances),
      kpi('New users', 'signups', HELP.siteActivity.signups),
      kpi('App installs / opens', 'installs', HELP.siteActivity.installs, h('div', { class: 'delta' }, `${fmt.int(opensTotal)} opens`))
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
        dataTable([{ key: 'key', label: 'Search' }, { key: 'n', label: 'Searchers', num: true, format: fmt.int }], queries),
        HELP.siteActivity.searches
      )
    ),
    h('div', { style: 'height:16px' }),
    h('section', { class: 'card' }, h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, 'Top listings'), h('p', { class: 'sub' }, `Most-viewed business pages, last ${R} days`))), topTable),
    h('div', { style: 'height:16px' }),
    pvfCard,
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
        lineCard('App installs per day', 'Phones that installed the site as an app.', 'installs', HELP.siteActivity.installs),
        lineCard('App opens per day', 'Phones opening the site from its home-screen icon.', 'opens', HELP.siteActivity.opens)
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

// What people typed in Google before clicking through (weekly Search Console report).
function queriesCard(d) {
  const queries = d.seo.flatMap((s) => (s.topQueries || []).map((q) => ({ ...q, site: s.slug }))).sort((a, b) => b.clicks - a.clicks).slice(0, 15);
  return h(
    'section',
    { class: 'card' },
    h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, 'Top searches on Google', help(HELP.siteActivity.topQueries)), h('p', { class: 'sub' }, 'Words people searched before clicking through to your sites'))),
    queries.length
      ? dataTable(
          [
            { key: 'site', label: 'Site', render: (r) => h('span', { style: 'display:inline-flex;align-items:center;gap:6px;white-space:nowrap' }, h('span', { class: 'city-dot', style: `background:${siteColor(r.site)}` }), siteName(r.site)) },
            { key: 'query', label: 'Search' },
            { key: 'clicks', label: 'Clicks', num: true, format: fmt.int },
            { key: 'impressions', label: 'Impressions', num: true, format: fmt.int },
            { key: 'position', label: 'Position', num: true, format: (v) => (v ? v.toFixed(1) : '–') },
          ],
          queries
        )
      : h('p', { class: 'empty' }, 'No search data from Google yet.')
  );
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
    queriesCard(d),
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
  fill(view, mobileHead('Manage'), pageHead('Manage', 'Jump straight into any screen of any site’s admin.'), h('div', { class: 'skeleton' }));
  let data;
  try {
    data = await loadOverview();
  } catch (e) {
    fill(view, mobileHead('Manage'), pageHead('Manage'), errorBox(e));
    return;
  }
  fill(view, 
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

// ── Upgrades ───────────────────────────────────────────────────────────────
const STATUS = [
  ['idea', 'Idea'],
  ['planned', 'Planned'],
  ['in_progress', 'In progress'],
  ['done', 'Done'],
];
const PRIORITY = [
  ['urgent', 'Urgent'],
  ['high', 'High'],
  ['normal', 'Normal'],
  ['low', 'Low'],
];
const upState = { status: 'open', site: 'all', q: '', editing: null };

async function sitesList() {
  return (await loadOverview()).sites;
}

function upgradeForm(sites, initial, onSaved, onCancel) {
  const v = initial || { title: '', details: '', sites: ['all'], priority: 'normal', status: 'idea' };
  const msg = h('span', { class: 'msg', role: 'status' });
  const title = h('input', { class: 'input', name: 'title', maxlength: '160', required: true, placeholder: 'e.g. Let owners reply to reviews', value: v.title });
  const details = h('textarea', { class: 'textarea', name: 'details', maxlength: '5000', placeholder: 'What should change, where, and why. Links, examples, anything that helps.' });
  details.value = v.details || '';
  const all = v.sites.includes('all');
  const allBox = h('input', { type: 'checkbox', value: 'all', checked: all });
  const siteBoxes = sites.map((s) => h('input', { type: 'checkbox', value: s.slug, checked: all || v.sites.includes(s.slug) }));
  allBox.addEventListener('change', () => siteBoxes.forEach((b) => (b.checked = allBox.checked)));
  siteBoxes.forEach((b) => b.addEventListener('change', () => (allBox.checked = siteBoxes.every((x) => x.checked))));
  const priority = h('select', { class: 'select', name: 'priority' }, PRIORITY.map(([k, l]) => h('option', { value: k, selected: v.priority === k }, l)));
  const status = h('select', { class: 'select', name: 'status' }, STATUS.map(([k, l]) => h('option', { value: k, selected: v.status === k }, l)));
  const submit = h('button', { class: 'btn primary', type: 'submit' }, initial ? 'Save changes' : [icon('plus', 16), 'Add upgrade']);
  const form = h(
    'form',
    { class: 'form', novalidate: true },
    h('label', { class: 'field' }, h('span', {}, 'Upgrade'), title),
    h('label', { class: 'field' }, h('span', {}, 'Details (optional)'), details),
    h(
      'div',
      { class: 'field' },
      h('span', {}, 'Which sites?'),
      h(
        'div',
        { class: 'checks' },
        h('label', { class: 'check' }, allBox, 'All sites'),
        sites.map((s, i) => h('label', { class: 'check' }, siteBoxes[i], h('span', { class: 'city-dot', style: `background:${siteColor(s.slug)}` }), s.city))
      )
    ),
    h('div', { class: 'row' }, h('label', { class: 'field' }, h('span', {}, 'Priority'), priority), h('label', { class: 'field' }, h('span', {}, 'Status'), status)),
    h('div', { class: 'row', style: 'align-items:center' }, submit, onCancel ? h('button', { class: 'btn', type: 'button', onclick: onCancel }, 'Cancel') : null, msg)
  );
  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    const chosen = allBox.checked ? ['all'] : siteBoxes.filter((b) => b.checked).map((b) => b.value);
    if (!title.value.trim()) return ((msg.className = 'msg err'), (msg.textContent = 'Give the upgrade a short title.'), title.focus());
    if (!chosen.length) return ((msg.className = 'msg err'), (msg.textContent = 'Choose at least one site.'));
    submit.disabled = true;
    msg.className = 'msg';
    msg.textContent = 'Saving…';
    const data = { title: title.value, details: details.value, sites: chosen, priority: priority.value, status: status.value };
    try {
      const r = initial ? await api(`/api/upgrades/${initial.id}`, 'PATCH', data) : await api('/api/upgrades', 'POST', data);
      onSaved(r.upgrade);
      if (!initial) {
        form.reset();
        allBox.checked = true;
        siteBoxes.forEach((b) => (b.checked = true));
        msg.className = 'msg ok';
        msg.textContent = 'Added.';
      }
    } catch (err) {
      msg.className = 'msg err';
      msg.textContent = err.message;
    } finally {
      submit.disabled = false;
    }
  });
  return form;
}

async function renderUpgrades(view) {
  const head = pageHead('To-do', 'Improvements to build on the sites. Add an idea, choose which sites it’s for, and move it along as it gets done.');
  fill(view, mobileHead('To-do'), head, h('div', { class: 'skeleton' }));
  let sites;
  let list;
  try {
    [sites, list] = await Promise.all([sitesList(), api('/api/upgrades').then((r) => r.upgrades)]);
  } catch (e) {
    fill(view, mobileHead('To-do'), head, errorBox(e));
    return;
  }
  const listCard = h('section', { class: 'card', 'aria-label': 'Upgrades list' });
  const addCard = h(
    'section',
    { class: 'card', 'aria-label': 'Add an upgrade' },
    h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, 'Add an upgrade'), h('p', { class: 'sub' }, 'Anything you want changed, fixed or added.'))),
    upgradeForm(sites, null, (u) => {
      list.unshift(u);
      draw();
    })
  );

  const siteTags = (u) =>
    u.sites.includes('all')
      ? [h('span', { class: 'site-tag' }, 'All sites')]
      : u.sites.map((slug) => h('span', { class: 'site-tag' }, h('span', { class: 'city-dot', style: `background:${siteColor(slug)}` }), siteName(slug)));

  const item = (u) => {
    if (upState.editing === u.id) {
      return h(
        'div',
        { class: 'up' },
        upgradeForm(
          sites,
          u,
          (saved) => {
            Object.assign(u, saved);
            upState.editing = null;
            draw();
          },
          () => ((upState.editing = null), draw())
        )
      );
    }
    const statusSel = h(
      'select',
      {
        class: 'select',
        'aria-label': `Status of ${u.title}`,
        onchange: async (e) => {
          const prev = u.status;
          u.status = e.target.value;
          try {
            Object.assign(u, (await api(`/api/upgrades/${u.id}`, 'PATCH', { status: u.status })).upgrade);
          } catch (err) {
            u.status = prev;
            alert(err.message);
          }
          draw();
        },
      },
      STATUS.map(([k, l]) => h('option', { value: k, selected: u.status === k }, l))
    );
    const prioLabel = Object.fromEntries(PRIORITY)[u.priority];
    return h(
      'article',
      { class: `up${u.status === 'done' ? ' done' : ''}` },
      h('div', { class: 'up-top' }, h('div', { class: 'up-title' }, u.title), h('span', { class: `prio ${u.priority}` }, prioLabel)),
      u.details ? h('p', { class: 'up-details' }, u.details) : null,
      h('div', { class: 'up-meta' }, siteTags(u), h('span', {}, `· added ${ago(u.created_at)}`), u.done_at ? h('span', {}, `· done ${ago(u.done_at)}`) : null, u.code_link ? h('a', { href: u.code_link, target: '_blank', rel: 'noopener' }, `· ${/\/pull\//.test(u.code_link) ? 'pull request' : /\/commit\//.test(u.code_link) ? 'commit' : 'code'}`) : null),
      h(
        'div',
        { class: 'up-actions' },
        statusSel,
        h('button', { class: 'btn', type: 'button', onclick: () => ((upState.editing = u.id), draw()) }, icon('edit', 14), 'Edit'),
        // Ready to paste into a Claude Code session on the hub-platform repo.
        h(
          'button',
          {
            class: 'btn',
            type: 'button',
            onclick: async (e) => {
              const btn = e.currentTarget;
              const where = u.sites.includes('all') ? 'all sites' : u.sites.map(siteName).join(', ');
              const text = `Hub Admin upgrade #${u.id} (${Object.fromEntries(PRIORITY)[u.priority]} priority, for ${where}):\n\n${u.title}\n\n${u.details || ''}\n\nPlease build this in the hub-platform repo, test it, and tell me the commit or pull request link so I can attach it to the upgrade in Hub Admin.`.replace(/\n{3,}/g, '\n\n');
              try {
                await navigator.clipboard.writeText(text);
                btn.textContent = 'Copied ✓';
              } catch {
                prompt('Copy this for Claude:', text);
              }
            },
          },
          'Copy for Claude'
        ),
        h(
          'button',
          {
            class: 'btn',
            type: 'button',
            onclick: async () => {
              const link = prompt('Link to the GitHub pull request or commit that builds this (leave empty to remove):', u.code_link || '');
              if (link === null) return;
              try {
                Object.assign(u, (await api(`/api/upgrades/${u.id}`, 'PATCH', { code_link: link.trim() })).upgrade);
                draw();
              } catch (err) {
                alert(err.message);
              }
            },
          },
          u.code_link ? 'Change code link' : 'Link code'
        ),
        h(
          'button',
          {
            class: 'btn',
            type: 'button',
            onclick: async () => {
              if (!confirm(`Delete “${u.title}”? This can’t be undone.`)) return;
              try {
                await api(`/api/upgrades/${u.id}`, 'DELETE');
                list = list.filter((x) => x.id !== u.id);
                draw();
              } catch (err) {
                alert(err.message);
              }
            },
          },
          icon('trash', 14),
          'Delete'
        )
      )
    );
  };

  const draw = () => {
    const q = upState.q.toLowerCase();
    const matches = (u) =>
      (upState.site === 'all' || u.sites.includes('all') || u.sites.includes(upState.site)) &&
      (!q || u.title.toLowerCase().includes(q) || (u.details || '').toLowerCase().includes(q));
    const base = list.filter(matches);
    const counts = { open: base.filter((u) => u.status !== 'done').length, done: base.filter((u) => u.status === 'done').length };
    const shown = base.filter((u) => (upState.status === 'open' ? u.status !== 'done' : upState.status === 'done' ? u.status === 'done' : true));
    const seg = h(
      'div',
      { class: 'seg', role: 'group', 'aria-label': 'Show' },
      [
        ['open', `To do (${counts.open})`],
        ['done', `Done (${counts.done})`],
        ['all', `All (${base.length})`],
      ].map(([k, l]) => h('button', { type: 'button', 'aria-pressed': String(upState.status === k), onclick: () => ((upState.status = k), draw()) }, l))
    );
    const siteSel = h(
      'select',
      { class: 'select', 'aria-label': 'Site', onchange: (e) => ((upState.site = e.target.value), draw()) },
      h('option', { value: 'all' }, 'All sites'),
      sites.map((s) => h('option', { value: s.slug, selected: upState.site === s.slug }, s.city))
    );
    const search = h('input', { class: 'input', type: 'search', placeholder: 'Search upgrades', value: upState.q, style: 'max-width:240px', 'aria-label': 'Search upgrades' });
    search.addEventListener('input', () => {
      upState.q = search.value;
      clearTimeout(search._t);
      search._t = setTimeout(() => {
        draw();
        const s2 = $('input[type=search]', listCard);
        s2?.focus();
        s2?.setSelectionRange(s2.value.length, s2.value.length);
      }, 200);
    });
    const groups = STATUS.filter(([k]) => shown.some((u) => u.status === k)).sort((a, b) => ['in_progress', 'planned', 'idea', 'done'].indexOf(a[0]) - ['in_progress', 'planned', 'idea', 'done'].indexOf(b[0]));
    const body = shown.length
      ? groups.flatMap(([k, l]) => {
          const items = shown.filter((u) => u.status === k);
          return [h('div', { class: 'group-title' }, l, h('b', {}, String(items.length))), h('div', { class: 'up-list' }, items.map(item))];
        })
      : [h('div', { class: 'empty' }, h('b', {}, list.length ? 'Nothing matches' : 'No upgrades yet'), list.length ? 'Try another filter.' : 'Add the first one above.')];
    fill(listCard, h('div', { class: 'filters' }, seg, siteSel, search), ...body);
  };
  draw();
  fill(view, mobileHead('To-do'), head, h('div', { class: 'grid' }, addCard, listCard));
}

// ── Alerts (push notifications) ────────────────────────────────────────────
const ALERT_TYPES = [
  ...QUEUE_TYPES.filter(([k]) => k !== 'all'),
  ['briefing', 'Morning briefing'],
  ['weekly', 'Weekly summary'],
  ['health', 'Site down / back up'],
  ['deploy', 'Failed deploy or job'],
  ['usage', 'Database near its limit'],
  ['routine', 'Late routine'],
];

function pushSupport() {
  const ios = /iPhone|iPad|iPod/.test(navigator.userAgent) || (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1);
  const standalone = window.matchMedia('(display-mode: standalone)').matches || navigator.standalone === true;
  if (ios && !standalone) return 'ios-install';
  if (!('serviceWorker' in navigator) || !('PushManager' in window) || !('Notification' in window)) return 'unsupported';
  if (Notification.permission === 'denied') return 'denied';
  return 'ok';
}

function deviceName() {
  const ua = navigator.userAgent;
  if (/iPhone/.test(ua)) return 'iPhone';
  if (/iPad/.test(ua) || (navigator.platform === 'MacIntel' && navigator.maxTouchPoints > 1)) return 'iPad';
  if (/Android/.test(ua)) return /Mobile/.test(ua) ? 'Android phone' : 'Android tablet';
  if (/Windows/.test(ua)) return 'Windows computer';
  if (/Mac/.test(ua)) return 'Mac';
  return 'This device';
}

function keyBytes(b64url) {
  const b64 = b64url.replace(/-/g, '+').replace(/_/g, '/').padEnd(Math.ceil(b64url.length / 4) * 4, '=');
  return Uint8Array.from(atob(b64), (c) => c.charCodeAt(0));
}

async function currentSubscription() {
  if (!('serviceWorker' in navigator)) return null;
  const reg = await navigator.serviceWorker.ready;
  return reg.pushManager ? reg.pushManager.getSubscription() : null;
}

async function renderAlerts(view) {
  const head = pageHead('Settings', 'Sign-in, password and notifications.');
  fill(view, mobileHead('Settings'), head, h('div', { class: 'skeleton' }));
  const account = await accountCards(view);
  const support = pushSupport();
  let sub = support === 'ok' ? await currentSubscription().catch(() => null) : null;
  let devices = [];
  let history = [];
  try {
    [devices, history] = await Promise.all([
      api(`/api/push/devices?endpoint=${encodeURIComponent(sub?.endpoint || '')}`).then((r) => r.devices),
      api('/api/notifications').then((r) => r.notifications),
    ]);
  } catch (e) {
    fill(view, mobileHead('Settings'), head, errorBox(e));
    return;
  }
  const mine = devices.find((d) => d.current);
  const chosen = new Set(mine ? mine.types : ALERT_TYPES.map(([k]) => k));
  const msg = h('span', { class: 'msg', role: 'status' });
  const say = (text, kind = '') => ((msg.className = `msg ${kind}`), (msg.textContent = text));

  const label = h('input', { class: 'input', value: mine?.label || deviceName(), maxlength: '60', style: 'max-width:260px', 'aria-label': 'Device name' });
  const boxes = ALERT_TYPES.map(([k, l]) => {
    const b = h('input', { type: 'checkbox', value: k, checked: chosen.has(k) });
    b.addEventListener('change', async () => {
      if (b.checked) chosen.add(k);
      else chosen.delete(k);
      if (sub) await save('Saved.');
    });
    return h('label', { class: 'check' }, b, l, HELP.settings.alerts[k] ? help(HELP.settings.alerts[k]) : null);
  });

  async function save(done) {
    try {
      await api('/api/push/subscribe', 'POST', { subscription: sub.toJSON(), types: [...chosen], label: label.value });
      say(done, 'ok');
    } catch (e) {
      say(e.message, 'err');
    }
  }
  label.addEventListener('change', () => sub && save('Saved.'));

  async function turnOn() {
    say('Turning on…');
    try {
      const perm = await Notification.requestPermission();
      if (perm !== 'granted') return say('Notifications were not allowed. Allow them for this site in your browser settings, then try again.', 'err');
      const reg = await navigator.serviceWorker.ready;
      const { publicKey } = await api('/api/push/key');
      sub = (await reg.pushManager.getSubscription()) || (await reg.pushManager.subscribe({ userVisibleOnly: true, applicationServerKey: keyBytes(publicKey) }));
      await save('Notifications are on for this device.');
      renderAlerts(view);
    } catch (e) {
      say(e.message || 'Could not turn notifications on.', 'err');
    }
  }
  async function turnOff() {
    try {
      const endpoint = sub.endpoint;
      await sub.unsubscribe().catch(() => {});
      await api('/api/push/unsubscribe', 'POST', { endpoint });
      sub = null;
      renderAlerts(view);
    } catch (e) {
      say(e.message, 'err');
    }
  }
  async function test() {
    say('Sending…');
    try {
      await api('/api/push/test', 'POST', { endpoint: sub.endpoint });
      say('Sent. It should appear within a few seconds.', 'ok');
    } catch (e) {
      say(e.message, 'err');
    }
  }

  let statusBody;
  if (support === 'ios-install') {
    statusBody = h(
      'div',
      { class: 'banner' },
      h('b', {}, 'One step first on iPhone and iPad: '),
      'Apple only allows notifications from apps on your Home Screen. In Safari, tap the Share button, choose ',
      h('b', {}, 'Add to Home Screen'),
      ', then open Hub Admin from your Home Screen and come back to Alerts.'
    );
  } else if (support === 'unsupported') {
    statusBody = h('div', { class: 'banner' }, 'This browser can’t receive notifications. Use Chrome, Edge, Firefox or Safari (on iPhone: from the Home Screen app).');
  } else if (support === 'denied') {
    statusBody = h('div', { class: 'banner' }, 'Notifications are blocked for Hub Admin in this browser. Allow them in the browser’s site settings (the icon left of the address), then reload this page.');
  } else if (!sub) {
    statusBody = h(
      'div',
      { class: 'form' },
      h('p', { style: 'margin:0;color:var(--text-2)' }, 'Notifications are off on this device.'),
      h('div', { class: 'row', style: 'align-items:center' }, h('button', { class: 'btn primary', type: 'button', onclick: turnOn }, icon('bell', 16), 'Turn on notifications'), msg)
    );
  } else {
    statusBody = h(
      'div',
      { class: 'form' },
      h('p', { style: 'margin:0' }, h('b', { style: 'color:var(--good-text)' }, '● On'), ' · this device gets an alert within about 5 minutes of something new arriving.'),
      h('label', { class: 'field' }, h('span', {}, 'Device name'), label),
      h('div', { class: 'field' }, h('span', {}, 'Alert me about'), h('div', { class: 'checks' }, boxes)),
      h(
        'div',
        { class: 'row', style: 'align-items:center' },
        h('button', { class: 'btn', type: 'button', onclick: test }, 'Send a test'),
        h('button', { class: 'btn', type: 'button', onclick: turnOff }, 'Turn off'),
        msg
      )
    );
  }

  const deviceList = devices.length
    ? devices.map((d) =>
        h(
          'div',
          { class: 'device' },
          icon('bell', 18),
          h('div', { class: 'grow' }, h('b', {}, d.label || 'Device', d.current ? ' (this device)' : ''), h('small', {}, `${d.email} · on since ${ago(d.created_at)}${d.last_sent_at ? ` · last alert ${ago(d.last_sent_at)}` : ''}`)),
          d.current
            ? null
            : h(
                'button',
                {
                  class: 'btn',
                  type: 'button',
                  onclick: async () => {
                    if (!confirm(`Stop alerts on “${d.label || 'this device'}”?`)) return;
                    await api('/api/push/unsubscribe', 'POST', { id: d.id }).catch((e) => alert(e.message));
                    renderAlerts(view);
                  },
                },
                'Remove'
              )
        )
      )
    : h('p', { class: 'empty' }, 'No devices have notifications on yet.');

  const historyList = history.length
    ? h(
        'ul',
        { class: 'queue' },
        history.map((n) =>
          h(
            'li',
            {},
            h(
              'a',
              { href: n.url },
              h('span', { class: 'type' }, 'Alert'),
              h('span', { style: 'min-width:0' }, h('div', { class: 'title' }, n.title), h('div', { class: 'meta' }, n.body)),
              h('span', { class: 'age' }, ago(n.created_at))
            )
          )
        )
      )
    : h('p', { class: 'empty' }, 'No alerts yet. They appear here as new items arrive.');

  fill(view, 
    mobileHead('Settings'),
    head,
    h(
      'div',
      { class: 'grid' },
      ...account,
      h('div', { class: 'section-title', style: 'margin:10px 0 0' }, 'Notifications'),
      h('section', { class: 'card' }, h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, 'Notifications on this device'), h('p', { class: 'sub' }, 'Get an alert when something new needs you, on any site.'))), statusBody),
      h('section', { class: 'card' }, h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, 'Devices with alerts on'), h('p', { class: 'sub' }, 'Every phone and computer that gets Hub Admin notifications.'))), deviceList),
      h('section', { class: 'card' }, h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, 'Recent alerts'), h('p', { class: 'sub' }, 'The last 40 notifications, newest first.'))), historyList)
    )
  );
}

// ── Sign-in, first-time setup, passkeys ────────────────────────────────────
const b64u = (buf) => btoa(String.fromCharCode(...new Uint8Array(buf))).replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
const unb64u = (s) => Uint8Array.from(atob(s.replace(/-/g, '+').replace(/_/g, '/').padEnd(Math.ceil(s.length / 4) * 4, '=')), (c) => c.charCodeAt(0));
const passkeysSupported = () => !!(window.PublicKeyCredential && navigator.credentials);
async function platformPasskeyAvailable() {
  try {
    return passkeysSupported() && (await PublicKeyCredential.isUserVerifyingPlatformAuthenticatorAvailable());
  } catch {
    return false;
  }
}

function authScreen(title, sub, ...body) {
  fill($('#app'), 
    h(
      'div',
      { class: 'auth' },
      h(
        'div',
        { class: 'auth-card' },
        h('img', { src: '/icons/logo-rounded.png', alt: '', class: 'auth-logo' }),
        h('h1', {}, title),
        sub ? h('p', { class: 'auth-sub' }, sub) : null,
        ...body
      )
    )
  );
  motion.auth($('.auth-card'));
}

function field(label, attrs) {
  const input = h('input', { class: 'input', ...attrs });
  return [h('label', { class: 'field' }, h('span', {}, label), input), input];
}

async function passkeySignIn(msg) {
  msg.className = 'msg';
  msg.textContent = 'Waiting for your fingerprint…';
  try {
    const { options } = await api('/api/auth/passkey/login-options', 'POST', {});
    const cred = await navigator.credentials.get({ publicKey: { ...options, challenge: unb64u(options.challenge) } });
    if (!cred) throw new Error('Cancelled.');
    await api('/api/auth/passkey/login', 'POST', {
      id: cred.id,
      clientDataJSON: b64u(cred.response.clientDataJSON),
      authenticatorData: b64u(cred.response.authenticatorData),
      signature: b64u(cred.response.signature),
    });
    store.set('hub.passkey', '1');
    start();
  } catch (e) {
    msg.className = 'msg err';
    msg.textContent = e.name === 'NotAllowedError' ? 'Fingerprint sign-in was cancelled or timed out.' : e.message;
  }
}

function renderLogin(state) {
  const msg = h('span', { class: 'msg', role: 'status' });
  const [userField, user] = field('Username', { name: 'username', autocomplete: 'username webauthn', autocapitalize: 'none', spellcheck: 'false', required: true });
  const [passField, pass] = field('Password', { name: 'password', type: 'password', autocomplete: 'current-password', required: true });
  const submit = h('button', { class: 'btn primary wide', type: 'submit' }, 'Sign in');
  const form = h('form', { class: 'form' }, userField, passField, submit, msg);
  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    submit.disabled = true;
    msg.className = 'msg';
    msg.textContent = 'Signing in…';
    try {
      await api('/api/auth/login', 'POST', { username: user.value, password: pass.value });
      start();
    } catch (err) {
      msg.className = 'msg err';
      msg.textContent = err.message;
      submit.disabled = false;
      motion.shake(form);
    }
  });
  const fp = passkeysSupported()
    ? h('button', { class: 'btn wide', type: 'button', onclick: () => passkeySignIn(msg) }, '👆 Sign in with fingerprint or face')
    : null;
  authScreen(
    'Hub Admin',
    'Sign in to manage your sites.',
    fp,
    fp ? h('div', { class: 'or' }, h('span', {}, 'or use your password')) : null,
    form,
    state.recoveryAvailable ? h('button', { class: 'linkish', type: 'button', onclick: renderRecover }, 'Forgot your password?') : null
  );
  if (!fp) user.focus();
}

function renderRecover() {
  const msg = h('span', { class: 'msg', role: 'status' });
  const [codeField, code] = field('Setup code', { type: 'password', autocomplete: 'off', required: true });
  const [userField, user] = field('Username', { autocomplete: 'username', autocapitalize: 'none', required: true });
  const [passField, pass] = field('New password (at least 10 characters)', { type: 'password', autocomplete: 'new-password', required: true, minlength: '10' });
  const submit = h('button', { class: 'btn primary wide', type: 'submit' }, 'Set new password');
  const form = h('form', { class: 'form' }, codeField, userField, passField, submit, msg);
  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    submit.disabled = true;
    try {
      await api('/api/auth/recover', 'POST', { code: code.value, username: user.value, password: pass.value });
      msg.className = 'msg ok';
      msg.textContent = 'Password changed. You can sign in now.';
      setTimeout(start, 1200);
    } catch (err) {
      msg.className = 'msg err';
      msg.textContent = err.message;
      submit.disabled = false;
      motion.shake(form);
    }
  });
  authScreen('Reset password', 'Use the setup code you saved in GitHub (HUB_ADMIN_SETUP_CODE).', form, h('button', { class: 'linkish', type: 'button', onclick: start }, 'Back to sign in'));
  code.focus();
}

function renderSetup(state) {
  if (!state.setupAvailable) {
    authScreen(
      'Almost ready',
      null,
      h(
        'div',
        { class: 'banner', style: 'text-align:left' },
        'To create your admin account, first add a setup code: in GitHub, open the hub-platform repository → Settings → Secrets and variables → Actions → New repository secret. Name it ',
        h('b', {}, 'HUB_ADMIN_SETUP_CODE'),
        ' and give it a long phrase only you know (at least 12 characters). Then run the “Deploy Hub Admin” workflow and come back here.'
      )
    );
    return;
  }
  const msg = h('span', { class: 'msg', role: 'status' });
  const [codeField, code] = field('Setup code', { type: 'password', autocomplete: 'off', required: true });
  const [userField, user] = field('Choose a username', { autocomplete: 'username', autocapitalize: 'none', spellcheck: 'false', required: true });
  const [passField, pass] = field('Choose a password (at least 10 characters)', { type: 'password', autocomplete: 'new-password', required: true, minlength: '10' });
  const [againField, again] = field('Type the password again', { type: 'password', autocomplete: 'new-password', required: true });
  const submit = h('button', { class: 'btn primary wide', type: 'submit' }, 'Create my account');
  const form = h('form', { class: 'form' }, codeField, userField, passField, againField, submit, msg);
  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    if (pass.value !== again.value) {
      msg.className = 'msg err';
      msg.textContent = 'The two passwords don’t match.';
      return;
    }
    submit.disabled = true;
    try {
      await api('/api/auth/setup', 'POST', { code: code.value, username: user.value, password: pass.value });
      start();
    } catch (err) {
      msg.className = 'msg err';
      msg.textContent = err.message;
      submit.disabled = false;
      motion.shake(form);
    }
  });
  authScreen('Welcome to Hub Admin', 'Create your admin account. You only do this once.', form);
  code.focus();
}

async function addPasskey(msg, onDone) {
  msg.className = 'msg';
  msg.textContent = 'Follow the prompt on your device…';
  try {
    const { options } = await api('/api/auth/passkey/register-options', 'POST', {});
    const cred = await navigator.credentials.create({
      publicKey: {
        ...options,
        challenge: unb64u(options.challenge),
        user: { ...options.user, id: unb64u(options.user.id) },
        excludeCredentials: options.excludeCredentials.map((c) => ({ ...c, id: unb64u(c.id) })),
      },
    });
    if (!cred) throw new Error('Cancelled.');
    const r = cred.response;
    if (typeof r.getPublicKey !== 'function' || !r.getPublicKey()) throw new Error('This browser is too old for passkeys. Update it and try again.');
    await api('/api/auth/passkey/register', 'POST', {
      rawId: b64u(cred.rawId),
      clientDataJSON: b64u(r.clientDataJSON),
      authenticatorData: b64u(r.getAuthenticatorData()),
      publicKey: b64u(r.getPublicKey()),
      publicKeyAlgorithm: r.getPublicKeyAlgorithm(),
      name: deviceName(),
    });
    store.set('hub.passkey', '1');
    msg.className = 'msg ok';
    msg.textContent = 'Done. Next time, sign in with your fingerprint or face.';
    onDone?.();
  } catch (e) {
    msg.className = 'msg err';
    msg.textContent =
      e.name === 'InvalidStateError' ? 'This device already has a passkey for Hub Admin.' : e.name === 'NotAllowedError' ? 'Cancelled or timed out. Try again.' : e.message;
  }
}

// Shown on the Overview after a password sign-in on a device that can do
// fingerprint/face sign-in but hasn't been set up for it yet.
async function passkeyNudge() {
  if (store.get('hub.passkey', '') || store.get('hub.passkeyNudge', '') === 'no' || !(await platformPasskeyAvailable())) return null;
  const msg = h('span', { class: 'msg' });
  const box = h(
    'div',
    { class: 'banner', style: 'display:flex;gap:12px;align-items:center;flex-wrap:wrap' },
    h('span', { style: 'flex:1;min-width:200px' }, h('b', {}, 'Sign in with your fingerprint next time. '), 'Set it up on this device in a few seconds.'),
    h('button', { class: 'btn primary', type: 'button', onclick: () => addPasskey(msg, () => setTimeout(() => box.remove(), 2500)) }, 'Set up'),
    h('button', { class: 'btn', type: 'button', onclick: () => (store.set('hub.passkeyNudge', 'no'), box.remove()) }, 'Not now'),
    msg
  );
  return box;
}

async function accountCards(view) {
  let keys = [];
  try {
    keys = (await api('/api/auth/passkeys')).passkeys;
  } catch {
    /* shown as empty */
  }
  const pkMsg = h('span', { class: 'msg', role: 'status' });
  const passkeyCard = h(
    'section',
    { class: 'card' },
    h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, 'Fingerprint & face sign-in'), h('p', { class: 'sub' }, 'Passkeys let a device sign you in with its fingerprint, face or PIN instead of your password.'))),
    passkeysSupported()
      ? h('div', { class: 'row', style: 'align-items:center;margin-bottom:10px' }, h('button', { class: 'btn primary', type: 'button', onclick: () => addPasskey(pkMsg, () => renderAlerts(view)) }, '👆 Set up on this device'), pkMsg)
      : h('p', { class: 'sub' }, 'This browser doesn’t support passkeys.'),
    keys.length
      ? keys.map((k) =>
          h(
            'div',
            { class: 'device' },
            h('span', { 'aria-hidden': 'true' }, '🔑'),
            h('div', { class: 'grow' }, h('b', {}, k.name), h('small', {}, `added ${ago(k.created_at)}${k.last_used_at ? ` · last used ${ago(k.last_used_at)}` : ''}`)),
            h(
              'button',
              {
                class: 'btn',
                type: 'button',
                onclick: async () => {
                  if (!confirm(`Remove the passkey “${k.name}”? That device will need your password again.`)) return;
                  await api('/api/auth/passkeys', 'POST', { id: k.id }).catch((e) => alert(e.message));
                  if (keys.length === 1) store.set('hub.passkey', '');
                  renderAlerts(view);
                },
              },
              'Remove'
            )
          )
        )
      : h('p', { class: 'sub', style: 'margin-top:6px' }, 'No passkeys yet.')
  );

  const pwMsg = h('span', { class: 'msg', role: 'status' });
  const [curF, cur] = field('Current password', { type: 'password', autocomplete: 'current-password', required: true });
  const [newF, nw] = field('New password (at least 10 characters)', { type: 'password', autocomplete: 'new-password', required: true });
  const pwForm = h('form', { class: 'form' }, h('div', { class: 'row' }, curF, newF), h('div', { class: 'row', style: 'align-items:center' }, h('button', { class: 'btn', type: 'submit' }, 'Change password'), pwMsg));
  pwForm.addEventListener('submit', async (e) => {
    e.preventDefault();
    try {
      await api('/api/auth/password', 'POST', { current: cur.value, password: nw.value });
      pwForm.reset();
      pwMsg.className = 'msg ok';
      pwMsg.textContent = 'Password changed.';
    } catch (err) {
      pwMsg.className = 'msg err';
      pwMsg.textContent = err.message;
    }
  });
  const signOut = async (everywhere) => {
    if (everywhere && !confirm('Sign out on every device, including this one?')) return;
    await api('/api/auth/logout', 'POST', { everywhere }).catch(() => {});
    state.overview = null;
    state.stats = null;
    start();
  };
  const accountCard = h(
    'section',
    { class: 'card' },
    h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, 'Account'), h('p', { class: 'sub' }, `Signed in as ${state.username || ''}`))),
    pwForm,
    h('div', { class: 'row', style: 'margin-top:14px' }, h('button', { class: 'btn', type: 'button', onclick: () => signOut(false) }, 'Sign out'), h('button', { class: 'btn', type: 'button', onclick: () => signOut(true) }, 'Sign out everywhere'))
  );
  return [passkeyCard, accountCard, await weeklyEmailCard(), await adminsCard(view)];
}

// Decides what to show: setup, sign-in, or the app.
let appStarted = false;
async function start() {
  let s;
  try {
    s = await api('/api/auth/state');
  } catch (e) {
    authScreen('Hub Admin', null, errorBox(e), h('button', { class: 'btn', type: 'button', onclick: start }, 'Try again'));
    return;
  }
  if (s.setupNeeded) return renderSetup(s);
  const invite = location.hash.startsWith('#/join') ? hashParams().get('t') : null;
  if (invite && !s.signedIn) return renderJoin(invite);
  if (invite) history.replaceState(null, '', '/#/');
  if (!s.signedIn) return renderLogin(s);
  state.username = s.username;
  buildShell();
  watchView();
  route();
  if (!appStarted) {
    appStarted = true;
    window.addEventListener('hashchange', () => {
      if (!$('#view')) return;
      route();
      $('#view')?.focus({ preventScroll: true });
      window.scrollTo(0, 0);
    });
    // Keep the attention badge fresh while the app stays open.
    setInterval(() => {
      if (document.visibilityState === 'visible' && $('#view')) loadOverview(true).catch(() => {});
    }, 5 * 60 * 1000);
  }
}

// ── Admins (invite links) ──────────────────────────────────────────────────
// The Monday weekly summary by email, per admin.
async function weeklyEmailCard() {
  let cur;
  try {
    cur = await api('/api/account/weekly');
  } catch {
    return null;
  }
  const email = h('input', { class: 'input', type: 'email', value: cur.email, placeholder: 'you@example.com', autocomplete: 'email', style: 'max-width:320px' });
  const box = h('input', { type: 'checkbox', checked: cur.weekly });
  const msg = h('p', { class: 'msg', role: 'status' });
  return h(
    'section',
    { class: 'card' },
    h('h2', { class: 'card-sub' }, 'Weekly summary email'),
    h('p', { class: 'sub', style: 'margin-top:0' }, 'Every Monday morning: last week’s traffic, contact taps, enquiries, new listings, income, problems and finished upgrades for every site. It’s also on the Activity log screen and sent as a notification.'),
    cur.can_send ? null : h('p', { class: 'banner' }, 'Email isn’t switched on yet: add a Resend API key as the GitHub secret HUB_ADMIN_RESEND_KEY and run Deploy Hub Admin. Until then the summary comes as a notification only.'),
    h(
      'form',
      {
        class: 'form',
        onsubmit: async (e) => {
          e.preventDefault();
          try {
            const r = await api('/api/account/weekly', 'POST', { email: email.value.trim(), weekly: box.checked });
            box.checked = r.weekly;
            msg.className = 'msg ok';
            msg.textContent = r.weekly ? `Saved. The summary goes to ${r.email} every Monday.` : 'Saved. No weekly email.';
          } catch (err) {
            msg.className = 'msg err';
            msg.textContent = err.message;
          }
        },
      },
      h('label', { class: 'field' }, h('span', {}, 'Your email address'), email),
      h('label', { class: 'check', style: 'justify-self:start' }, box, 'Email me the weekly summary'),
      h('div', {}, h('button', { class: 'btn primary', type: 'submit' }, 'Save')),
      msg
    )
  );
}

async function adminsCard(view) {
  let data = { admins: [], invites: [] };
  try {
    data = await api('/api/admins');
  } catch {
    /* card shows empty */
  }
  const msg = h('span', { class: 'msg', role: 'status' });
  const linkBox = h('div');
  const [nameField, name] = field('Username for the new admin', { placeholder: 'e.g. guy', autocapitalize: 'none', spellcheck: 'false', maxlength: '60' });
  const create = h('button', { class: 'btn primary', type: 'submit' }, icon('plus', 16), 'Create invite link');
  const form = h('form', { class: 'form' }, nameField, h('div', { class: 'row', style: 'align-items:center' }, create, msg));
  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    create.disabled = true;
    msg.className = 'msg';
    msg.textContent = '';
    try {
      const r = await api('/api/admins/invite', 'POST', { username: name.value.trim() });
      const who = name.value.trim();
      const input = h('input', { class: 'input', readonly: true, value: r.link, 'aria-label': 'Invite link' });
      const copy = h('button', { class: 'btn', type: 'button', onclick: async () => {
        try { await navigator.clipboard.writeText(r.link); copy.textContent = 'Copied ✓'; } catch { input.select(); }
      } }, 'Copy link');
      const share = navigator.share
        ? h('button', { class: 'btn primary', type: 'button', onclick: () => navigator.share({ title: 'Hub Admin invite', text: `Your Hub Admin invite (${who}). It works once and expires in 48 hours.`, url: r.link }).catch(() => {}) }, 'Share…')
        : null;
      fill(linkBox, 
        h(
          'div',
          { class: 'banner', style: 'display:grid;gap:10px;margin-top:12px' },
          h('div', {}, h('b', {}, `Invite for ${who} is ready. `), 'Send this link to them privately (WhatsApp, SMS or email). It works once and expires in 48 hours. They choose their own password, then can set up their fingerprint.'),
          input,
          h('div', { class: 'row' }, share, copy)
        )
      );
      motion.pop(linkBox.firstChild);
      form.reset();
      refreshLists();
    } catch (err) {
      msg.className = 'msg err';
      msg.textContent = err.message;
    } finally {
      create.disabled = false;
    }
  });

  const lists = h('div');
  const refreshLists = async () => {
    try {
      data = await api('/api/admins');
    } catch {
      return;
    }
    fill(lists, 
      ...data.admins.map((a) =>
        h(
          'div',
          { class: 'device' },
          h('span', { class: 'avatar', 'aria-hidden': 'true' }, a.username.slice(0, 1).toUpperCase()),
          h(
            'div',
            { class: 'grow' },
            h('b', {}, a.username, a.me ? ' (you)' : ''),
            h('small', {}, `${a.last_login_at ? `last signed in ${ago(a.last_login_at)}` : 'not signed in yet'} · ${a.passkeys ? `${a.passkeys} passkey${a.passkeys > 1 ? 's' : ''}` : 'no fingerprint yet'}`)
          ),
          a.me
            ? null
            : h(
                'button',
                {
                  class: 'btn',
                  type: 'button',
                  onclick: async () => {
                    if (!confirm(`Remove ${a.username} as an admin? They’ll be signed out everywhere and can’t sign in again.`)) return;
                    await api('/api/admins/remove', 'POST', { id: a.id }).catch((e) => alert(e.message));
                    refreshLists();
                  },
                },
                'Remove'
              )
        )
      ),
      ...data.invites.map((i) =>
        h(
          'div',
          { class: 'device' },
          h('span', { class: 'avatar pending', 'aria-hidden': 'true' }, '✉'),
          h('div', { class: 'grow' }, h('b', {}, i.username), h('small', {}, `invite sent ${ago(i.created_at)} · waiting for them to join`)),
          h('button', { class: 'btn', type: 'button', onclick: async () => (await api('/api/admins/invite', 'POST', { username: i.username, revoke: true }).catch(() => {}), refreshLists()) }, 'Cancel invite')
        )
      )
    );
  };
  await refreshLists();
  return h(
    'section',
    { class: 'card' },
    h('div', { class: 'card-head' }, h('div', {}, h('h2', {}, 'Admins'), h('p', { class: 'sub' }, 'Everyone who can sign in to Hub Admin. All admins can do everything.'))),
    lists,
    h('div', { class: 'section-title', style: 'margin:18px 0 10px' }, 'Add an admin'),
    form,
    linkBox
  );
}

function renderJoin(token) {
  const msg = h('span', { class: 'msg', role: 'status' });
  authScreen('Checking your invite…', null, msg);
  api('/api/auth/join', 'POST', { token })
    .then(({ username }) => {
      const [passField, pass] = field('Choose a password (at least 10 characters)', { type: 'password', autocomplete: 'new-password', required: true, minlength: '10' });
      const [againField, again] = field('Type it again', { type: 'password', autocomplete: 'new-password', required: true });
      const userHint = h('input', { type: 'text', name: 'username', autocomplete: 'username', value: username, hidden: true, readonly: true });
      const submit = h('button', { class: 'btn primary wide', type: 'submit' }, 'Create my account');
      const m2 = h('span', { class: 'msg', role: 'status' });
      const form = h('form', { class: 'form' }, userHint, passField, againField, submit, m2);
      form.addEventListener('submit', async (e) => {
        e.preventDefault();
        if (pass.value !== again.value) return ((m2.className = 'msg err'), (m2.textContent = 'The two passwords don’t match.'));
        submit.disabled = true;
        try {
          await api('/api/auth/join', 'POST', { token, password: pass.value });
          history.replaceState(null, '', '/#/');
          start();
        } catch (err) {
          m2.className = 'msg err';
          m2.textContent = err.message;
          submit.disabled = false;
          motion.shake(form);
        }
      });
      authScreen(`Welcome, ${username}`, 'You’ve been invited to Hub Admin. Choose your password to finish. You can add your fingerprint right after.', form);
      pass.focus();
    })
    .catch((e) => authScreen('Invite link', null, h('div', { class: 'banner' }, e.message), h('button', { class: 'linkish', type: 'button', onclick: () => (history.replaceState(null, '', '/#/'), start()) }, 'Go to sign in')));
}

// ── Router ─────────────────────────────────────────────────────────────────
// Helpers the screen modules (screens/*.js) use, so they draw exactly like
// the rest of the app.
// ── Page skeleton helpers (shared by every screen) ─────────────────────────
let tabSeq = 0;

function kpis(items) {
  if (items.length > 4) console.warn('ui.kpis: more than 4 tiles; keep it to four.');
  return h('div', { class: 'kpis' }, items.map((i) => (i instanceof Node ? i : tile(...i))));
}

// A card with a consistent header row. `help` is the (i) text after the title.
function card({ title, help: helpText, actions, body, sub } = {}) {
  const head =
    title || actions
      ? h(
          'div',
          { class: 'card-head' },
          h('div', {}, title ? h('h2', {}, title, helpText ? help(helpText) : null) : null, sub ? h('p', { class: 'sub' }, sub) : null),
          actions ? h('div', { class: 'card-actions' }, actions) : null
        )
      : null;
  return h('section', { class: 'card' }, head, body ?? null);
}

const stateBox = {
  empty(text, action) {
    const act = action instanceof Node ? action : action?.label ? h('button', { class: 'btn', type: 'button', onclick: action.onclick }, action.label) : null;
    return h('div', { class: 'empty' }, text, act);
  },
  loading() {
    return h('div', { class: 'skeleton', role: 'status', 'aria-label': 'Loading' });
  },
  error(err) {
    return errorBox(err instanceof Error ? err : { message: String(err?.message ?? err) });
  },
};

// Segmented control + one panel. tabs = [{ id, label, render: () => Node | Promise<Node> }].
function tabs(list, opts = {}) {
  const uid = `tabs${++tabSeq}`;
  const saved = opts.store ? store.get(opts.store, null) : null;
  let cur = list.find((t) => t.id === saved)?.id ?? list[0]?.id;
  const bar = h('div', { class: 'tabs-bar', role: 'tablist' });
  const panel = h('div', { class: 'tab-panel', role: 'tabpanel', tabindex: '-1', id: `${uid}-panel` });
  const buttons = list.map((t) =>
    h('button', { type: 'button', role: 'tab', id: `${uid}-${t.id}`, 'aria-controls': `${uid}-panel`, onclick: () => select(t.id) }, t.label)
  );
  const draw = () => {
    const t = list.find((x) => x.id === cur);
    if (!t) return fill(panel);
    const id = cur;
    panel.setAttribute('aria-labelledby', `${uid}-${id}`);
    try {
      const out = t.render();
      if (out && typeof out.then === 'function') {
        fill(panel, stateBox.loading());
        out.then((n) => cur === id && fill(panel, n)).catch((e) => cur === id && fill(panel, stateBox.error(e)));
      } else fill(panel, out);
    } catch (e) {
      fill(panel, stateBox.error(e));
    }
  };
  const mark = () =>
    buttons.forEach((b, i) => {
      const on = list[i].id === cur;
      b.setAttribute('aria-selected', String(on));
      b.tabIndex = on ? 0 : -1;
    });
  function select(id, focus) {
    if (id === cur && panel.firstChild) return;
    cur = id;
    if (opts.store) store.set(opts.store, id);
    mark();
    draw();
    if (focus) buttons[list.findIndex((t) => t.id === id)]?.focus();
  }
  bar.addEventListener('keydown', (e) => {
    const i = list.findIndex((t) => t.id === cur);
    const to = e.key === 'ArrowRight' ? (i + 1) % list.length : e.key === 'ArrowLeft' ? (i - 1 + list.length) % list.length : e.key === 'Home' ? 0 : e.key === 'End' ? list.length - 1 : -1;
    if (to < 0) return;
    e.preventDefault();
    select(list[to].id, true);
  });
  bar.append(...buttons);
  mark();
  draw();
  return h('div', { class: 'tabs' }, bar, panel);
}

// "Right now" live card (data from /api/analytics-live). compact: one line.
function liveCard(data, { compact = false } = {}) {
  const sites = data?.sites ?? [];
  const L = HELP.live;
  if (compact) {
    const parts = sites.filter((s) => s.live).map((s) => `${s.name} ${fmt.int(s.live.activeUsers)}`);
    if (!parts.length) return h('span');
    return h('a', { class: 'live-line', href: '#/analytics' }, h('span', { class: 'live-dot', 'aria-hidden': 'true' }), h('b', {}, 'Right now: '), `${parts.join(' · ')} active`);
  }
  const spark = (vals, color) => {
    const w = 120, ht = 28, max = Math.max(1, ...vals);
    const pts = vals.map((v, i) => `${((i / Math.max(1, vals.length - 1)) * w).toFixed(1)},${(ht - 2 - (v / max) * (ht - 4)).toFixed(1)}`).join(' ');
    const el = h('span', { class: 'sparkline', role: 'img', 'aria-label': 'Active users, last 30 minutes' });
    el.innerHTML = `<svg viewBox="0 0 ${w} ${ht}" preserveAspectRatio="none" aria-hidden="true"><polyline points="${pts}" fill="none" stroke="${color}" stroke-width="1.5" stroke-linejoin="round" stroke-linecap="round" vector-effect="non-scaling-stroke"/></svg>`;
    return el;
  };
  const secs = data?.generatedAt ? Math.max(0, Math.round((Date.now() - new Date(data.generatedAt).getTime()) / 1000)) : null;
  const col = (s) => {
    const fp = s.firstParty ?? {};
    const color = siteColor(s.slug);
    const devTotal = (s.live?.devices ?? []).reduce((a, d) => a + d.users, 0);
    return h(
      'div',
      { class: 'live-col' },
      h(
        'div',
        { class: 'live-col-head' },
        h('span', { class: 'city-dot', style: `background:${color}` }),
        h('b', {}, s.name || siteName(s.slug)),
        s.up && s.up.ok === false ? h('span', { class: 'pill fail' }, 'offline') : null
      ),
      s.live
        ? [
            h('div', { class: 'live-num' }, fmt.int(s.live.activeUsers), h('span', { class: 'live-unit' }, 'active', help(L.activeUsers))),
            spark(s.live.byMinute ?? [], color),
            h('div', { class: 'live-sub' }, 'Pages now', help(L.pages)),
            h('ul', { class: 'live-pages' }, s.live.pages.length ? s.live.pages.slice(0, 3).map((p) => h('li', {}, h('span', {}, p.name || '(not set)'), h('b', {}, fmt.int(p.users)))) : h('li', { class: 'muted' }, 'No one right now')),
            devTotal ? h('div', { class: 'live-devices' }, s.live.devices.map((d) => `${d.name} ${Math.round((d.users / devTotal) * 100)}%`).join(' · ')) : null,
          ]
        : h('p', { class: 'live-note' }, 'Live data needs the Google credentials on Hub Admin — the deploy sets them'),
      h(
        'div',
        { class: 'live-today' },
        h('div', { class: 'live-sub' }, 'Today so far', help(L.todaySoFar)),
        h('span', {}, `${s.today ? fmt.int(s.today.sessions) : '–'} sessions`),
        h('span', {}, `${fmt.int(fp.views ?? 0)} listing views`),
        h('span', {}, `${fmt.int(fp.taps ?? 0)} contact taps`),
        h('span', {}, `${fmt.int(fp.enquiries ?? 0)} enquiries`)
      )
    );
  };
  return h(
    'section',
    { class: 'card live-card' },
    h('div', { class: 'live-head' }, h('span', { class: 'live-dot', 'aria-hidden': 'true' }), h('h2', {}, 'Right now'), h('span', { class: 'sub' }, secs == null ? '' : `updated ${secs}s ago`)),
    h('div', { class: 'live-cols' }, sites.map(col))
  );
}

const ui = {
  liveCard,
  h, fill, icon, api, ago, siteColor, siteName, mobileHead, pageHead, errorBox, hashParams, store, motion,
  tile, help, HELP,
  charts: { lineChart, columnChart, barList, dataTable, fmt },
  get state() {
    return state;
  },
  loadOverview,
  // Page skeleton
  page: (opts) => {
    topbarSet(opts);
    return null;
  },
  kpis,
  card,
  tabs,
  onLeave: (fn) => {
    leaveFns.push(fn);
  },
  // Global site selector (top bar)
  site: () => state.site,
  onSiteChange: (fn) => {
    siteListeners.push(fn);
    return () => {
      siteListeners = siteListeners.filter((f) => f !== fn);
    };
  },
  setUpdated: (date) => {
    updatedAt = date instanceof Date ? date : date ? new Date(date) : null;
    renderUpdated();
  },
};
// `ui.state` is the app's data object (existing screens read it); the skeleton
// helpers ui.state.empty / .loading / .error are attached to it here.
Object.assign(state, { empty: stateBox.empty, loading: stateBox.loading, error: stateBox.error });
const SCREENS = {
  '#/inbox': 'inbox',
  '#/health': 'health',
  '#/listings': 'listings',
  '#/google': 'google',
  '#/analytics': 'analytics',
  '#/index-gate': 'index-gate',
  '#/money': 'money',
  '#/activity': 'activity',
  '#/social': 'social',
};
let routeSeq = 0;
async function renderScreen(view, name) {
  const seq = ++routeSeq;
  fill(view, h('div', { class: 'skeleton' }));
  try {
    const mod = await import(`./screens/${name}.js`);
    if (seq !== routeSeq) return; // the user has moved on
    // Sites (names, colours) come from the Overview data.
    await loadOverview().catch(() => {});
    if (seq !== routeSeq) return;
    await mod.render(view, ui);
  } catch (e) {
    if (seq === routeSeq) fill(view, mobileHead('Hub Admin'), pageHead('Something went wrong'), errorBox(e));
  }
}

function renderMore(view) {
  fill(
    view,
    mobileHead('More'),
    pageHead('More', 'Everything else in Hub Admin.'),
    h(
      'nav',
      { class: 'card more-list', 'aria-label': 'More screens' },
      ROUTES.filter((r) => !r[3]).map(([href, label, ic]) => h('a', { href }, icon(ic), h('span', {}, label), icon('chevron', 16)))
    )
  );
}

function route() {
  setActive();
  const view = $('#view');
  const r = currentRoute();
  routeSeq++;
  navId++;
  // Timers/listeners a screen registered belong to the screen being left.
  const leaving = leaveFns;
  leaveFns = [];
  siteListeners = [];
  for (const fn of leaving) {
    try {
      fn();
    } catch {
      /* a failed cleanup must not block navigation */
    }
  }
  closeSheet();
  updatedAt = null;
  renderUpdated();
  syncSiteSelect();
  topbarSet({ title: ROUTES.find(([x]) => x === r)?.[1] ?? (r === '#/more' ? 'More' : '') });
  if (SCREENS[r]) renderScreen(view, SCREENS[r]);
  else if (r === '#/more') renderMore(view);
  else if (r === '#/stats') renderStats(view);
  else if (r === '#/upgrades') renderUpgrades(view);
  else if (r === '#/manage') renderManage(view);
  else if (r === '#/settings') renderAlerts(view);
  else {
    // A notification can open the Overview filtered to one kind of item.
    const t = hashParams().get('type');
    if (t && QUEUE_TYPES.some(([k]) => k === t)) state.queueType = t;
    renderOverview(view);
  }
}

start();

if ('serviceWorker' in navigator) {
  // When a new version of the app takes over, reload once so its screens
  // appear without closing the app; check for one whenever it's reopened.
  const hadController = !!navigator.serviceWorker.controller;
  let reloaded = false;
  navigator.serviceWorker.addEventListener('controllerchange', () => {
    if (!hadController || reloaded) return;
    reloaded = true;
    location.reload();
  });
  navigator.serviceWorker
    .register('/sw.js')
    .then((reg) => document.addEventListener('visibilitychange', () => document.visibilityState === 'visible' && reg.update().catch(() => {})))
    .catch(() => {});
}
