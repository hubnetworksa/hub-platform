// Length rules for <title> and the meta description, applied by BaseLayout
// to every page. Head metadata only: nothing here touches the page body.

export const MAX_TITLE = 60;
export const MIN_DESCRIPTION = 120;
export const MAX_DESCRIPTION = 160;

const TRAILING_JUNK = /[\s,;:|–—·&-]+$/;
const TRAILING_WORD = /\s+(?:in|at|on|of|for|and|or|but|the|a|an|to|with|by|near|from|after|before|until|during|against|into|over|under|via|vs|as|than|is|are|was|were|will|be|its|their|this|that|who|which|across|around|through|between|&)$/i;

/** Cut to at most `max` characters at a word boundary (never mid-word),
 *  without a dangling connector word or separator. */
export function clipWords(text: string, max: number): string {
  if (text.length <= max) return text;
  let cut = text.slice(0, max + 1);
  const sp = cut.lastIndexOf(' ');
  cut = sp > 0 ? cut.slice(0, sp) : text.slice(0, max);
  let prev = '';
  while (prev !== cut) {
    prev = cut;
    cut = cut.replace(TRAILING_JUNK, '').replace(TRAILING_WORD, '');
  }
  return cut;
}

/**
 * Fit a <title> to ~60 characters: drop the "| SiteName" suffix first, then
 * trailing " – qualifier" segments, then a trailing ", City" / " in City"
 * tail, and only then cut at a word boundary.
 */
export function fitTitle(title: string, max = MAX_TITLE): string {
  let t = title.trim();
  if (t.length <= max) return t;
  for (const sep of [' | ', ' – ', ' — ', ' - ']) {
    while (t.length > max && t.includes(sep)) t = t.slice(0, t.lastIndexOf(sep)).trim();
  }
  if (t.length > max) {
    const comma = t.lastIndexOf(', ');
    if (comma > max / 2) t = t.slice(0, comma);
  }
  return clipWords(t, max);
}

/**
 * Trim a meta description to 160 characters: at the last full sentence when
 * that still leaves 120+, otherwise at a word boundary with an ellipsis.
 */
export function fitDescription(description: string, max = MAX_DESCRIPTION): string {
  const d = description.replace(/\s+/g, ' ').trim();
  if (d.length <= max) return d;
  const head = d.slice(0, max);
  const stop = Math.max(head.lastIndexOf('. '), head.lastIndexOf('! '), head.lastIndexOf('? '));
  if (stop + 1 >= MIN_DESCRIPTION) return head.slice(0, stop + 1);
  if (/[.!?]$/.test(head) && head.length >= MIN_DESCRIPTION) return head;
  return `${clipWords(d, max - 1)}…`;
}

/** "<base> Also searched as: a, b, c." with as many of the first four
 *  synonyms as keep it within 160 characters. Under 120, the given facts
 *  are added after the base sentence (before the synonyms) until it fits. */
export function describeWithSynonyms(base: string, synonyms: string[], pads: (string | null | undefined | false)[] = []): string {
  const build = (b: string): string => {
    for (let n = Math.min(4, synonyms.length); n > 0; n--) {
      const withList = `${b} Also searched as: ${synonyms.slice(0, n).join(', ')}.`;
      if (withList.length <= MAX_DESCRIPTION) return withList;
    }
    return b;
  };
  let head = base.trim();
  let out = build(head);
  for (const pad of pads) {
    if (out.length >= MIN_DESCRIPTION) break;
    if (!pad) continue;
    const nextHead = `${head} ${pad.trim()}`;
    const next = build(nextHead);
    if (next.length <= MAX_DESCRIPTION && next.length > out.length) {
      head = nextHead;
      out = next;
    }
  }
  return out;
}

/** Append sentences (real facts the page already shows) to a description
 *  until it reaches 120 characters, never pushing it past 160. */
export function padDescription(description: string, extras: (string | null | undefined | false)[], max = MAX_DESCRIPTION): string {
  let d = description.trim();
  for (const extra of extras) {
    if (d.length >= MIN_DESCRIPTION) break;
    if (!extra) continue;
    const next = `${d}${/[.!?]$/.test(d) ? '' : '.'} ${extra.trim()}`;
    if (next.length <= max) d = next;
  }
  return d;
}
