// Lightweight description formatting: a tiny markdown subset stored as-is in
// the existing text columns (business + event descriptions). Plain old text
// is valid input and renders the same as before.
//
// Supported, and nothing else:
//   **bold**   *italic*   "- item" / "* item" bullets   "1. item" numbers
//   blank line = new paragraph, single newline = <br>
//
// Safety: renderRichText escapes ALL HTML first, then only ever emits the
// fixed, attribute-free tags <p> <strong> <em> <ul> <ol> <li> <br>. Nothing
// from the input can become a tag, attribute or URL.
//
// Shared by Astro pages (build time), the browser editors (live preview —
// keep this file dependency-free so it bundles small) and Pages Functions.

const ESC: Record<string, string> = { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' };
function esc(s: string): string {
  return s.replace(/[&<>"']/g, (c) => ESC[c]!);
}

const BULLET = /^\s*[-*•]\s+(.*)$/;
const NUMBER = /^\s*\d{1,3}[.)]\s+(.*)$/;
const BOLD = /\*\*(?=\S)([^\n]*?\S)\*\*/g;
const ITALIC = /(^|[^*\w])\*(?=[^\s*])([^*\n]*?[^\s*])\*(?![*\w])/g;

/** Inline markers on one line of ALREADY-ESCAPED text. */
function inline(escaped: string): string {
  return escaped
    .replace(BOLD, '<strong>$1</strong>')
    .replace(ITALIC, '$1<em>$2</em>');
}

function stripInline(s: string): string {
  return s.replace(BOLD, '$1').replace(ITALIC, '$1$2');
}

type Block = { kind: 'p' | 'ul' | 'ol'; lines: string[] };

function blocks(text: string): Block[] {
  const out: Block[] = [];
  let cur: Block | null = null;
  for (const raw of text.replace(/\r\n?/g, '\n').split('\n')) {
    if (!raw.trim()) { cur = null; continue; }
    const b = BULLET.exec(raw);
    const n = b ? null : NUMBER.exec(raw);
    const kind: Block['kind'] = b ? 'ul' : n ? 'ol' : 'p';
    const line = b ? b[1]! : n ? n[1]! : raw.trim();
    if (!cur || cur.kind !== kind) { cur = { kind, lines: [] }; out.push(cur); }
    cur.lines.push(line);
  }
  return out;
}

/** Safe HTML for a description. Empty input → ''. */
export function renderRichText(text: string | null | undefined): string {
  if (!text) return '';
  return blocks(text)
    .map((b) => {
      const lines = b.lines.map((l) => inline(esc(l)));
      if (b.kind === 'p') return `<p>${lines.join('<br>')}</p>`;
      return `<${b.kind}>${lines.map((l) => `<li>${l}</li>`).join('')}</${b.kind}>`;
    })
    .join('');
}

/** The description with every marker removed — for snippets, meta/OG
 *  descriptions, JSON-LD, the search index and email text. Paragraphs are
 *  separated by a blank line, other lines by a newline (collapse whitespace
 *  at the call site if one line is needed). Not HTML-escaped. */
export function plainText(text: string | null | undefined): string {
  if (!text) return '';
  return blocks(text)
    .map((b) => b.lines.map(stripInline).join('\n'))
    .join('\n\n');
}

/** Safe HTML for the plain fallback: markers gone, paragraphs as <p>, each
 *  other line (including what were list items) on its own line via <br>.
 *  Used when a listing isn't (or is no longer) on a paid plan — the stored
 *  formatting is kept, it just isn't shown. */
export function plainHtml(text: string | null | undefined): string {
  const t = plainText(text);
  if (!t) return '';
  return t
    .split('\n\n')
    .map((p) => `<p>${p.split('\n').map(esc).join('<br>')}</p>`)
    .join('');
}

/** plainText collapsed to a single line — cards, meta tags, search index. */
export function plainLine(text: string | null | undefined): string {
  if (!text) return '';
  return blocks(text)
    .map((b, i, all) => {
      const s = b.lines.map((l) => stripInline(l).trim()).join(b.kind === 'p' ? ' ' : '; ');
      // Separate blocks with a full stop so a list doesn't run into the next
      // sentence; the last block is left exactly as typed.
      return i === all.length - 1 || /[.!?:;,]$/.test(s) ? s : `${s}.`;
    })
    .join(' ')
    .replace(/\s+/g, ' ')
    .trim();
}

/** The one "paid plan is live" rule: Verified/Featured (tier >= 1) and either
 *  active or cancelled-but-paid-through-period-end. A lapsed (expired) or
 *  Basic listing fails it. logoFor and descriptionHtmlFor in data.ts use it;
 *  it lives here (dependency-free) so the browser editors can share it. */
export function canFormatDescription(b: { subscription_tier?: number | null; subscription_status?: string | null }): boolean {
  return (b.subscription_tier ?? 0) >= 1 && (b.subscription_status === 'active' || b.subscription_status === 'cancelled');
}
