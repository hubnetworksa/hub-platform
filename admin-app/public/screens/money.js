// Money: what the sites earn. Income per month (plans, sponsor spots and
// event payments), monthly recurring income, new and cancelled plans,
// payments that didn't go through, plans ending soon, the free listings most
// worth offering a paid plan to, and AdSense earnings.

export async function render(view, ui) {
  const { h, fill, api } = ui;
  ui.page({ title: 'Money', context: 'What the sites earn, what needs following up, and who to offer a paid plan.' });
  fill(view, ui.state.loading());
  let d;
  try {
    d = await api('/api/money');
  } catch (e) {
    fill(view, ui.state.error(e));
    return;
  }
  if (d.adsense_updated_at) ui.setUpdated(d.adsense_updated_at);
  const draw = () => {
    const site = ui.site();
    const chosen = site === 'all' ? d.sites : d.sites.filter((s) => s.slug === site);
    fill(view, body(ui, { ...d, sites: chosen.length ? chosen : d.sites }, site !== 'all' && chosen.length > 0));
  };
  ui.onSiteChange(draw);
  draw();
}

function body(ui, d, single) {
  const { h } = ui;
  const { fmt } = ui.charts;
  const R = (c) => fmt.rand(c || 0);
  const sum = (k) => d.sites.reduce((a, s) => a + (typeof s[k] === 'number' ? s[k] : s[k].length), 0);
  const month = new Date().toISOString().slice(0, 7);
  const thisMonth = d.sites.reduce((a, s) => a + s.revenue.filter((r) => r.m === month).reduce((b, r) => b + r.cents, 0), 0);
  const ads = adsenseTotals(d.adsense);
  const M = ui.HELP.money;

  const kpis = ui.kpis([
    ['Income this month', R(thisMonth), 'plans, sponsor spots and events', M.income],
    ['Monthly recurring income', R(sum('mrr_cents')), 'active plans and sponsor spots (yearly ÷ 12)', M.mrr],
    ['Paying customers', String(sum('paying')), `${sum('new_this_month')} new, ${sum('cancelled_this_month')} cancelled this month`, M.paying],
    ['AdSense (30 days)', ads ? ads.label30 : '–', ads ? `${ads.labelMonth} this month` : d.adsense?.error ? 'not connected' : 'arrives with the Google data', M.adsense],
  ]);

  // Income per month, one column per site.
  const months = [...Array(12).keys()].map((i) => {
    const dt = new Date();
    dt.setUTCDate(1);
    dt.setUTCMonth(dt.getUTCMonth() - 11 + i);
    return dt.toISOString().slice(0, 7);
  });
  const chart = h('div');
  requestAnimationFrame(() =>
    ui.charts.columnChart(chart, {
      x: months,
      series: d.sites.map((s) => ({ name: ui.siteName(s.slug), color: ui.siteColor(s.slug), values: months.map((m) => s.revenue.filter((r) => r.m === m).reduce((a, r) => a + r.cents, 0)) })),
      format: fmt.randShort,
      xLabel: fmt.month,
      xLong: fmt.monthLong,
      label: 'Income per month',
    })
  );

  // Paying customers split by what they bought (plans vs each kind of sponsor spot).
  const byProduct = {};
  for (const s of d.sites) for (const p of s.by_product || []) byProduct[p.product] = (byProduct[p.product] || 0) + p.n;
  const productBars = h('div');
  ui.charts.barList(productBars, { items: Object.entries(byProduct).sort((a, b) => b[1] - a[1]).map(([label, value]) => ({ label, value })) });
  const primary = ui.card({
    title: 'Income per month',
    body: h('div', { class: 'two' }, chart, h('div', {}, h('h3', {}, 'Paying customers by product', ui.help(M.byProduct)), productBars)),
  });

  const list = (title, items, empty, note, helpText) =>
    h(
      'section',
      { class: 'card' },
      h('h3', {}, `${title} (${items.length})`, helpText ? ui.help(helpText) : null),
      items.length
        ? h('ul', { class: 'rows compact' }, items.map((x) => h('li', {}, h('span', { class: 'city-dot', style: `background:${ui.siteColor(x.site)}` }), h('div', { class: 'row-main' }, h('a', { href: `https://${x.domain}/business/${x.slug}/`, target: '_blank', rel: 'noopener' }, x.business), h('span', { class: 'meta' }, [x.product, x.period, x.note].filter(Boolean).join(' · '))), x.cents ? h('b', {}, R(x.cents)) : null)))
        : h('p', { class: 'msg ok' }, empty),
      note ? h('p', { class: 'note' }, note) : null
    );
  const all = (k) => d.sites.flatMap((s) => s[k].map((x) => ({ ...x, site: s.slug, domain: s.domain })));
  const followUp = () =>
    h(
      'div',
      { class: 'stack' },
      h(
        'div',
        { class: 'two' },
        list('Payments that didn’t go through (60 days)', all('failed').map((f) => ({ ...f, product: f.status, note: f.paid_at?.slice(0, 10) })), 'None.', null, M.failed),
        list('Renewal overdue', all('overdue'), 'None: every active plan has renewed.', 'Marked active, but no payment came in after the period ended. The PayFast subscription may have failed.', M.overdue)
      ),
      h('div', { class: 'two' }, list('Ending or renewing in 14 days', all('ending_soon'), 'Nothing in the next two weeks.'), list('Cancelled this month', all('cancelled_this_month'), 'No cancellations this month.')),
      list('New this month', all('new_this_month'), 'No new paid plans yet this month.')
    );

  return h(
    'div',
    {},
    kpis,
    primary,
    ui.tabs(
      [
        { id: 'follow', label: 'Follow up', render: followUp },
        { id: 'upsell', label: 'Upsell candidates', render: () => upsellCard(ui, d) },
        { id: 'adsense', label: 'AdSense by domain', render: () => adsenseCard(ui, d, ads, single) },
      ],
      { store: 'hub.tab.money' }
    )
  );
}

function upsellCard(ui, d) {
  const { h } = ui;
  const rows = d.sites.flatMap((s) => s.upsell.map((u) => ({ ...u, site: s.slug, domain: s.domain }))).sort((a, b) => b.taps * 5 + b.views - (a.taps * 5 + a.views)).slice(0, 30);
  return h(
    'section',
    { class: 'card' },
    h('p', { class: 'sub' }, 'Free listings with the most views and contact taps in the last 30 days. Their owners already get customers from the site, so they’re the most likely to pay for Verified or Featured. “Claimed” means there’s an owner account to contact.'),
    rows.length
      ? ui.charts.dataTable(
          [
            { key: 'name', label: 'Business', render: (r) => h('span', { class: 'inline-city' }, h('span', { class: 'city-dot', style: `background:${ui.siteColor(r.site)}` }), h('a', { href: `https://${r.domain}/business/${r.slug}/`, target: '_blank', rel: 'noopener' }, r.name)) },
            { key: 'views', label: 'Views', num: true, format: ui.charts.fmt.int },
            { key: 'taps', label: 'Contact taps', num: true, format: ui.charts.fmt.int },
            { key: 'owned', label: 'Owner', render: (r) => h('span', { class: `pill ${r.owned ? 'pass' : ''}` }, r.owned ? 'Claimed' : 'Not claimed') },
          ],
          rows
        )
      : h('p', { class: 'msg ok' }, 'No free listings with visits yet.')
  );
}

function adsenseTotals(a) {
  if (!a || a.error || !a.daily?.length) return null;
  const cur = a.currency || 'ZAR';
  const f = (n) => new Intl.NumberFormat('en-ZA', { style: 'currency', currency: cur, maximumFractionDigits: n >= 100 ? 0 : 2 }).format(n);
  const since = new Date(Date.now() - 30 * 86400000).toISOString().slice(0, 10);
  const month = new Date().toISOString().slice(0, 7);
  const e30 = a.daily.filter((r) => r.date >= since).reduce((s, r) => s + r.earnings, 0);
  const em = a.daily.filter((r) => r.date.startsWith(month)).reduce((s, r) => s + r.earnings, 0);
  return { f, label30: f(e30), labelMonth: f(em) };
}

function adsenseCard(ui, d, ads, single) {
  const { h } = ui;
  const a = d.adsense;
  if (!a) return h('section', { class: 'card' }, h('div', { class: 'empty' }, h('b', {}, 'Arrives with the daily Google data'), 'The “Hub Admin Google data” workflow also reads AdSense each morning.'));
  if (a.error) return h('section', { class: 'card' }, h('div', { class: 'banner' }, `AdSense couldn’t be read: ${a.error}`), h('p', { class: 'sub' }, 'The Google sign-in used by the reports needs the “adsense.readonly” scope, and the AdSense account must be approved.'));
  if (!ads) return h('section', { class: 'card' }, h('div', { class: 'empty' }, h('b', {}, 'No AdSense earnings yet'), 'Earnings appear once ads start showing on the sites.'));
  const since = new Date(Date.now() - 30 * 86400000).toISOString().slice(0, 10);
  const byDomain = {};
  for (const r of a.daily.filter((x) => x.date >= since)) {
    byDomain[r.domain] ||= { earnings: 0, pageViews: 0, clicks: 0 };
    byDomain[r.domain].earnings += r.earnings;
    byDomain[r.domain].pageViews += r.pageViews;
    byDomain[r.domain].clicks += r.clicks;
  }
  const site = (domain) => d.sites.find((s) => domain.endsWith(s.domain));
  const bars = h('div');
  ui.charts.barList(bars, { items: Object.entries(byDomain).filter(([domain]) => !single || site(domain)).sort((x, y) => y[1].earnings - x[1].earnings).map(([domain, v]) => ({ label: domain, sub: `${ui.charts.fmt.int(v.pageViews)} page views, ${v.clicks} clicks`, value: v.earnings, color: site(domain) ? ui.siteColor(site(domain).slug) : 'var(--muted)' })), format: ads.f });
  return h('section', { class: 'card' }, h('p', { class: 'sub' }, `Estimated earnings, last 30 days (updated ${ui.ago(d.adsense_updated_at)}).`), bars);
}
