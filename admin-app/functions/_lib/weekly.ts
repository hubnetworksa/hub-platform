import type { D1Database } from '@cloudflare/workers-types';
import { hubSites, rows, type Env, type HubSite } from './sites';
import { alert, getSetting, readReport, setSetting, writeReport } from './alerts';
import { saDay } from './briefing';
import type { WorkflowRun } from './health';

// The weekly summary, built every Monday from 07:00 South African time by the
// 5-minute run: last week against the week before for each site (traffic,
// contact taps, enquiries, new listings, sign-ups, income), problems (uptime,
// failed jobs, broken links) and upgrades done. It's kept for the Activity
// screen, pushed to devices with "Weekly summary" alerts on, and emailed to
// admins who asked for it in Settings when the app has an email key
// (RESEND_API_KEY, from the HUB_ADMIN_RESEND_KEY GitHub secret).

async function twoWeeks(db: D1Database, table: string, where: string, sumCol?: string): Promise<{ week: number; prev: number }> {
  const v = sumCol ?? '1';
  const r = await rows<{ week: number; prev: number }>(
    db,
    `SELECT SUM(CASE WHEN created_at >= datetime('now', '-7 days') THEN ${v} ELSE 0 END) AS week,
            SUM(CASE WHEN created_at < datetime('now', '-7 days') THEN ${v} ELSE 0 END) AS prev
     FROM ${table} WHERE created_at >= datetime('now', '-14 days')${where ? ` AND ${where}` : ''}`
  );
  return { week: Number(r[0]?.week) || 0, prev: Number(r[0]?.prev) || 0 };
}

async function siteWeek(s: HubSite) {
  const db = s.db;
  const [views, taps, enquiries, signups, listings, income, events] = await Promise.all([
    twoWeeks(db, 'business_stats', `event = 'view'`),
    twoWeeks(db, 'business_stats', `event IN ('phone_click', 'whatsapp_click', 'website_click')`),
    twoWeeks(db, 'messages', `kind = 'enquiry'`),
    twoWeeks(db, 'users', `email_verified_at IS NOT NULL`),
    twoWeeks(db, 'businesses', `status = 'published' AND is_test = 0`),
    rows<{ week: number; prev: number }>(
      db,
      `SELECT SUM(CASE WHEN paid_at >= datetime('now', '-7 days') THEN cents ELSE 0 END) AS week, SUM(CASE WHEN paid_at < datetime('now', '-7 days') THEN cents ELSE 0 END) AS prev FROM (
         SELECT amount_cents AS cents, paid_at FROM payments WHERE status = 'COMPLETE' AND paid_at >= datetime('now', '-14 days')
         UNION ALL SELECT amount_cents, paid_at FROM event_payments WHERE status = 'complete' AND paid_at >= datetime('now', '-14 days'))`
    ),
    twoWeeks(db, 'events', ''),
  ]);
  return {
    slug: s.slug,
    name: s.name,
    views,
    contact_taps: taps,
    enquiries,
    signups,
    new_listings: listings,
    new_events: events,
    income_cents: { week: Number(income[0]?.week) || 0, prev: Number(income[0]?.prev) || 0 },
  };
}

export async function buildWeekly(env: Env) {
  const db = env.ADMIN_DB;
  const sites = await Promise.all(hubSites(env).map(siteWeek));
  const up = await db
    .prepare(`SELECT site, ROUND(100.0 * SUM(ok) / COUNT(*), 2) AS pct FROM health_checks WHERE checked_at >= datetime('now', '-7 days') GROUP BY site`)
    .all<{ site: string; pct: number }>();
  const runs = await readReport<WorkflowRun[]>(db, 'github_runs');
  const weekAgo = new Date(Date.now() - 7 * 86400000).toISOString();
  const failed = (runs?.data ?? []).filter((r) => r.conclusion === 'failure' && r.created_at >= weekAgo).map((r) => r.name);
  const links = await readReport<{ sites?: Record<string, { broken?: unknown[]; websites?: { dead?: unknown[] } }> }>(db, 'links');
  const done = (await db.prepare(`SELECT title FROM upgrades WHERE status = 'done' AND done_at >= datetime('now', '-7 days') ORDER BY done_at`).all<{ title: string }>()).results ?? [];
  const open = await db.prepare(`SELECT COUNT(*) AS n FROM upgrades WHERE status != 'done'`).first<{ n: number }>();
  return {
    week_ending: saDay(),
    sites,
    uptime: Object.fromEntries((up.results ?? []).map((r) => [r.site, r.pct])),
    failed_jobs: [...new Set(failed)],
    broken_links: Object.fromEntries(Object.entries(links?.data.sites ?? {}).map(([k, v]) => [k, { pages: v.broken?.length ?? 0, websites: v.websites?.dead?.length ?? 0 }])),
    upgrades_done: done.map((u) => u.title),
    upgrades_open: open?.n ?? 0,
  };
}

type Weekly = Awaited<ReturnType<typeof buildWeekly>>;
const pct = (w: number, p: number) => (p ? `${w >= p ? '+' : ''}${Math.round(((w - p) / p) * 100)}%` : w ? 'new' : '–');
const rand = (c: number) => `R${Math.round(c / 100).toLocaleString('en-ZA')}`;

function headline(w: Weekly): string {
  const v = w.sites.reduce((a, s) => a + s.views.week, 0);
  const vp = w.sites.reduce((a, s) => a + s.views.prev, 0);
  const t = w.sites.reduce((a, s) => a + s.contact_taps.week, 0);
  return `${v.toLocaleString('en-ZA')} listing views (${pct(v, vp)}) and ${t.toLocaleString('en-ZA')} contact taps across your sites last week.`;
}

function emailText(w: Weekly, appUrl: string): string {
  const lines = [`Your week on the Hub sites (to ${w.week_ending})`, '', headline(w), ''];
  for (const s of w.sites) {
    lines.push(
      `${s.name}`,
      `  Listing views: ${s.views.week} (${pct(s.views.week, s.views.prev)})`,
      `  Contact taps: ${s.contact_taps.week} (${pct(s.contact_taps.week, s.contact_taps.prev)})`,
      `  Enquiries: ${s.enquiries.week} · New listings: ${s.new_listings.week} · Sign-ups: ${s.signups.week}`,
      `  Income: ${rand(s.income_cents.week)} (week before ${rand(s.income_cents.prev)})`,
      `  Uptime: ${w.uptime[s.slug] ?? '–'}%${w.broken_links[s.slug] ? ` · Broken links: ${w.broken_links[s.slug].pages}` : ''}`,
      ''
    );
  }
  if (w.failed_jobs.length) lines.push(`Failed jobs: ${w.failed_jobs.join(', ')}`, '');
  lines.push(w.upgrades_done.length ? `Upgrades done: ${w.upgrades_done.join('; ')}` : 'No upgrades finished last week.', `Open upgrades: ${w.upgrades_open}`, '', `Open Hub Admin: ${appUrl}`);
  return lines.join('\n');
}

const esc = (s: string) => s.replace(/[&<>"]/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' })[c]!);

async function sendEmails(env: Env, w: Weekly): Promise<number> {
  const key = typeof env.RESEND_API_KEY === 'string' ? env.RESEND_API_KEY : '';
  if (!key) return 0;
  const to = (await env.ADMIN_DB.prepare(`SELECT email FROM admin_users WHERE weekly_email = 1 AND email IS NOT NULL`).all<{ email: string }>()).results ?? [];
  const from = hubSites(env)[0]?.contactEmail;
  if (!to.length || !from) return 0;
  const appUrl = 'https://hub-admin-b4x.pages.dev/#/activity';
  const text = emailText(w, appUrl);
  let sent = 0;
  for (const { email } of to) {
    const res = await fetch('https://api.resend.com/emails', {
      method: 'POST',
      headers: { Authorization: `Bearer ${key}`, 'Content-Type': 'application/json' },
      body: JSON.stringify({ from: `Hub Admin <${from}>`, to: [email], subject: `Your week: ${headline(w)}`.slice(0, 150), text, html: `<pre style="font:14px/1.5 system-ui,sans-serif;white-space:pre-wrap">${esc(text)}</pre>` }),
    }).catch(() => null);
    if (res?.ok) sent++;
  }
  return sent;
}

/** Monday from 07:00 (South African time), once: build, store, push and email the summary. */
export async function maybeSendWeekly(env: Env, force = false): Promise<{ sent: number; emailed: number } | null> {
  const db = env.ADMIN_DB;
  const sa = new Date(Date.now() + 2 * 3600_000);
  if (!force && (sa.getUTCDay() !== 1 || sa.getUTCHours() < 7)) return null;
  const today = saDay();
  if (!force && (await getSetting(db, 'weekly_sent')) === today) return null;
  await setSetting(db, 'weekly_sent', today);
  const w = await buildWeekly(env);
  await writeReport(db, 'weekly', w);
  const sent = await alert(db, 'Your week in numbers', headline(w), '/#/activity', ['weekly']);
  const emailed = await sendEmails(env, w);
  return { sent, emailed };
}
