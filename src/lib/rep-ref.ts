// Remembers a sales-rep share code (?rep=CODE) for 7 days so it can pre-fill
// the optional "Rep code" field at checkout. Everything is best-effort.
const KEY = 'hub_rep_ref';
const TTL_MS = 7 * 24 * 60 * 60 * 1000;

function normalise(raw: string): string | null {
  const code = raw.toUpperCase().replace(/[^A-Z0-9]/g, '');
  return code.length >= 4 && code.length <= 12 ? code : null;
}

export function captureRepRef(): void {
  try {
    const raw = new URLSearchParams(window.location.search).get('rep');
    if (!raw) return;
    const code = normalise(raw);
    if (!code) return;
    localStorage.setItem(KEY, JSON.stringify({ code, at: Date.now() }));
  } catch {
    /* ignore */
  }
}

export function getRepRef(): string | null {
  try {
    const raw = localStorage.getItem(KEY);
    if (!raw) return null;
    const data = JSON.parse(raw) as { code?: unknown; at?: unknown };
    const code = typeof data.code === 'string' ? normalise(data.code) : null;
    if (!code || typeof data.at !== 'number' || Date.now() - data.at > TTL_MS) {
      clearRepRef();
      return null;
    }
    return code;
  } catch {
    return null;
  }
}

export function clearRepRef(): void {
  try {
    localStorage.removeItem(KEY);
  } catch {
    /* ignore */
  }
}
