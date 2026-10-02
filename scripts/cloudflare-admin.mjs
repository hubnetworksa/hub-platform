#!/usr/bin/env node
// Cloudflare zone checks and fixes for the three sites, run from
// .github/workflows/cloudflare-admin.yml with the CI token (it never leaves
// GitHub). Usage: node scripts/cloudflare-admin.mjs <audit|fix-www> [cities]
//   audit    read-only: token scopes, apex/www DNS, security + SSL settings,
//            Bot Fight Mode, custom firewall/rate-limit/redirect rules, and
//            7 days of firewall events from Googlebot.
//   fix-www  points www.<domain> at the site's Pages project (proxied CNAME),
//            replacing whatever www record is there. The site's middleware
//            then 301s www to the bare domain.
import { readFileSync } from 'node:fs';

const TOKEN = process.env.CLOUDFLARE_API_TOKEN;
if (!TOKEN) throw new Error('CLOUDFLARE_API_TOKEN is not set');
const action = process.argv[2] ?? 'audit';
// Optional comma-separated city list as the second argument (default: all).
const CITIES = (process.argv[3] || 'polokwane,pretoria,capetown').split(',').map((s) => s.trim()).filter(Boolean);
const API = 'https://api.cloudflare.com/client/v4';

async function cf(path, init = {}) {
  const res = await fetch(`${API}${path}`, {
    ...init,
    headers: { Authorization: `Bearer ${TOKEN}`, 'Content-Type': 'application/json', ...(init.headers ?? {}) },
  });
  const body = await res.json().catch(() => ({}));
  if (!res.ok || body.success === false) {
    const msg = (body.errors ?? []).map((e) => `${e.code}: ${e.message}`).join('; ') || `HTTP ${res.status}`;
    return { ok: false, error: msg };
  }
  return { ok: true, result: body.result, body };
}

async function graphql(query, variables) {
  const res = await fetch(`${API}/graphql`, {
    method: 'POST',
    headers: { Authorization: `Bearer ${TOKEN}`, 'Content-Type': 'application/json' },
    body: JSON.stringify({ query, variables }),
  });
  return res.json().catch(() => ({ errors: [{ message: `HTTP ${res.status}` }] }));
}

const show = (label, r, pick = (x) => x) => console.log(`  ${label}: ${r.ok ? JSON.stringify(pick(r.result)) : `NOT READABLE (${r.error})`}`);

async function zoneFor(domain) {
  const r = await cf(`/zones?name=${domain}`);
  if (!r.ok || !r.result?.length) throw new Error(`zone ${domain}: ${r.error ?? 'not found'}`);
  return r.result[0];
}

async function audit(site, zone) {
  const dns = await cf(`/zones/${zone.id}/dns_records?per_page=100`);
  if (dns.ok) {
    for (const rec of dns.result.filter((x) => x.name === site.domain || x.name === `www.${site.domain}`)) {
      console.log(`  dns ${rec.type} ${rec.name} -> ${rec.content} proxied=${rec.proxied}`);
    }
    if (!dns.result.some((x) => x.name === `www.${site.domain}`)) console.log(`  dns www.${site.domain}: NO RECORD`);
  } else console.log(`  dns: NOT READABLE (${dns.error})`);

  for (const s of ['security_level', 'browser_check', 'ssl', 'always_use_https', 'min_tls_version', 'challenge_ttl']) {
    show(`setting ${s}`, await cf(`/zones/${zone.id}/settings/${s}`), (x) => x.value);
  }
  show('bot management', await cf(`/zones/${zone.id}/bot_management`), (x) => ({ fight_mode: x.fight_mode, ai_bots_protection: x.ai_bots_protection, enable_js: x.enable_js }));

  for (const phase of ['http_request_firewall_custom', 'http_ratelimit', 'http_request_dynamic_redirect', 'http_request_firewall_managed']) {
    const r = await cf(`/zones/${zone.id}/rulesets/phases/${phase}/entrypoint`);
    if (!r.ok) { console.log(`  rules ${phase}: ${/could not find|not found/i.test(r.error) ? 'none' : `NOT READABLE (${r.error})`}`); continue; }
    const rules = r.result.rules ?? [];
    console.log(`  rules ${phase}: ${rules.length}`);
    for (const rule of rules) console.log(`    - ${rule.enabled === false ? '[off] ' : ''}${rule.action} :: ${rule.description || ''} :: ${String(rule.expression).slice(0, 160)}`);
  }
  show('page rules', await cf(`/zones/${zone.id}/pagerules`), (x) => x.map((p) => `${p.targets?.[0]?.constraint?.value} -> ${p.actions?.map((a) => a.id).join(',')}`));

  const since = new Date(Date.now() - 7 * 864e5).toISOString();
  const q = `query($zone: String!, $since: Time!) { viewer { zones(filter: { zoneTag: $zone }) {
      firewallEventsAdaptiveGroups(limit: 50, filter: { datetime_geq: $since, userAgent_like: "%Googlebot%" }, orderBy: [count_DESC]) {
        count dimensions { action source clientRequestPath } } } } }`;
  const g = await graphql(q, { zone: zone.id, since });
  if (g.errors?.length) console.log(`  googlebot firewall events: NOT READABLE (${g.errors.map((e) => e.message).join('; ')})`);
  else {
    const groups = g.data?.viewer?.zones?.[0]?.firewallEventsAdaptiveGroups ?? [];
    console.log(`  googlebot firewall events (7d): ${groups.length ? '' : 'none'}`);
    for (const x of groups) console.log(`    - ${x.count}x ${x.dimensions.action} by ${x.dimensions.source} on ${x.dimensions.clientRequestPath}`);
  }
}

async function fixWww(site, zone) {
  const name = `www.${site.domain}`;
  const target = site.pagesDevHost;
  const existing = await cf(`/zones/${zone.id}/dns_records?name=${name}&per_page=100`);
  if (!existing.ok) { console.log(`  cannot read DNS: ${existing.error}`); return; }
  const recs = existing.result;
  if (recs.length === 1 && recs[0].type === 'CNAME' && recs[0].content === target && recs[0].proxied) {
    console.log(`  ${name} already CNAME -> ${target} (proxied), nothing to do`);
    return;
  }
  for (const rec of recs) console.log(`  replacing ${rec.type} ${rec.name} -> ${rec.content} proxied=${rec.proxied}`);
  const body = { type: 'CNAME', name, content: target, proxied: true, ttl: 1, comment: 'www -> Pages project; middleware 301s to the bare domain' };
  const cname = recs.find((r) => r.type === 'CNAME');
  // A CNAME can't coexist with other records on the same name: drop the rest
  // first, then update the CNAME in place or create one.
  for (const rec of recs.filter((r) => r !== cname)) {
    const d = await cf(`/zones/${zone.id}/dns_records/${rec.id}`, { method: 'DELETE' });
    console.log(`  delete ${rec.type} ${rec.content}: ${d.ok ? 'ok' : d.error}`);
  }
  const w = cname
    ? await cf(`/zones/${zone.id}/dns_records/${cname.id}`, { method: 'PUT', body: JSON.stringify(body) })
    : await cf(`/zones/${zone.id}/dns_records`, { method: 'POST', body: JSON.stringify(body) });
  console.log(`  ${cname ? 'update' : 'create'} CNAME ${name} -> ${target}: ${w.ok ? 'ok' : w.error}`);
}

const verify = await cf('/user/tokens/verify');
console.log(`token: ${verify.ok ? verify.result.status : verify.error}`);
for (const city of CITIES) {
  const site = JSON.parse(readFileSync(new URL(`../sites/${city}.json`, import.meta.url), 'utf8'));
  console.log(`\n== ${site.domain}`);
  try {
    const zone = await zoneFor(site.domain);
    console.log(`  zone ${zone.status}, plan ${zone.plan?.name}`);
    if (action === 'fix-www') await fixWww(site, zone);
    else await audit(site, zone);
  } catch (err) {
    console.log(`  ERROR ${err.message}`);
  }
}
