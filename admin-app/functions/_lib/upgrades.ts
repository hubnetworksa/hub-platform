import { hubSites, type Env } from './sites';
import { str } from './body';

// Shared validation for upgrades (api/upgrades/*).
export const PRIORITIES = ['low', 'normal', 'high', 'urgent'];
export const STATUSES = ['idea', 'planned', 'in_progress', 'done'];

export interface UpgradeInput {
  title?: string;
  details?: string;
  sites?: string[];
  priority?: string;
  status?: string;
}

/** Checks the fields present in `body`; `partial` allows leaving any out (edits). */
export function parseUpgrade(env: Env, body: Record<string, unknown>, partial: boolean): { value: UpgradeInput } | { error: string } {
  const out: UpgradeInput = {};
  if ('title' in body || !partial) {
    const title = str(body.title, 160);
    if (!title) return { error: 'Give the upgrade a short title.' };
    out.title = title;
  }
  if ('details' in body) out.details = str(body.details, 5000);
  if ('sites' in body || !partial) {
    const known = hubSites(env).map((s) => s.slug);
    const raw = Array.isArray(body.sites) ? body.sites.filter((s): s is string => typeof s === 'string') : [];
    const picked = raw.includes('all') ? ['all'] : raw.filter((s) => known.includes(s));
    if (!picked.length) return { error: 'Choose at least one site (or All sites).' };
    out.sites = picked.length === known.length ? ['all'] : picked;
  }
  if ('priority' in body || !partial) {
    const p = str(body.priority, 20) || 'normal';
    if (!PRIORITIES.includes(p)) return { error: 'Unknown priority.' };
    out.priority = p;
  }
  if ('status' in body || !partial) {
    const s = str(body.status, 20) || 'idea';
    if (!STATUSES.includes(s)) return { error: 'Unknown status.' };
    out.status = s;
  }
  return { value: out };
}
