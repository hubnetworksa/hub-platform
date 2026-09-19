// Small helpers shared by the admin pages' client scripts. Rows there are
// built with innerHTML template strings, so every value that came from a
// user (business names, claim notes, emails, report reasons…) MUST go
// through esc() first.

export function esc(value: unknown): string {
  return String(value ?? '').replace(/[&<>"']/g, (c) => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' })[c]!);
}

/** Cents -> "R1 850" for whole rand, "R149.50" otherwise (thousands separated). */
export function randFromCents(cents: number): string {
  const rand = cents / 100;
  const whole = Number.isInteger(rand);
  const text = rand.toLocaleString('en-US', { minimumFractionDigits: whole ? 0 : 2, maximumFractionDigits: 2 });
  return 'R' + text;
}

/** Plan pill style, identical to the mockup's planPill(). */
export function planPillStyle(plan: string): string {
  const map: Record<string, string> = {
    Featured: 'background:var(--accent);color:var(--contrast)',
    Verified: 'background:rgba(var(--accent-rgb),.13);color:var(--accent-hover)',
    Basic: 'background:var(--bg-subtle);color:var(--muted)',
  };
  return `display:inline-block;padding:4px 10px;border-radius:999px;font-size:11px;font-weight:800;letter-spacing:.06em;text-transform:uppercase;${map[plan] || map.Basic}`;
}

/** Status pill style, identical to the mockup's pill(). */
export function statusPillStyle(tone: string): string {
  const m: Record<string, string> = {
    New: 'background:var(--accent);color:var(--contrast)',
    Answered: 'background:rgba(var(--accent-rgb),.13);color:var(--accent-hover)',
    Closed: 'background:var(--bg-subtle);color:var(--muted)',
    Paid: 'background:rgba(var(--accent-rgb),.13);color:var(--accent-hover)',
    Overdue: 'background:var(--danger);color:#fff',
    Refunded: 'background:var(--bg-subtle);color:var(--muted)',
    Sold: 'background:rgba(var(--accent-rgb),.13);color:var(--accent-hover)',
    Open: 'background:var(--bg-subtle);color:var(--muted)',
  };
  return `display:inline-block;padding:4px 10px;border-radius:999px;font-size:11px;font-weight:800;letter-spacing:.06em;text-transform:uppercase;${m[tone] || m.Closed}`;
}

export const TIER_NAMES: Record<number, string> = { 0: 'Basic', 1: 'Verified', 2: 'Featured' };

/** Guard used by every admin page's init(). Returns false after redirecting. */
export async function requireAdmin(next: string): Promise<boolean> {
  const me = await fetch('/api/me');
  if (me.status === 401) {
    window.location.href = `/login/?next=${next}`;
    return false;
  }
  const meData = await me.json();
  if (!meData.isAdmin) {
    window.location.href = '/my-businesses/';
    return false;
  }
  return true;
}

export function showContent() {
  document.getElementById('loading')!.hidden = true;
  document.getElementById('content')!.hidden = false;
}

export async function postJson(url: string, body: unknown): Promise<{ ok: boolean; error?: string; [k: string]: unknown }> {
  try {
    const res = await fetch(url, { method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(body) });
    return await res.json();
  } catch {
    return { ok: false, error: 'Network error.' };
  }
}

/** "20 min ago" / "2 hours ago" / "Yesterday" / "3 days ago" / a date. */
export function timeAgo(iso: string | null | undefined): string {
  if (!iso) return 'Never';
  const t = new Date(iso.includes('T') ? iso : iso.replace(' ', 'T') + 'Z').getTime();
  if (!Number.isFinite(t)) return '—';
  const mins = Math.max(0, Math.round((Date.now() - t) / 60000));
  if (mins < 2) return 'Just now';
  if (mins < 60) return `${mins} min ago`;
  const hours = Math.round(mins / 60);
  if (hours < 24) return `${hours} hour${hours === 1 ? '' : 's'} ago`;
  const days = Math.round(hours / 24);
  if (days === 1) return 'Yesterday';
  if (days < 30) return `${days} days ago`;
  return new Date(t).toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' });
}

export function fmtDate(iso: string | null | undefined): string {
  if (!iso) return '—';
  const t = new Date(iso.includes('T') ? iso : iso.replace(' ', 'T') + 'Z');
  return Number.isFinite(t.getTime()) ? t.toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' }) : '—';
}
