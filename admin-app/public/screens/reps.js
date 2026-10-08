// Sales reps: every city's commission-only sales reps in one place. Totals
// across cities, a table per city, and a drill-down per rep with banking
// details, sales (void an approved one) and payouts. A city that couldn't be
// read shows a muted error line instead of failing the screen.

export async function render(view, ui) {
  const { h, fill, api, mobileHead, pageHead, errorBox } = ui;
  const head = () => [mobileHead('Sales reps'), pageHead('Sales reps', 'Reps who sell plans on commission: sales, what they’re owed, and payouts.')];
  const R = (c) => ui.charts.fmt.rand(c || 0);
  const date = (s) => (s ? String(s).slice(0, 10) : '–');
  const tile = (label, value, note) => h('div', { class: 'tile' }, h('div', { class: 'label' }, label), h('div', { class: 'value' }, value), h('div', { class: 'delta' }, note));
  const pill = (status) => h('span', { class: `pill ${{ active: 'pass', approved: 'info', paid: 'pass', pending: 'warn', suspended: 'fail', void: 'fail' }[status] || ''}` }, status);

  async function act(payload, done) {
    try {
      await api('/api/reps', 'POST', payload);
      await done();
    } catch (e) {
      alert(e.message);
    }
  }

  async function list() {
    fill(view, head(), h('div', { class: 'skeleton' }));
    let d;
    try {
      d = await api('/api/reps');
    } catch (e) {
      fill(view, head(), errorBox(e));
      return;
    }
    const btn = (label, onclick, opts = {}) => h('button', { class: `btn small ${opts.danger ? 'danger' : ''}`, type: 'button', disabled: opts.disabled ? true : undefined, onclick }, label);
    const section = (c) => {
      let body;
      if (!c.ok) body = h('p', { class: 'note' }, `Couldn’t load: ${c.error || 'unknown error'}`);
      else if (!c.reps.length) body = h('p', { class: 'note' }, 'No reps yet');
      else
        body = ui.charts.dataTable(
          [
            { key: 'code', label: 'Code', render: (r) => h('code', {}, r.code) },
            { key: 'email', label: 'Email' },
            { key: 'createdAt', label: 'Joined', format: date },
            { key: 'salesCount', label: 'Sales', num: true, format: ui.charts.fmt.int },
            { key: 'mtdCents', label: 'MTD', num: true, format: R },
            { key: 'lifetimeCents', label: 'Lifetime', num: true, format: R },
            { key: 'unpaidCents', label: 'Unpaid', num: true, format: R },
            { key: 'bankMasked', label: 'Bank', render: (r) => h('span', {}, r.bankMasked || '—') },
            { key: 'status', label: 'Status', render: (r) => pill(r.status) },
            {
              key: 'id',
              label: 'Actions',
              render: (r) =>
                h(
                  'span',
                  { class: 'up-actions' },
                  btn('View', () => detail(c, r.id)),
                  r.status === 'suspended'
                    ? btn('Reactivate', () => {
                        if (confirm(`Reactivate ${r.email}?`)) act({ site: c.slug, action: 'reactivate', repId: r.id }, list);
                      })
                    : btn('Suspend', () => {
                        if (confirm(`Suspend ${r.email}? They won’t earn new commission while suspended.`)) act({ site: c.slug, action: 'suspend', repId: r.id }, list);
                      }),
                  btn(
                    'Mark paid',
                    () => {
                      const reference = (prompt('EFT reference') || '').trim();
                      if (!reference) return;
                      if (confirm(`Pay ${R(r.unpaidCents)} to ${r.email}?`)) act({ site: c.slug, action: 'mark-paid', repId: r.id, reference }, list);
                    },
                    { disabled: !(r.unpaidCents > 0) || !r.hasBank }
                  )
                ),
            },
          ],
          c.reps
        );
      return h('section', { class: 'card' }, h('h2', { class: 'card-sub' }, c.name), body);
    };
    fill(
      view,
      head(),
      h('div', { class: 'tiles' }, tile('Reps', ui.charts.fmt.int(d.grand.reps), 'across all cities'), tile('Active', ui.charts.fmt.int(d.grand.activeReps), 'not suspended'), tile('MTD commission', R(d.grand.mtdCents), 'this month'), tile('Unpaid balance', R(d.grand.unpaidCents), 'approved, not yet paid')),
      d.cities.map(section)
    );
  }

  async function detail(c, id) {
    fill(view, head(), h('div', { class: 'skeleton' }));
    let d;
    try {
      d = await api(`/api/reps?site=${encodeURIComponent(c.slug)}&id=${id}`);
    } catch (e) {
      fill(view, head(), h('a', { href: '#/reps', onclick: (ev) => (ev.preventDefault(), list()) }, '← Back'), errorBox(e));
      return;
    }
    const { rep, sales, payouts } = d;
    const back = h('a', { href: '#/reps', onclick: (ev) => (ev.preventDefault(), list()) }, '← Back to all reps');
    const bank = rep.bank
      ? h(
          'ul',
          { class: 'rows compact' },
          [['Bank', rep.bank.bankName], ['Account holder', rep.bank.accountHolder], ['Account number', rep.bank.accountNumber], ['Branch code', rep.bank.branchCode], ['Account type', rep.bank.accountType], ['Consent given', date(rep.bank.consentAt)]].map(([k, v]) => h('li', {}, h('div', { class: 'row-main' }, h('span', { class: 'meta' }, k)), h('b', {}, v || '–')))
        )
      : h('p', { class: 'note' }, 'No banking details yet');
    const salesTable = sales.length
      ? ui.charts.dataTable(
          [
            { key: 'clientName', label: 'Client' },
            { key: 'productLabel', label: 'Product' },
            { key: 'createdAt', label: 'Date', format: date },
            { key: 'saleAmountCents', label: 'Sale', num: true, format: R },
            { key: 'commissionCents', label: 'Commission', num: true, format: R },
            { key: 'status', label: 'Status', render: (s) => h('span', {}, pill(s.status), s.voidReason ? ` ${s.voidReason}` : '') },
            { key: 'payoutReference', label: 'Payout ref', render: (s) => h('span', {}, s.payoutReference || '—') },
            {
              key: 'id',
              label: '',
              render: (s) =>
                s.status === 'approved'
                  ? h('button', { class: 'btn small danger', type: 'button', onclick: () => {
                      const reason = (prompt('Reason for voiding this commission') || '').trim();
                      if (reason) act({ site: c.slug, action: 'void', commissionId: s.id, reason }, () => detail(c, id));
                    } },'Void')
                  : h('span'),
            },
          ],
          sales
        )
      : h('p', { class: 'note' }, 'No sales yet');
    const payoutTable = payouts.length
      ? ui.charts.dataTable(
          [
            { key: 'paidAt', label: 'Paid', format: date },
            { key: 'period', label: 'Period' },
            { key: 'totalCents', label: 'Total', num: true, format: R },
            { key: 'reference', label: 'Reference' },
            { key: 'paidBy', label: 'Paid by' },
          ],
          payouts
        )
      : h('p', { class: 'note' }, 'No payouts yet');
    fill(
      view,
      head(),
      back,
      h('section', { class: 'card' }, h('h2', { class: 'card-sub' }, `${c.name}: `, h('code', {}, rep.code)), h('p', {}, rep.email, ' ', pill(rep.status)), h('p', { class: 'note' }, `Joined ${date(rep.createdAt)}${rep.suspendedAt ? `, suspended ${date(rep.suspendedAt)}` : ''}`)),
      h('section', { class: 'card' }, h('h3', { class: 'card-sub' }, 'Banking details'), bank),
      h('section', { class: 'card' }, h('h3', { class: 'card-sub' }, `Sales (${sales.length})`), salesTable),
      h('section', { class: 'card' }, h('h3', { class: 'card-sub' }, `Payouts (${payouts.length})`), payoutTable)
    );
  }

  await list();
}
