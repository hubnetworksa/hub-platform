// Inbox: everything waiting on every site, with the full details of each
// item (the submitted listing, the review, the message, the report), and the
// buttons to deal with it here: approve, reject, resolve or reply. Each
// action runs through that site's own endpoint (api/inbox/act.ts), so emails
// and rebuilds happen exactly as from the site's admin. "Open in admin" is
// still there for anything else.

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
  const head = () => [mobileHead('Inbox'), pageHead('Inbox', 'Everything waiting for you on every site. Open an item to see the details and approve, reject or reply right here.')];
  fill(view, head(), h('div', { class: 'skeleton' }));
  let items;
  let totals = {};
  try {
    ({ items, totals = {} } = await api('/api/inbox'));
  } catch (e) {
    fill(view, head(), errorBox(e));
    return;
  }
  const body = h('div');
  const sites = ui.state.overview?.sites ?? [];
  const draw = () => {
    const inSite = items.filter((i) => view_.site === 'all' || i.site === view_.site);
    const list = inSite.filter((i) => view_.type === 'all' || i.type === view_.type);
    const loaded = (k) => inSite.filter((i) => k === 'all' || i.type === k).length;
    // The true number waiting (each type loads at most 100 rows per site).
    const count = (k) => {
      const real = Object.entries(totals).filter(([slug]) => view_.site === 'all' || slug === view_.site).reduce((a, [, t]) => a + (k === 'all' ? Object.values(t).reduce((x, y) => x + y, 0) : t[k] ?? 0), 0);
      return Math.max(real, loaded(k));
    };
    const shown = list.slice(0, view_.shown);
    fill(
      body,
      h(
        'div',
        { class: 'filters' },
        h('div', { class: 'seg', role: 'group', 'aria-label': 'Filter by type' }, TYPES.filter(([k]) => k === 'all' || count(k)).map(([k, label]) => h('button', { type: 'button', 'aria-pressed': String(view_.type === k), onclick: () => ((view_.type = k), (view_.shown = 30), draw()) }, `${label} (${count(k)})`))),
        h('select', { class: 'select', 'aria-label': 'Filter by site', onchange: (e) => ((view_.site = e.target.value), (view_.shown = 30), draw()) }, h('option', { value: 'all' }, 'All sites'), sites.map((s) => h('option', { value: s.slug, selected: view_.site === s.slug }, s.city)))
      ),
      list.length ? h('div', { class: 'inbox' }, shown.map((it) => itemCard(ui, it, () => ((items = items.filter((x) => x !== it)), draw(), ui.loadOverview(true).catch(() => {}))))) : h('section', { class: 'card' }, h('div', { class: 'empty' }, h('b', {}, 'All clear'), 'Nothing is waiting for you here.')),
      count(view_.type) > loaded(view_.type) ? h('p', { class: 'note' }, `Showing the newest ${loaded(view_.type)} of ${count(view_.type)}. Deal with some and refresh to see the rest.`) : null,
      list.length > shown.length ? h('div', { style: 'text-align:center;margin-top:14px' }, h('button', { class: 'btn', type: 'button', onclick: () => ((view_.shown += 30), draw()) }, `Show more (${list.length - shown.length} left)`)) : null
    );
  };
  draw();
  fill(view, head(), body);
}

function itemCard(ui, it, onDone) {
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
        it.flags.length ? h('span', { class: 'chips' }, it.flags.map((f) => {
          const tip = Object.entries(ui.HELP.inbox.flags).find(([k]) => f.startsWith(k))?.[1];
          return h('span', { class: `chip${/not|never|Older|already|Removal|Flagged/.test(f) ? ' hot' : ''}` }, f, tip ? ui.help(tip) : null);
        })) : null
      ),
      ui.icon('chevron', 16)
    ),
    h(
      'div',
      { class: 'inbox-body' },
      it.text ? h('blockquote', {}, it.text) : null,
      it.fields.length ? h('dl', { class: 'fields' }, it.fields.map(([k, v]) => h('div', {}, h('dt', {}, k), h('dd', {}, linkish(v))))) : null,
      actions(ui, it, onDone),
      h('a', { class: 'btn small', href: it.link, target: '_blank', rel: 'noopener' }, `Open in ${siteName(it.site)} admin`, ui.icon('ext', 13))
    )
  );
}

// What each kind of item can be done with: [action, button label, needs a "sure?" check].
const ACTIONS = {
  submission: [['approve', 'Approve'], ['reject', 'Reject', 'Reject this listing? The person who submitted it isn’t told why.']],
  claim: [['approve', 'Approve claim'], ['reject', 'Reject', 'Reject this claim?']],
  report: [['resolve', 'Mark resolved']],
  message: [['resolve', 'Mark done']],
  review: [['approve', 'Publish review'], ['reject', 'Reject', 'Reject this review? It won’t appear on the site.']],
  event: [['approve', 'Approve event'], ['reject', 'Reject', 'Reject this event?']],
  'event-claim': [['approve', 'Approve claim'], ['reject', 'Reject', 'Reject this event claim?']],
};

function actions(ui, it, onDone) {
  const { h, api } = ui;
  const msg = h('p', { class: 'msg', role: 'status' });
  const wrap = h('div', { class: 'act' });
  const run = async (btns, action, extra = {}) => {
    btns.forEach((b) => (b.disabled = true));
    msg.className = 'msg';
    msg.textContent = 'Working…';
    try {
      const r = await api('/api/inbox/act', 'POST', { site: it.site, type: it.type, id: it.id, action, ...extra });
      msg.className = 'msg ok';
      msg.textContent = r.message || 'Done.';
      setTimeout(onDone, 900);
    } catch (e) {
      msg.className = 'msg err';
      msg.textContent = e.message;
      btns.forEach((b) => (b.disabled = false));
    }
  };
  let list = ACTIONS[it.type] ?? [];
  // A claim older than 14 days can only be dismissed (the site's rule).
  if (it.type === 'claim' && it.flags.some((f) => f.startsWith('Older than 14 days'))) list = [['dismiss', 'Dismiss', 'Dismiss this expired claim?']];
  const btns = [];
  for (const [action, label, sure] of list) {
    const b = h('button', { class: `btn ${action === 'reject' || action === 'dismiss' ? 'danger' : 'primary'}`, type: 'button', onclick: () => (!sure || confirm(sure)) && run(btns, action) }, label);
    btns.push(b);
  }
  // Messages with an email address can be answered from here.
  const contact = it.fields.find(([k]) => k === 'Contact')?.[1] ?? '';
  let reply = null;
  if (it.type === 'message' && /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(contact)) {
    const ta = h('textarea', { class: 'textarea', rows: '4', placeholder: `Reply to ${contact}…`, 'aria-label': 'Your reply' });
    const send = h('button', { class: 'btn primary', type: 'button', onclick: () => (ta.value.trim().length < 2 ? ((msg.className = 'msg err'), (msg.textContent = 'Write a reply first.')) : run([...btns, send], 'reply', { text: ta.value.trim() })) }, 'Send reply');
    btns.push(send);
    reply = h('div', { class: 'reply' }, ta, h('div', { class: 'row' }, send, h('span', { class: 'meta' }, `Sent from the site’s own address; replies come back to it. The message is marked done.`)));
  }
  wrap.append(...[reply, h('div', { class: 'row' }, ...btns.filter((b) => !reply || !b.textContent.startsWith('Send'))), msg].filter(Boolean));
  return wrap;
}
