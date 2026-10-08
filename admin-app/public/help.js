// Hub Admin help: every "why it matters" tooltip lives here so the wording is
// in one place (rule: 25 words or fewer; say what the number is AND why you'd
// act on it), plus helpIcon(), the small (i) button that shows one.
//
// The tooltip bubble is a single floating element on <body> (not a ::after on
// the button) so it is never clipped by a scrolling table or moved by a card's
// hover transform. Hover or keyboard focus shows it; a tap or click pins it
// open (class "open" on the button); tapping elsewhere or Escape closes it.

export const HELP = {
  overview: {
    needsAttention: 'Things waiting for a decision from you: new listings, claims, reports, messages, reviews, events. Clear these daily — owners are waiting.',
    listings: 'Published listings visitors can see. Growth here is only good if the pages are real (see Listings to fix).',
    paidPlans: 'Active Verified/Featured plans and sponsor spots, excluding free comps. Your recurring income base.',
    revenueMonth: 'Money received since the 1st (plans, sponsors, events). Compare with Monthly recurring on Money.',
    users: 'Accounts with a confirmed email. Owners and reps come from here.',
    online: 'Homepage answered in the last 5-minute check. Down = visitors and Google get errors.',
    indexable: 'Listings that currently pass the index gate. The number Google is allowed to show.',
  },
  indexGate: {
    listings: 'Published listings scored out of 15 for real content. Low scores are the ones to improve first.',
    weak: 'Listings scoring below the review score, excluding paid or claimed. Fix these to make the site look real.',
    almost: 'Listings one point under the review score. Adding one missing item lifts them out of the weak list.',
    protected: 'Pages with Google impressions in the last 90 days. They are never hidden, whatever the score.',
    gate: 'Whether low scores are hidden from Google. Normally off: the score only guides which listings to improve.',
    missing: 'What weak listings lack, most common first. Fixing the top item improves the most listings.',
    weakest: 'The lowest-scoring listings, worst first. Open each and add the missing items.',
  },
  inbox: {
    // Keyed by the flag text the Inbox API sends.
    flags: {
      'Paid plan, not paid yet': "They chose a paid plan but PayFast hasn't confirmed. Don't approve as paid until it does.",
      'Email not confirmed': 'The submitter never clicked the confirmation link; the email may be wrong.',
      'Listing already has an owner': 'A second person is claiming it. Ask for proof before transferring.',
      'Older than 14 days': "Waiting too long hurts the owner's trust. Decide or ask for what's missing.",
      'Flagged by the owner': 'The business owner disputes this review. Read both sides before publishing.',
    },
  },
  siteActivity: {
    views: 'Unique visitor views of business pages (1 per visitor per listing per day). The core demand signal.',
    contacts: 'Phone, WhatsApp and website taps on listings. This is what owners pay for — show it in sales conversations.',
    enquiries: 'Messages sent through listing forms. The strongest lead signal you have.',
    searchAppearances: 'How many listings on-site searches showed. One search listing 40 businesses counts 40.',
    signups: 'Confirmed sign-ups per day. Reps and claims start here.',
    installs: 'People who added the site to their phone and came back through it. Loyal audience.',
    opens: 'Phones opening the site from its home-screen icon, per day. Rising opens mean installed users keep coming back.',
    tapRate: 'Contact taps ÷ views for a listing. High = the page convinces; low = page or business looks unconvincing.',
    searches: 'The exact words visitors type. Missing categories and gaps for new listings come from here.',
    topQueries: 'Searches that showed your pages in the last 7 days vs the 7 before. A query that was high last month but is gone now is a page Google dropped.',
    enquiriesPerListing: 'Enquiries sent through this listing’s form in the period. Listings with views but none need a better page.',
    channelSplit: 'Phone, WhatsApp and website taps on this listing. Shows how its customers prefer to reach it.',
    paidVsFree: 'Average views and contact taps per listing, paid against free. Use the gap to show owners what a plan earns.',
  },
  health: {
    sitesUp: 'Sites whose homepage answered in the last check. Anything below 3 needs you now.',
    uptime7: 'Share of 5-minute checks that passed. Under 99.5% means visitors and Google hit errors.',
    response: 'Homepage answer time. Over 1.5 s on repeat checks hurts rankings and conversions.',
    failingJobs: 'Scheduled GitHub jobs whose last run failed: deploys, backups, Google data. Open the run to see why.',
    database: 'Cloudflare D1 rows read / written today against the free daily limit. Hitting it breaks the sites.',
    lateRoutines: "Cloud routines that haven't run on schedule. Paused ones are listed separately and are fine.",
    security: 'Headers, HTTPS, admin exposure checks. Fix any red item the same day.',
    brokenLinks: 'Links on your pages that 404, incl. dead business websites. Each one is a bad visit and a crawl waste.',
    dbAnswering: 'Whether the site’s database answered the last check. A failure here takes the whole site down even if the page loads.',
    rowsWritten: 'Rows written per day across all databases. The free limit is far lower than for reads, so watch this one.',
    pausedRoutines: 'Routines switched off on purpose. They are not late and send no alerts until turned back on.',
  },
  listings: {
    quality: 'Average share of the 5 basics (phone, hours, description, address, category) listings have. Google and visitors judge the same things.',
    duplicates: 'Same phone or name in one suburb. Merge them — duplicates dilute rankings and confuse visitors.',
    stale: 'Nothing changed in six months. Stale pages are the first Google drops.',
    noViews: 'Nobody opened the page in three months. Enrich it, noindex it, or merge it.',
    thin: 'Category-in-suburb pages with 1–2 businesses. Always noindexed; add businesses to make them count.',
    indexScore: 'Content points out of 15. Below the city threshold the page is noindexed until improved.',
    unclaimed: 'Listings with no owner contact or claim. Every claim is a trust signal and a sales lead.',
  },
  money: {
    income: 'Money received since the 1st. Includes once-off event features.',
    mrr: 'What active plans and sponsor spots pay per month if nothing changes. The number to grow.',
    paying: 'Businesses with an active paid plan (free comps excluded). New and cancelled this month below it.',
    adsense: 'Ad income across the sites. Only shows on free listings and non-sponsored pages.',
    failed: "PayFast failed or declined. The owner usually doesn't know — contact them.",
    overdue: 'Paid period ended, no renewal yet. The plan expires soon; a reminder recovers most.',
    upsell: 'Free listings with real views and taps. Owners who can see the value of a paid plan.',
    byProduct: 'Paying customers split by what they bought: plans and each kind of sponsor spot. Shows where income depends on one product.',
  },
  reps: {
    mtd: 'Commission earned this month (approved + paid). Pending is not included.',
    unpaid: 'Approved commission not yet paid out. Pay at month end by EFT and mark paid.',
    pending: "Earned on a first payment but waiting for the business's second payment (yearly plans: 30 days). Voids automatically if they cancel.",
    sales: "Commissions that weren't voided. One per new customer.",
    paidOut: 'Commission already paid out by EFT this month. Compare with Unpaid balance to see what is left to pay.',
    paidAt: 'The date this commission was included in a payout. Empty means it has not been paid yet.',
  },
  google: {
    clicks: 'Visits that started on a Google result. The number that pays.',
    impressions: 'Impressions: how often a page appeared in results. Rising impressions with flat clicks = titles need work.',
    pagesSeen: 'Distinct pages that appeared in results that day. A cliff here is how the Pretoria drop showed up.',
    indexed: 'From URL inspection samples. The ceiling for everything else.',
    position: 'Where your pages rank on average. 1–10 is page one. Lower is better.',
    ctr: "Clicks ÷ impressions. Under 1% on page-one positions means the title/description doesn't sell the click.",
    leftOut: 'Indexing states per page type. "Discovered – not indexed" = Google will not spend crawl on it; thin content is the usual cause.',
    gapsGoogle: 'Queries where you rank 10+. Small content improvements move these first.',
    gapsOnSite: 'On-site searches with 1–2 results. Categories or suburbs worth filling.',
    protectedPages: 'Pages with Google impressions in 90 days. The index gate never hides these.',
    topQueries: 'Searches that showed your pages in the last 7 days vs the 7 before. A query that was high last month but is gone now is a page Google dropped.',
    checked: 'The day Google last inspected this page. Old dates mean the verdict may have changed.',
  },
  recovery: {
    pagesSeen: 'Pages that appeared in Google in the last 7 days, averaged per day, against the week before 24 September. Shows how much of the site Google shows again.',
    impressions: 'How often the site appeared in results per day (7-day average) against the baseline week. Shows whether people can find us again.',
    keyPages: 'Home, category, suburb and about pages that Google has indexed. These hub pages pass strength to every listing.',
    days: 'Days since the Google drop on 24 September. Recoveries after a spam update usually take weeks to months.',
    baseline: 'The average of the 7 days before the drop. Recovery is measured against this normal level.',
    state: 'Google’s own verdict for the page. “Indexed” means it can appear in results; anything else means it cannot yet.',
    lastCrawl: 'When Google last visited the page. A fresh date after our changes means Google has seen the fix.',
    pageType: 'Sampled pages grouped by kind. Shows which kinds of page Google has taken back and which it still leaves out.',
    sample: 'Share of sampled pages that are indexed, and how many of the 4 key pages are. Saved daily, so this trend grows over time.',
    queries: 'Searches that showed the site this week against last week. More searches means Google trusts the site for more topics.',
    position: 'Average rank for that search. 1–10 is page one. Lower is better.',
    milestones: 'Steps a recovery normally passes through, checked from the data each day. The date is the first day it was true.',
  },
  social: {
    title: 'Nothing posts automatically — copy a caption and post it yourself.',
  },
  live: {
    activeUsers: 'People on the site in the last 30 minutes, from Google Analytics.',
    todaySoFar: 'Since midnight (South African time). Sessions from Google; views, taps and enquiries counted by your sites.',
    pages: 'Pages people are on right now.',
  },
  analytics: {
    sessions: 'Visits (a visitor’s activity within 30 minutes). Google Analytics counts these; views below are counted by your own sites.',
    users: 'Different people who visited. Sessions ÷ users = how often people come back.',
    engagementRate: 'Visits that lasted 10 s+, viewed 2+ pages or did something. Under 50% means people bounce off the first page.',
    avgTime: 'How long engaged visitors stay. Longer on business pages = they’re reading the listing.',
    bounceRate: 'Visits that left without doing anything. The opposite of engagement rate; lower is better.',
    channels: 'How visits start. Organic search is the one the index gate protects; Direct and Social are yours to grow.',
    sources: 'The specific sites and apps that send visits, with how they were tagged (organic, referral, social).',
    devices: 'Mostly phones here — check every change on a phone first.',
    cities: 'Where visitors are. Traffic from outside the hub’s city is usually bots or misdirected search.',
    newVsReturning: 'Returning visitors mean the directory is becoming a habit.',
    hours: 'When people search for businesses. Post on social and run ads around these.',
    weekdays: 'Which days are busiest. Post on social and run ads around these.',
    landing: 'The first page of each visit. Business pages dominating = Google is sending people straight to listings — good.',
    topPages: 'The pages viewed most in the last 28 days.',
    events: 'Actions Google Analytics recorded on the sites, such as page views, scrolls and taps.',
    funnel: 'Where visitors drop. Sessions with few listing views = homepage/search problem; views with few taps = page problem.',
  },
  settings: {
    // Keyed by alert type.
    alerts: {
      submission: 'Fires when a new listing is submitted and waits for approval.',
      claim: 'Fires when someone claims a business and waits for your decision.',
      report: 'Fires when a visitor reports a problem or asks for a listing to be removed.',
      message: 'Fires when someone sends a message through a site’s contact form.',
      review: 'Fires when a review is waiting to be published or an owner flags one.',
      event: 'Fires when a new event is submitted and waits for approval.',
      'event-claim': 'Fires when someone claims an event and waits for your decision.',
      briefing: 'Fires each morning when Claude’s briefing for the day is ready.',
      weekly: 'Fires on Monday with the weekly summary of every site.',
      health: 'Fires when a site stops answering for about 5 minutes, and again when it is back.',
      deploy: 'Fires when a GitHub deploy or scheduled job fails.',
      usage: 'Fires when the database passes 70% and 90% of Cloudflare’s free daily limit.',
      routine: 'Fires when a scheduled cloud routine turns late.',
    },
  },
};

let bubble = null;
let pinned = null;
let hovered = null;

function getBubble() {
  if (!bubble) {
    bubble = document.createElement('div');
    bubble.className = 'help-tip';
    bubble.setAttribute('role', 'tooltip');
    document.body.appendChild(bubble);
  }
  return bubble;
}

function place(btn) {
  const el = getBubble();
  el.textContent = btn.getAttribute('data-tip');
  el.style.display = 'block';
  const r = btn.getBoundingClientRect();
  const w = el.offsetWidth;
  const hgt = el.offsetHeight;
  // Stay inside the screen: shift left when the icon is near the right edge.
  if (btn.getAttribute('data-tip-side') === 'right') {
    el.style.left = `${Math.min(r.right + 8, window.innerWidth - w - 8)}px`;
    el.style.top = `${Math.max(8, Math.min(r.top + r.height / 2 - hgt / 2, window.innerHeight - hgt - 8))}px`;
    return;
  }
  const left = Math.max(8, Math.min(r.left + r.width / 2 - w / 2, window.innerWidth - w - 8));
  const below = r.bottom + 8 + hgt <= window.innerHeight || r.top - 8 - hgt < 8;
  el.style.left = `${left}px`;
  el.style.top = `${below ? r.bottom + 8 : r.top - 8 - hgt}px`;
}

function refresh() {
  const target = pinned || hovered;
  if (target && target.isConnected) place(target);
  else if (bubble) bubble.style.display = 'none';
}

function close() {
  if (pinned) pinned.classList.remove('open');
  pinned = null;
  hovered = null;
  refresh();
}

if (typeof document !== 'undefined') {
  document.addEventListener('click', (e) => {
    if (pinned && !(e.target instanceof Element && e.target.closest('.help'))) close();
  });
  document.addEventListener('keydown', (e) => e.key === 'Escape' && close());
  window.addEventListener('scroll', () => pinned && close(), { passive: true, capture: true });
  window.addEventListener('hashchange', close);
}

/** The (i) button: hover/focus shows the tip, tap toggles it. */
export function helpIcon(text) {
  const btn = document.createElement('button');
  btn.type = 'button';
  btn.className = 'help';
  btn.textContent = 'ⓘ';
  btn.setAttribute('aria-label', text);
  btn.setAttribute('data-tip', text);
  btn.addEventListener('pointerenter', (e) => {
    if (e.pointerType === 'mouse') {
      hovered = btn;
      refresh();
    }
  });
  btn.addEventListener('pointerleave', () => {
    if (hovered === btn) hovered = null;
    refresh();
  });
  btn.addEventListener('focus', () => {
    hovered = btn;
    refresh();
  });
  btn.addEventListener('blur', () => {
    if (hovered === btn) hovered = null;
    refresh();
  });
  btn.addEventListener('click', (e) => {
    // Inside a label, <summary> or link the tap must not also trigger that.
    e.preventDefault();
    e.stopPropagation();
    const was = pinned === btn;
    if (pinned) pinned.classList.remove('open');
    pinned = was ? null : btn;
    if (pinned) btn.classList.add('open');
    refresh();
  });
  return btn;
}

/** Hover/focus tooltip (same bubble) on any element, e.g. a rail nav link.
 *  `active()` lets the caller switch it off (labels are visible when the sidebar is full). */
export function attachTip(el, text, { side = 'right', active = () => true } = {}) {
  el.setAttribute('data-tip', text);
  el.setAttribute('data-tip-side', side);
  const on = () => {
    if (!active()) return;
    hovered = el;
    refresh();
  };
  const off = () => {
    if (hovered === el) hovered = null;
    refresh();
  };
  el.addEventListener('pointerenter', (e) => e.pointerType === 'mouse' && on());
  el.addEventListener('pointerleave', off);
  el.addEventListener('focus', on);
  el.addEventListener('blur', off);
  return el;
}
