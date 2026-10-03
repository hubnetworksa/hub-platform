// Inbox: everything waiting on every site, with the full details of each
// item (the submitted listing, the review, the message, the report), so you
// can decide at a glance. Approving, rejecting and replying still happen in
// that city's own admin: each item opens the right screen there.

const TYPES = [
  ['all', 'All'],
  ['submission', 'New listings'],
  ['claim', 'Claims'],
  ['report', 'Reports'],
  ['message', 'Messages'],
  ['review', 'Reviews'],
  ['event', 'Events'],
  ['event-claim', 'Event claims'],
];
const LABEL = { submission: 'New listing', claim: 'Business claim', report: 'Report', message: 'Message', review: 'Review', event: 'Event', 'event-claim': 'Event claim' };
const view_ = { type: 'all', site: 'all', shown: 30 };

export async function render(view, ui) {
  const { h, fill, api, mobileHead, pageHead, errorBox } = ui;
  const t = ui.hashParams().get('type');
  if (t && TYPES.some(([k]) => k === t)) view_.type = t;
  const head = () => [mobileHead('Inbox'), pageHead('Inbox', 'Everything waiting for you on every site, with the full details. Open an item in its site’s admin to act on it.')];
  fill(view, head(), h('div', { class: 'skeleton' }));
  let items;
  try {
    ({ items } = await api('/api/inbox'));
  } catch (e) {
    fill(view, head(), errorBox(e));
    return;
  }
  const body = h('div');
  const sites = ui.state.overview?.sites ?? [];
  const draw = () => {
    const inSite = items.filter((i) => view_.site === 'all' || i.site === view_.site);
    const list = inSite.filter((i) => view_.type === 'all' || i.type === view_.type);
    const count = (k) => inSite.filter((i) => k === 'all' || i.type === k).length;
    const shown = list.slice(0, view_.shown);
    fill(
      body,
      h(
        'div',
        { class: 'filters' },
        h('div', { class: 'seg', role: 'group', 'aria-label': 'Filter by type' }, TYPES.filter(([k]) => k === 'all' || count(k)).map(([k, label]) => h('button', { type: 'button', 'aria-pressed': String(view_.type === k), onclick: () => ((view_.type = k), (view_.shown = 30), draw()) }, `${label} (${count(k)})`))),
        h('select', { class: 'select', 'aria-label': 'Filter by site', onchange: (e) => ((view_.site = e.target.value), (view_.shown = 30), draw()) }, h('option', { value: 'all' }, 'All sites'), sites.map((s) => h('option', { value: s.slug, selected: view_.site === s.slug }, s.city)))
      ),
      list.length ? h('div', { class: 'inbox' }, shown.map((it) => itemCard(ui, it))) : h('section', { class: 'card' }, h('div', { class: 'empty' }, h('b', {}, 'All clear'), 'Nothing is waiting for you here.')),
      list.length > shown.length ? h('div', { style: 'text-align:center;margin-top:14px' }, h('button', { class: 'btn', type: 'button', onclick: () => ((view_.shown += 30), draw()) }, `Show more (${list.length - shown.length} left)`)) : null
    );
  };
  draw();
  fill(view, head(), body);
}

function itemCard(ui, it) {
  const { h, siteColor, siteName } = ui;
  const linkish = (v) => (/^https:\/\//.test(v) ? h('a', { href: v, target: '_blank', rel: 'noopener' }, v.replace(/^https:\/\/[^/]+/, '') || v) : v);
  return h(
    'details',
    { class: 'card inbox-item' },
    h(
      'summary',
      {},
      h('span', { class: 'type' }, LABEL[it.type] ?? it.type),
      h(
        'span',
        { class: 'inbox-main' },
        h('b', {}, it.title || '(untitled)'),
        h('span', { class: 'meta inline-city' }, h('span', { class: 'type-inline' }, `${LABEL[it.type] ?? it.type} · `), h('span', { class: 'city-dot', style: `background:${siteColor(it.site)}` }), siteName(it.site), ` · ${ui.ago(it.created_at)}`),
        it.flags.length ? h('span', { class: 'chips' }, it.flags.map((f) => h('span', { class: `chip${/not|never|Older|already|Removal|Flagged/.test(f) ? ' hot' : ''}` }, f))) : null
      ),
      ui.icon('chevron', 16)
    ),
    h(
      'div',
      { class: 'inbox-body' },
      it.text ? h('blockquote', {}, it.text) : null,
      it.fields.length ? h('dl', { class: 'fields' }, it.fields.map(([k, v]) => h('div', {}, h('dt', {}, k), h('dd', {}, linkish(v))))) : null,
      h('a', { class: 'btn primary', href: it.link, target: '_blank', rel: 'noopener' }, `Open in ${siteName(it.site)} admin`, ui.icon('ext', 14))
    )
  );
}
