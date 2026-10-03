// One fuzzy-search engine for the whole site (Fuse.js). Used at build time
// (buildSearchPack: pre-normalise + pre-build the Fuse indexes) and in the
// browser (SearchEngine: parse the prebuilt indexes, no indexing work), plus
// createListSearch() for small lists (suburbs, categories ...).
//
// Everything goes through norm() — fields AND queries — so "Re/Max",
// "RE MAX", "Re-Max" and "remax" all meet.
import Fuse from 'fuse.js';

/** Spaced: punctuation becomes a single space. Compact: every
 *  non-alphanumeric (spaces too) removed. "&" reads as "and". */
export function norm(s: string, compact = false): string {
  const base = (s ?? '')
    .toLowerCase()
    .normalize('NFD')
    .replace(/[̀-ͯ]/g, '')
    .replace(/&/g, ' and ')
    .replace(/['’‘`]/g, ''); // "Nando's" -> "nandos"
  return compact ? base.replace(/[^a-z0-9]+/g, '') : base.replace(/[^a-z0-9]+/g, ' ').trim();
}

/** Filler words that don't have to match ("plumber in hatfield"). */
export const STOP = new Set(['in', 'near', 'the', 'and', 'for', 'a', 'an', 'of', 'at', 'to', 'on', 'my', 'me']);

const BASE_OPTIONS = {
  includeScore: true,
  ignoreLocation: true,
  threshold: 0.33,
  minMatchCharLength: 2,
  useExtendedSearch: false,
  // Field-length norms are not shipped (keeps the prebuilt index small).
  ignoreFieldNorm: true,
};

// Business names: compact + spaced. Categories / suburbs are tiny side
// tables searched separately and mapped back onto businesses.
const NAME_KEYS = [
  { name: 'nc', weight: 0.5 },
  { name: 'ns', weight: 0.5 },
];
const CAT_KEYS = [
  { name: 'ns', weight: 0.6 },
  { name: 'ks', weight: 0.4 },
];
const SUB_KEYS = [{ name: 'ns', weight: 1 }];

// A match via category/synonym or suburb ranks a touch below a name match.
const CAT_PENALTY = 0.04;
const SUB_PENALTY = 0.06;

/** Query words: filler dropped (unless that's all there is), 1-letter words
 *  dropped (covered by the compact whole-query match: "pick n pay"). */
export function queryWords(q: string): string[] {
  const all = q ? q.split(' ') : [];
  let words = all.filter((w) => !STOP.has(w) && w.length >= 2);
  if (!words.length) words = all.filter((w) => w.length >= 2);
  if (!words.length) words = all;
  return words;
}

// ---- Business search pack (build time -> static JSON -> browser) --------

export interface PackRow {
  n: string; // name
  s: string; // slug
  ci: number; // index into pack.c
  si: number; // index into pack.s
  t: number; // tier
  [extra: string]: unknown; // hr, sd, l and (Featured only) p, w, a, d, wa
}
export interface SearchPack {
  v: string;
  d: PackRow[];
  c: { n: string; ns: string; ks: string }[];
  s: { n: string; s: string; ns: string }[];
  x: { n: unknown; c: unknown; s: unknown };
}

type IdxJson = { keys: unknown; records: { i: number; $: Record<string, { v: string; n?: number }> }[] };

export function buildSearchPack(
  rows: PackRow[],
  cats: { n: string; ks: string }[],
  subs: { n: string; s: string }[]
): Omit<SearchPack, 'v'> {
  const nameDocs = rows.map((r) => ({ nc: norm(r.n, true), ns: norm(r.n) }));
  const catDocs = cats.map((c) => ({ n: c.n, ns: norm(c.n), ks: norm(c.ks) }));
  const subDocs = subs.map((s) => ({ n: s.n, s: s.s, ns: norm(s.n) }));
  const strip = (idx: { toJSON(): unknown }) => {
    const j = idx.toJSON() as IdxJson;
    // Drop the per-field norm: ignoreFieldNorm is on, so it's never read.
    for (const rec of j.records) for (const k of Object.keys(rec.$)) delete rec.$[k].n;
    return j;
  };
  return {
    d: rows,
    c: catDocs,
    s: subDocs,
    x: {
      n: strip(Fuse.createIndex(NAME_KEYS, nameDocs)),
      c: strip(Fuse.createIndex(CAT_KEYS, catDocs)),
      s: strip(Fuse.createIndex(SUB_KEYS, subDocs)),
    },
  };
}

export interface Hit<T> {
  /** Index into engine.rows. */
  i: number;
  row: T;
  /** 5 exact name, 4 name prefix, 3 strong, 2 good, 1 loose (typo-ish). 0 = no query. */
  bucket: number;
  /** Lower = better (Fuse score). */
  score: number;
}

export class SearchEngine<T extends PackRow = PackRow> {
  rows: T[];
  private spaced: Fuse<T>;
  private compact: Fuse<T>;
  private cats: Fuse<{ n: string }>;
  private subs: Fuse<{ n: string; s: string }>;
  private rowsByCat: number[][] = [];
  private rowsBySub: number[][] = [];
  /** Slug of each row's suburb (rows ship the index only). */
  subSlug: string[];

  constructor(pack: SearchPack) {
    this.rows = pack.d as T[];
    const mk = <D>(docs: D[], keys: { name: string; weight: number }[], idx: unknown, threshold = BASE_OPTIONS.threshold) =>
      new Fuse<D>(docs, { ...BASE_OPTIONS, threshold, keys }, Fuse.parseIndex(idx as never));
    // The one prebuilt name index holds both fields; split it into one
    // single-field view each, so a query word scans only the field it needs
    // (words -> spaced name, whole query run together -> compact name).
    const nameIdx = pack.x.n as IdxJson;
    const view = (k: number, name: string) => ({
      keys: [{ path: [name], id: name, weight: 1, src: name }],
      records: nameIdx.records.map((r) => ({ i: r.i, $: { 0: r.$[k] } })),
    });
    this.spaced = mk(this.rows, [{ name: 'ns', weight: 1 }], view(1, 'ns'));
    this.compact = mk(this.rows, [{ name: 'nc', weight: 1 }], view(0, 'nc'));
    // Synonym text is long, so category matching is stricter (fuzzy match
    // inside a long string is cheap to hit by accident).
    this.cats = mk(pack.c, CAT_KEYS, pack.x.c, 0.2);
    this.subs = mk(pack.s, SUB_KEYS, pack.x.s, 0.25);
    pack.c.forEach(() => this.rowsByCat.push([]));
    pack.s.forEach(() => this.rowsBySub.push([]));
    this.subSlug = [];
    this.rows.forEach((r, i) => {
      this.rowsByCat[r.ci]?.push(i);
      this.rowsBySub[r.si]?.push(i);
      this.subSlug.push(pack.s[r.si]?.s ?? '');
    });
  }

  /** Best score per row index for one pattern, across name / category / suburb. */
  private scoresFor(w: string, alsoCompact: boolean): Map<number, number> {
    const out = new Map<number, number>();
    const put = (i: number, s: number) => {
      const p = out.get(i);
      if (p === undefined || s < p) out.set(i, s);
    };
    for (const r of this.spaced.search(w)) put(r.refIndex, r.score ?? 0);
    // A single word may also be a run-together name ("remax" ~ "Re/Max").
    if (alsoCompact && w.length >= 3) for (const r of this.compact.search(w)) put(r.refIndex, r.score ?? 0);
    for (const r of this.cats.search(w)) for (const i of this.rowsByCat[r.refIndex]) put(i, (r.score ?? 0) + CAT_PENALTY);
    for (const r of this.subs.search(w)) for (const i of this.rowsBySub[r.refIndex]) put(i, (r.score ?? 0) + SUB_PENALTY);
    return out;
  }

  search(rawQuery: string, opts: { suburb?: string } = {}): Hit<T>[] {
    const q = norm(rawQuery);
    const out: Hit<T>[] = [];
    const suburb = opts.suburb ?? '';
    if (!q) {
      this.rows.forEach((row, i) => {
        if (!suburb || this.subSlug[i] === suburb) out.push({ i, row, bucket: 0, score: 0 });
      });
      return out.sort((a, b) => (b.row.t >= 2 ? 1 : 0) - (a.row.t >= 2 ? 1 : 0) || a.row.n.localeCompare(b.row.n));
    }
    const words = queryWords(q);
    const qj = q.replace(/ /g, '');

    // AND across words; scores summed then averaged.
    let merged: Map<number, number> | null = null;
    for (const w of words) {
      const m = this.scoresFor(w, words.length === 1);
      if (!merged) {
        merged = m;
        continue;
      }
      const next = new Map<number, number>();
      for (const [i, s] of merged) {
        const s2 = m.get(i);
        if (s2 !== undefined) next.set(i, s + s2);
      }
      merged = next;
    }
    const best = new Map<number, number>();
    for (const [i, s] of merged ?? []) best.set(i, s / words.length);
    // The whole query run together, against the compact name ("picknpay").
    if (qj.length >= 3 && words.length !== 1) {
      for (const r of this.compact.search(qj)) {
        const s = r.score ?? 0;
        const p = best.get(r.refIndex);
        if (p === undefined || s < p) best.set(r.refIndex, s);
      }
    }
    for (const [i, score] of best) {
      if (suburb && this.subSlug[i] !== suburb) continue;
      const row = this.rows[i];
      let bucket = score <= 0.1 ? 3 : score <= 0.2 ? 2 : 1;
      // Exact / prefix name boosts (only the matches are normalised).
      const ns = norm(row.n);
      const nc = ns.replace(/ /g, '');
      if (ns === q || (qj.length >= 3 && nc === qj)) bucket = 5;
      else if (ns.startsWith(q) || (qj.length >= 3 && nc.startsWith(qj))) bucket = 4;
      out.push({ i, row, bucket, score });
    }
    // Most relevant first; within equal relevance Featured (t>=2) first,
    // then match strength, then alphabetically.
    out.sort(
      (a, b) =>
        b.bucket - a.bucket ||
        (b.row.t >= 2 ? 1 : 0) - (a.row.t >= 2 ? 1 : 0) ||
        a.score - b.score ||
        a.row.n.localeCompare(b.row.n)
    );
    return out;
  }
}

// ---- Small lists (suburbs, categories, claim picker ...) -----------------

/** Fuzzy search over any short list. `text(item)` gives the strings to match
 *  (first one is the "name"; the rest are weaker). Empty query -> all items.
 *  Same norm(), word-AND and compact-name logic as the business search. */
export function createListSearch<T>(items: T[], text: (item: T) => string[]) {
  const docs = items.map((item) => {
    const t = text(item);
    return { item, ns: norm(t[0] ?? ''), nc: norm(t[0] ?? '', true), rest: norm(t.slice(1).join(' ')) };
  });
  type D = (typeof docs)[number];
  const fuse = new Fuse(docs, {
    ...BASE_OPTIONS,
    keys: [
      { name: 'nc', weight: 0.4 },
      { name: 'ns', weight: 0.4 },
      { name: 'rest', weight: 0.2 },
    ],
  });
  return (rawQuery: string, limit = Infinity): T[] => {
    const q = norm(rawQuery);
    if (!q) return items.slice(0, limit);
    const words = queryWords(q);
    const qj = q.replace(/ /g, '');
    let merged: Map<D, number> | null = null;
    for (const w of words) {
      const m = new Map(fuse.search(w).map((r) => [r.item, r.score ?? 0] as [D, number]));
      if (!merged) merged = m;
      else {
        const next = new Map<D, number>();
        for (const [d, s] of merged) if (m.has(d)) next.set(d, s + m.get(d)!);
        merged = next;
      }
    }
    const best = new Map<D, number>();
    for (const [d, s] of merged ?? []) best.set(d, s / words.length);
    if (qj.length >= 3 && words.length !== 1) {
      for (const r of fuse.search(qj)) {
        const p = best.get(r.item);
        if ((r.score ?? 0) < (p ?? Infinity)) best.set(r.item, r.score ?? 0);
      }
    }
    return [...best]
      .map(([d, s]) => ({ d, s: d.ns === q || d.nc === qj ? -2 : d.ns.startsWith(q) || d.nc.startsWith(qj) ? -1 : s }))
      .sort((a, b) => a.s - b.s || a.d.ns.localeCompare(b.d.ns))
      .slice(0, limit)
      .map((x) => x.d.item);
  };
}
