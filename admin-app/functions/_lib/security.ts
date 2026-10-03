import { hubSites, type Env, type HubSite } from './sites';
import { readReport, writeReport } from './alerts';

// Live security checks for the Health screen. Each check is pass / warn /
// fail with a plain explanation and what to do. Results are kept 6 hours
// (reports 'security') because they make a few dozen web requests.

export interface Check {
  site: string; // slug, or 'hub' for Hub Admin itself
  name: string;
  result: 'pass' | 'warn' | 'fail';
  detail: string;
  fix?: string;
}

async function get(url: string, method = 'GET'): Promise<Response | null> {
  try {
    return await fetch(url, { method, redirect: 'manual', cf: { cacheTtl: 0 } } as RequestInit);
  } catch {
    return null;
  }
}

const HEADERS: [string, string][] = [
  ['strict-transport-security', 'HSTS (always HTTPS)'],
  ['x-content-type-options', 'No content sniffing'],
  ['x-frame-options', 'No framing by other sites'],
  ['referrer-policy', 'Referrer policy'],
];

async function siteChecks(site: HubSite): Promise<Check[]> {
  const out: Check[] = [];
  const add = (name: string, ok: boolean | 'warn', detail: string, fix?: string) =>
    out.push({ site: site.slug, name, result: ok === 'warn' ? 'warn' : ok ? 'pass' : 'fail', detail, fix: ok === true ? undefined : fix });

  const home = await get(`https://${site.domain}/`);
  if (!home) add('Homepage over HTTPS', false, 'No answer.', 'Check the site on Cloudflare.');
  else {
    const missing = HEADERS.filter(([h]) => !home.headers.get(h)).map(([, label]) => label);
    add('Security headers', missing.length === 0, missing.length ? `Missing: ${missing.join(', ')}.` : 'All present.', 'Add them in public/_headers (assets/sites/<city>/_headers).');
  }

  const http = await get(`http://${site.domain}/`);
  const loc = http?.headers.get('location') ?? '';
  add('HTTP goes to HTTPS', !!http && http.status >= 300 && http.status < 400 && loc.startsWith('https://'), http ? `http:// answered ${http.status}${loc ? ` → ${loc}` : ''}.` : 'No answer on http://.', 'Cloudflare → the domain → SSL/TLS → Edge Certificates → turn on “Always Use HTTPS”.');

  if (site.domainLive) {
    const dev = await get(`https://${site.pagesDevHost}/`);
    const dloc = dev?.headers.get('location') ?? '';
    add('pages.dev address redirects', !!dev && dev.status === 301 && dloc.includes(site.domain), dev ? `${site.pagesDevHost} answered ${dev.status}.` : 'No answer.', 'Set domainLive: true in sites/<city>.json and redeploy.');
  }

  // Preview deployments of the "ethan" branch use the production database.
  const preview = await get(`https://ethan.${site.pagesDevHost}/`, 'HEAD');
  add(
    'No live preview copy on production data',
    !preview || preview.status === 404 || preview.status === 530 ? true : 'warn',
    preview && preview.status !== 404 && preview.status !== 530 ? `ethan.${site.pagesDevHost} is live (${preview.status}) and uses the real database.` : 'No preview copy answering.',
    `Cloudflare → Workers & Pages → ${site.pagesProject} → Deployments: delete the “ethan” preview deployments, and under Settings → Variables and Secrets remove CRON_SECRET from Preview.`
  );

  const admin = await get(`https://${site.domain}/api/admin/overview`);
  add('Admin API locked', !!admin && (admin.status === 401 || admin.status === 403), admin ? `Without signing in it answers ${admin.status}.` : 'No answer.', 'The admin API must refuse requests without an admin session.');

  const robots = await get(`https://${site.domain}/robots.txt`);
  const rtext = robots && robots.ok ? await robots.text() : '';
  add('robots.txt keeps /api/ out of Google', /Disallow:\s*\/api\//i.test(rtext), rtext ? (/Disallow:\s*\/api\//i.test(rtext) ? 'Present.' : 'No “Disallow: /api/” line.') : 'robots.txt missing.', 'Add “Disallow: /api/” to robots.txt.');
  return out;
}

async function hubChecks(env: Env): Promise<Check[]> {
  const db = env.ADMIN_DB;
  const out: Check[] = [];
  const admins = (await db.prepare('SELECT u.username, (SELECT COUNT(*) FROM passkeys p WHERE p.user_id = u.id) AS keys FROM admin_users u').all<{ username: string; keys: number }>()).results ?? [];
  const noKey = admins.filter((a) => !a.keys).map((a) => a.username);
  out.push({ site: 'hub', name: 'Every admin has fingerprint / face sign-in', result: noKey.length ? 'warn' : 'pass', detail: noKey.length ? `Password only: ${noKey.join(', ')}.` : `All ${admins.length} admins have a passkey.`, fix: noKey.length ? 'Settings → Fingerprint & face sign-in → Set up on this device.' : undefined });
  const fails = await db.prepare(`SELECT COUNT(*) AS n FROM auth_attempts WHERE kind IN ('login', 'passkey', 'recover', 'setup', 'join') AND created_at > datetime('now', '-1 day')`).first<{ n: number }>();
  const n = fails?.n ?? 0;
  out.push({ site: 'hub', name: 'Failed sign-ins (24 hours)', result: n > 20 ? 'warn' : 'pass', detail: `${n} failed attempt${n === 1 ? '' : 's'}.`, fix: n > 20 ? 'Someone may be guessing passwords. Use long passwords and passkeys; Settings → Sign out everywhere if unsure.' : undefined });
  out.push({ site: 'hub', name: 'Password-reset code set', result: env.SETUP_CODE && String(env.SETUP_CODE).length >= 12 ? 'pass' : 'warn', detail: env.SETUP_CODE ? 'Set.' : 'Not set: a forgotten password can’t be reset.', fix: env.SETUP_CODE ? undefined : 'Add the HUB_ADMIN_SETUP_CODE GitHub secret and run Deploy Hub Admin.' });
  return out;
}

export async function securityChecks(env: Env, force = false): Promise<{ checks: Check[]; checked_at: string }> {
  const db = env.ADMIN_DB;
  const cached = await readReport<Check[]>(db, 'security');
  if (!force && cached && Date.now() - new Date(`${cached.updated_at.replace(' ', 'T')}Z`).getTime() < 6 * 3600_000) return { checks: cached.data, checked_at: cached.updated_at };
  const lists = await Promise.all([...hubSites(env).map(siteChecks), hubChecks(env)]);
  const checks = lists.flat();
  await writeReport(db, 'security', checks);
  return { checks, checked_at: new Date().toISOString().replace('T', ' ').slice(0, 19) };
}
