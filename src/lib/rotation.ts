// Deterministic "daily shuffle" for same-tier promoted businesses — see
// the Premium Listings plan's "fair rotation" section. Tier always wins
// (Premium banner > Featured strip > everyone else); *within* a tier,
// which business gets the top-most slot rotates by a hash of (seed, id,
// today's date), recomputed on every site rebuild. Stable within a single
// day (same rebuild), cycles fairly day to day, and a brand-new same-tier
// subscriber joins the rotation immediately rather than always ranking last.

function fnv1a(str: string): number {
  let hash = 0x811c9dc5;
  for (let i = 0; i < str.length; i++) {
    hash ^= str.charCodeAt(i);
    hash = Math.imul(hash, 0x01000193);
  }
  return hash >>> 0;
}

// UTC date so a rebuild anywhere in the world on the same calendar day
// produces the same order — this doesn't need to be wall-clock precise,
// just stable for a day and to change daily.
function todayKey(): string {
  return new Date().toISOString().slice(0, 10);
}

export function dailyShuffle<T>(items: T[], seed: string, idOf: (item: T) => number | string): T[] {
  const day = todayKey();
  return [...items].sort((a, b) => {
    const ha = fnv1a(`${seed}:${day}:${idOf(a)}`);
    const hb = fnv1a(`${seed}:${day}:${idOf(b)}`);
    return ha - hb;
  });
}
