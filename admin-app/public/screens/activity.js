// Activity log: what happened across every city (approvals, claims,
// payments, renewals, settings changes, ...) and in Hub Admin itself
// (upgrades, invites), newest first.

const LABELS = {
  submission_approved: 'Listing approved',
  submission_rejected: 'Listing rejected',
  submission_expired: 'Listing submission expired',
  submission_payment_received: 'Listing payment received',
  submission_refund_needed: 'Refund needed',
  submission_email_changed: 'Submission email changed',
  submission_expiry_escalated: 'Submission waiting too long',
  claim_approved: 'Claim approved',
  claim_rejected: 'Claim rejected',
  event_claim_approved: 'Event claim approved',
  event_claim_rejected: 'Event claim rejected',
  event_removed: 'Event removed',
  event_featured: 'Event featured',
  event_submission_payment_received: 'Event payment received',
  owner_confirmed: 'Owner confirmed listing',
  owner_disputed: 'Owner disputed listing',
  owner_linked: 'Owner linked',
  owner_unlinked: 'Owner removed',
  subscription_activated: 'Plan started',
  subscription_renewed: 'Plan renewed',
  subscription_cancelled: 'Plan cancelled',
  subscription_expired: 'Plan expired',
  subscription_replaced: 'Plan changed',
  subscription_admin_removed: 'Plan removed by admin',
  renewal_refund_needed: 'Renewal refund needed',
  sponsorship_expired: 'Sponsor spot expired',
  sponsorship_cleared: 'Sponsor spot cleared',
  settings_saved: 'Settings changed',
  settings_reset: 'Settings reset',
  user_deleted: 'User deleted',
  upgrade_added: 'Upgrade added',
  upgrade_idea: 'Upgrade moved to Idea',
  upgrade_planned: 'Upgrade planned',
  upgrade_in_progress: 'Upgrade started',
  upgrade_done: 'Upgrade done',
  upgrade_deleted: 'Upgrade deleted',
  admin_invited: 'Admin invited',
  admin_removed: 'Admin removed',
};
const label = (k) => LABELS[k] ?? k.replace(/_/g, ' ').replace(/^./, (c) => c.toUpperCase());
const tone = (k) => (/refund|disputed|expired|cancelled|rejected|removed|deleted|escalated/.test(k) ? 'fail' : /approved|confirmed|received|activated|renewed|done|started/.test(k) ? 'pass' : '');
const filter = { site: 'all', q: '', shown: 60 };

export async function render(view, ui) {
  const { h, fill, api, mobileHead, pageHead, errorBox } = ui;
  const head = () => [mobileHead('Activity log'), pageHead('Activity log', 'What happened on every site and in Hub Admin, newest first.')];
  fill(view, head(), h('div', { class: 'skeleton' }));
  let items;
  let weekly;
  try {
    ({ items, weekly } = await api('/api/activity'));
  } catch (e) {
    fill(view, head(), errorBox(e));
    return;
  }
  const listEl = h('section', { class: 'card' });
  const sites = ui.state.overview?.sites ?? [];
  const filters = h(
    'div',
    { class: 'filters' },
    h('input', { class: 'input', type: 'search', placeholder: 'Search the log', value: filter.q, 'aria-label': 'Search the log', oninput: (e) => ((filter.q = e.target.value), (filter.shown = 60), draw()) }),
    h('select', { class: 'select', 'aria-label': 'Where', onchange: (e) => ((filter.site = e.target.value), (filter.shown = 60), draw()) }, h('option', { value: 'all' }, 'Everywhere'), sites.map((s) => h('option', { value: s.slug, selected: filter.site === s.slug }, s.city)), h('option', { value: 'hub', selected: filter.site === 'hub' }, 'Hub Admin'))
  );
  const body = h('div', {}, weekly ? weeklyCard(ui, weekly) : null, filters, listEl);
  const draw = () => {
    const q = filter.q.toLowerCase();
    const list = items.filter((i) => (filter.site === 'all' || (filter.site === 'hub' ? i.source === 'hub' : i.site === filter.site)) && (!q || `${label(i.action)} ${i.target ?? ''} ${i.detail ?? ''} ${i.actor ?? ''}`.toLowerCase().includes(q)));
    const shown = list.slice(0, filter.shown);
    let lastDay = '';
    fill(
      listEl,
      shown.length
        ? h(
            'ul',
            { class: 'rows log' },
            shown.flatMap((i) => {
              const dayLabel = new Date(`${i.created_at.replace(' ', 'T')}Z`).toLocaleDateString('en-ZA', { weekday: 'long', day: 'numeric', month: 'long' });
              const sep = dayLabel !== lastDay ? h('li', { class: 'day' }, dayLabel) : null;
              lastDay = dayLabel;
              return [
                sep,
                h(
                  'li',
                  {},
                  i.source === 'hub' ? h('span', { class: 'city-dot', style: 'background:var(--brand)', title: 'Hub Admin' }) : h('span', { class: 'city-dot', style: `background:${ui.siteColor(i.site)}`, title: ui.siteName(i.site) }),
                  h('div', { class: 'row-main' }, h('span', {}, h('span', { class: `pill ${tone(i.action)}` }, label(i.action)), i.target ? h('b', { style: 'margin-left:8px' }, i.target) : null), h('span', { class: 'meta' }, [i.source === 'hub' ? `Hub Admin · ${i.actor}` : ui.siteName(i.site), i.detail].filter(Boolean).join(' · '))),
                  h('span', { class: 'meta', style: 'white-space:nowrap' }, new Date(`${i.created_at.replace(' ', 'T')}Z`).toLocaleTimeString('en-ZA', { hour: '2-digit', minute: '2-digit' }))
                ),
              ];
            })
          )
        : h('div', { class: 'empty' }, h('b', {}, 'Nothing here'), 'No activity matches.'),
      list.length > shown.length ? h('div', { style: 'text-align:center;margin-top:12px' }, h('button', { class: 'btn', type: 'button', onclick: () => ((filter.shown += 60), draw()) }, `Show more (${list.length - shown.length} left)`)) : null
    );
  };
  draw();
  fill(view, head(), body);
}

function weeklyCard(ui, w) {
  const { h } = ui;
  const pct = (a, b) => (b ? `${a >= b ? '▲' : '▼'} ${Math.abs(Math.round(((a - b) / b) * 100))}%` : a ? 'new' : '');
  const cell = (x, money) => h('span', {}, money ? ui.charts.fmt.rand(x.week) : ui.charts.fmt.int(x.week), ' ', h('span', { class: `delta ${x.week >= x.prev ? 'up' : 'down'}` }, pct(x.week, x.prev)));
  return h(
    'details',
    { class: 'card inbox-item', style: 'margin-bottom:16px' },
    h('summary', {}, h('span', { class: 'pill info' }, 'Weekly summary'), h('span', { class: 'inbox-main' }, h('b', {}, `Week to ${w.week_ending}`), h('span', { class: 'meta' }, `Sent ${ui.ago(w.created_at)} · tap to open`)), ui.icon('chevron', 16)),
    h(
      'div',
      { class: 'inbox-body' },
      ui.charts.dataTable(
        [
          { key: 'name', label: 'Site', render: (s) => h('span', { class: 'inline-city' }, h('span', { class: 'city-dot', style: `background:${ui.siteColor(s.slug)}` }), s.name) },
          { key: 'views', label: 'Views', num: true, render: (s) => cell(s.views) },
          { key: 'contact_taps', label: 'Contact taps', num: true, render: (s) => cell(s.contact_taps) },
          { key: 'enquiries', label: 'Enquiries', num: true, render: (s) => cell(s.enquiries) },
          { key: 'new_listings', label: 'New listings', num: true, render: (s) => cell(s.new_listings) },
          { key: 'income', label: 'Income', num: true, render: (s) => cell(s.income_cents, true) },
          { key: 'uptime', label: 'Uptime', num: true, render: (s) => document.createTextNode(w.uptime[s.slug] != null ? `${w.uptime[s.slug]}%` : '–') },
        ],
        w.sites
      ),
      w.failed_jobs.length ? h('p', { class: 'msg err' }, `Failed jobs: ${w.failed_jobs.join(', ')}`) : null,
      h('p', { class: 'sub', style: 'margin:0' }, w.upgrades_done.length ? `Upgrades done: ${w.upgrades_done.join('; ')}.` : 'No upgrades finished that week.', ` ${w.upgrades_open} still open.`)
    )
  );
}
