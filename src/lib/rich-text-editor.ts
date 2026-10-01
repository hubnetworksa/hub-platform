// Browser-side WYSIWYG editor for a description field. The owner edits real
// bold / italic / lists in a contenteditable box (no ** markers on screen);
// every edit is serialised back into the tiny markdown subset rendered by
// ./rich-text.ts and written to the ORIGINAL <textarea>, which stays in the
// form (hidden) with the same name, so FormData, the APIs and the stored
// format are unchanged. The box is styled like the public .rich-text block,
// so it is its own preview. Styles live in src/styles/global.css (.rte-*).

import { renderRichText, plainHtml, visibleLength } from './rich-text';

export interface RichTextEditor {
  /** Basic / lapsed plans: buttons disabled, lock pill shown, the box shows
   *  plain text (as the public page does) and only takes plain text. The
   *  stored value is left untouched until the owner actually edits. */
  setLocked(locked: boolean): void;
  /** Re-render the box after setting textarea.value from script. */
  refresh(): void;
}

interface Options {
  locked?: boolean;
  /** Pill text while locked, e.g. "Verified plan". */
  lockLabel?: string;
  /** An element (usually a one-line upgrade note) shown only while locked. */
  lockNote?: HTMLElement | null;
  /** Visible-character limit (counted like rich-text.ts's visibleLength:
   *  markers don't count). Defaults to the textarea's maxlength. A live
   *  "n / max" counter shows under the box; typing stops at the limit and a
   *  paste is cut to fit. */
  maxChars?: number;
  /** One paragraph, bold/italic only (the short description): no list
   *  buttons, Enter does nothing, pasted paragraphs are joined. */
  singleParagraph?: boolean;
}

// ---------------------------------------------------------------------------
// DOM -> markdown serialiser (pure; exported for the round-trip tests)
// ---------------------------------------------------------------------------

type Seg = { t: string; b: boolean; i: boolean };
type MBlock = { kind: 'p' | 'ul' | 'ol'; lines: Seg[][] };

const BLOCK_TAGS = new Set([
  'P', 'DIV', 'H1', 'H2', 'H3', 'H4', 'H5', 'H6', 'BLOCKQUOTE', 'PRE', 'SECTION', 'ARTICLE', 'HEADER', 'FOOTER',
  'ASIDE', 'NAV', 'MAIN', 'FIGURE', 'FIGCAPTION', 'ADDRESS', 'DL', 'DT', 'DD', 'TABLE', 'THEAD', 'TBODY', 'TFOOT',
  'TR', 'TD', 'TH', 'CAPTION', 'HR', 'FORM', 'FIELDSET', 'DETAILS', 'SUMMARY', 'CENTER', 'BODY', 'HTML',
]);
// Never carried over: media, embeds, form controls, metadata.
const SKIP_TAGS = new Set([
  'SCRIPT', 'STYLE', 'TEMPLATE', 'HEAD', 'META', 'LINK', 'TITLE', 'NOSCRIPT', 'IMG', 'PICTURE', 'VIDEO', 'AUDIO',
  'SOURCE', 'TRACK', 'IFRAME', 'OBJECT', 'EMBED', 'SVG', 'MATH', 'CANVAS', 'BUTTON', 'INPUT', 'SELECT', 'TEXTAREA',
  'OPTION', 'MAP', 'AREA',
]);
const BOLD_TAGS = new Set(['B', 'STRONG', 'H1', 'H2', 'H3', 'H4', 'H5', 'H6']);
const ITALIC_TAGS = new Set(['I', 'EM', 'CITE', 'DFN', 'VAR']);

function styleProp(style: string, prop: string): string | null {
  const m = new RegExp(`(?:^|;)\\s*${prop}\\s*:\\s*([^;!]+)`, 'i').exec(style);
  return m ? m[1]!.trim().toLowerCase() : null;
}

/** Bold from the tag, or from an inline font-weight (Google Docs wraps the
 *  whole clipboard in <b style="font-weight:normal"> and marks real bold with
 *  <span style="font-weight:700">; Safari/Chrome may write weight spans). */
function isBold(tag: string, style: string, inherited: boolean): boolean {
  const fw = styleProp(style, 'font-weight');
  if (fw) {
    if (fw === 'bold' || fw === 'bolder') return true;
    if (fw === 'normal' || fw === 'lighter') return false;
    const n = parseInt(fw, 10);
    if (!isNaN(n)) return n >= 600;
  }
  return BOLD_TAGS.has(tag) || inherited;
}

function isItalic(tag: string, style: string, inherited: boolean): boolean {
  const fs = styleProp(style, 'font-style');
  if (fs) {
    if (fs === 'italic' || fs.startsWith('oblique')) return true;
    if (fs === 'normal') return false;
  }
  return ITALIC_TAGS.has(tag) || inherited;
}

/** Whitespace tidy for one line: zero-width chars out, nbsp -> space, runs
 *  collapsed (pasted HTML only — the editor itself is white-space:pre-wrap),
 *  ends trimmed, adjacent same-format runs merged. */
function tidyLine(line: Seg[], collapse: boolean): Seg[] {
  const out: Seg[] = [];
  for (const s of line) {
    let t = s.t.replace(/[​‌‍﻿]/g, '').replace(/[  ]/g, ' ').replace(/[\r\n\t\f\v]/g, ' ');
    if (collapse) t = t.replace(/ {2,}/g, ' ');
    if (!t) continue;
    const last = out[out.length - 1];
    if (last && last.b === s.b && last.i === s.i) last.t += t;
    else out.push({ t, b: s.b, i: s.i });
  }
  if (collapse) {
    for (let k = 1; k < out.length; k++) {
      if (out[k - 1]!.t.endsWith(' ') && out[k]!.t.startsWith(' ')) out[k]!.t = out[k]!.t.slice(1);
    }
  }
  while (out.length && !out[0]!.t.trim()) out.shift();
  while (out.length && !out[out.length - 1]!.t.trim()) out.pop();
  if (out.length) {
    out[0]!.t = out[0]!.t.replace(/^\s+/, '');
    out[out.length - 1]!.t = out[out.length - 1]!.t.replace(/\s+$/, '');
  }
  return out.filter((s) => s.t);
}

interface CollectOpts {
  /** No bold/italic/lists (locked plans): list items become plain lines. */
  plain?: boolean;
  /** Pasted HTML: collapse source whitespace, newlines are not line breaks. */
  paste?: boolean;
}

function collect(root: Node, opts: CollectOpts): MBlock[] {
  const plain = !!opts.plain;
  const paste = !!opts.paste;
  const out: MBlock[] = [];
  let para: MBlock | null = null; // open paragraph
  let list: MBlock | null = null; // open list (items are its lines)
  let wordList: MBlock | null = null; // Word's <p style="mso-list:..."> run
  let line: Seg[] = [];

  const flushLine = () => {
    const segs = tidyLine(line, paste);
    line = [];
    if (!segs.length) return false;
    if (list) {
      list.lines.push(segs);
      return true;
    }
    if (!para) {
      para = { kind: 'p', lines: [] };
      out.push(para);
    }
    para.lines.push(segs);
    return true;
  };
  const endPara = () => {
    flushLine();
    para = null;
  };
  const text = (t: string, b: boolean, i: boolean) => {
    if (paste) {
      line.push({ t, b, i });
      return;
    }
    // In the editor a raw newline (pre-wrap) is a line break, like <br>.
    const parts = t.split('\n');
    parts.forEach((p, k) => {
      if (k > 0) br();
      if (p) line.push({ t: p, b, i });
    });
  };
  const br = () => {
    // Two breaks in a row (an empty line) start a new paragraph, matching
    // the "blank line = paragraph" storage rule.
    const hadText = tidyLine(line, paste).length > 0;
    if (!hadText && !list && para) para = null;
    else flushLine();
  };

  const openList = (kind: 'ul' | 'ol') => {
    endPara();
    const blk: MBlock = { kind: plain ? 'p' : kind, lines: [] };
    out.push(blk);
    return blk;
  };

  const walk = (n: Node, b: boolean, i: boolean) => {
    if (n.nodeType === 3) {
      text(n.nodeValue ?? '', plain ? false : b, plain ? false : i);
      return;
    }
    if (n.nodeType === 9 || n.nodeType === 11) {
      n.childNodes.forEach((c) => walk(c, b, i));
      return;
    }
    if (n.nodeType !== 1) return;
    const el = n as Element;
    const tag = el.nodeName.toUpperCase();
    if (SKIP_TAGS.has(tag)) return;
    const style = el.getAttribute('style') ?? '';
    if (/mso-list\s*:\s*ignore/i.test(style)) return; // Word's bullet glyph
    if (styleProp(style, 'display') === 'none' || el.hasAttribute('hidden')) return;
    const nb = isBold(tag, style, b);
    const ni = isItalic(tag, style, i);
    const kids = () => el.childNodes.forEach((c) => walk(c, nb, ni));

    if (tag === 'BR') {
      br();
      return;
    }
    if (tag === 'UL' || tag === 'OL') {
      if (list) {
        // Nested list: flattened into the outer one.
        flushLine();
        kids();
        flushLine();
        return;
      }
      list = openList(tag === 'UL' ? 'ul' : 'ol');
      kids();
      flushLine();
      list = null;
      para = null;
      wordList = null;
      return;
    }
    if (tag === 'LI') {
      if (!list) {
        // Stray <li> (pasted fragment): an implicit bullet list.
        const prev = out[out.length - 1];
        list = prev && prev === wordList ? prev : openList('ul');
        wordList = list;
        kids();
        flushLine();
        list = null;
        para = null;
        return;
      }
      flushLine();
      kids();
      flushLine();
      return;
    }
    // Word list paragraphs: <p class=MsoListParagraph style="mso-list:l0 level1 lfo1">
    if (!list && /mso-list\s*:/i.test(style)) {
      const marker = el.querySelector('[style*="mso-list"]')?.textContent ?? '';
      const kind = /^\s*\(?[0-9a-z]{1,3}[.)]/i.test(marker) ? 'ol' : 'ul';
      const prev = out[out.length - 1];
      if (!(prev && prev === wordList && (plain || prev.kind === kind))) wordList = openList(kind);
      list = wordList;
      kids();
      flushLine();
      list = null;
      para = null;
      return;
    }
    if (BLOCK_TAGS.has(tag)) {
      if (list) {
        flushLine();
        kids();
        flushLine();
      } else {
        endPara();
        kids();
        endPara();
        wordList = wordList && out[out.length - 1] === wordList ? wordList : null;
      }
      return;
    }
    kids(); // inline: span, a (text only), font, u, small, o:p, …
  };

  // The root itself (the editor box, or a pasted <body>) only contributes its
  // children: its own inline style must not read as formatting.
  root.childNodes.forEach((c) => walk(c, false, false));
  endPara();
  return out.filter((blk) => blk.lines.length);
}

// --- markdown emission ------------------------------------------------------

const LISTY = /^\s*(?:[-*•]|\d{1,3}[.)])\s/;

function splitWs(t: string): [string, string, string] {
  const m = /^(\s*)([\s\S]*?)(\s*)$/.exec(t)!;
  return [m[1]!, m[2]!, m[3]!];
}

const wrap = (md: string, mk: string) => {
  const [lead, core, trail] = splitWs(md);
  return core ? `${lead}${mk}${core}${mk}${trail}` : md;
};

/** One line of segments as markdown. `outer` picks how bold+italic overlap
 *  is written: one run of the outer format wrapping the inner one
 *  ("**a *b* c**" / "*a **b** c*"), or each run on its own ("flat").
 *  escapeStars writes literal stars as \*. */
function lineMd(segs: Seg[], outer: 'b' | 'i' | 'flat', escapeStars: boolean): string {
  const txt = (s: Seg) => (escapeStars ? s.t.replace(/\*/g, '\\*') : s.t);
  if (outer === 'flat') {
    return segs.map((s) => (s.b || s.i ? wrap(txt(s), s.b && s.i ? '***' : s.b ? '**' : '*') : txt(s))).join('');
  }
  const inner = outer === 'b' ? 'i' : 'b';
  const innerMk = inner === 'b' ? '**' : '*';
  const outerMk = outer === 'b' ? '**' : '*';
  let md = '';
  for (let k = 0; k < segs.length; ) {
    const on = segs[k]![outer];
    let j = k;
    let run = '';
    while (j < segs.length && segs[j]![outer] === on) {
      const s = segs[j]!;
      run += s[inner] ? wrap(txt(s), innerMk) : txt(s);
      j++;
    }
    md += on ? wrap(run, outerMk) : run;
    k = j;
  }
  return md;
}

/** Text + per-character format of rendered inline HTML (only <strong>, <em>
 *  and escaped text ever appear), for a "does it look the same" check. */
function htmlLook(html: string): string {
  let b = 0;
  let i = 0;
  let out = '';
  const ent: Record<string, string> = { amp: '&', lt: '<', gt: '>', quot: '"', '#39': "'" };
  for (const tok of html.split(/(<\/?(?:strong|em)>|&(?:amp|lt|gt|quot|#39);)/)) {
    if (tok === '<strong>') b++;
    else if (tok === '</strong>') b--;
    else if (tok === '<em>') i++;
    else if (tok === '</em>') i--;
    else {
      const t = /^&(.+);$/.exec(tok) ? ent[tok.slice(1, -1)]! : tok;
      for (const ch of t) out += /\s/.test(ch) ? ' ' : `${ch}${b > 0 ? 'B' : '-'}${i > 0 ? 'I' : '-'}`;
    }
  }
  return out;
}

function segsLook(segs: Seg[]): string {
  let out = '';
  for (const s of segs) for (const ch of s.t) out += /\s/.test(ch) ? ' ' : `${ch}${s.b ? 'B' : '-'}${s.i ? 'I' : '-'}`;
  return out;
}

/** Markdown for one line that renders back looking exactly as typed: the
 *  shortest of the candidate spellings that passes, escaping literal stars
 *  (and a list-looking start) only when the plain spelling would misrender. */
function safeLine(segs: Seg[], kind: MBlock['kind']): string {
  const want = segsLook(segs);
  const looks = (md: string) => {
    const html = renderRichText(kind === 'p' ? md : `- ${md}`);
    const m = kind === 'p' ? /^<p>(.*)<\/p>$/.exec(html) : /^<ul><li>(.*)<\/li><\/ul>$/.exec(html);
    return !!m && !m[1]!.includes('<br>') && !/<\/?(?:p|ul|ol|li)>/.test(m[1]!) && htmlLook(m[1]!) === want;
  };
  const fixStart = (md: string) => (kind === 'p' && LISTY.test(md) ? `\\${md}` : md);
  let fallback = '';
  for (const esc of [false, true]) {
    const ok: string[] = [];
    for (const outer of ['b', 'i', 'flat'] as const) {
      const md = fixStart(lineMd(segs, outer, esc));
      if (!fallback) fallback = md;
      if (looks(md)) ok.push(md);
    }
    if (ok.length) return ok.sort((a, z) => a.length - z.length)[0]!;
  }
  return fallback;
}

function emit(blocks: MBlock[]): string {
  return blocks
    .map((blk) =>
      blk.lines
        .map((segs, n) => {
          const md = safeLine(segs, blk.kind);
          return blk.kind === 'ul' ? `- ${md}` : blk.kind === 'ol' ? `${n + 1}. ${md}` : md;
        })
        .join('\n')
    )
    .join('\n\n');
}

/** Everything as one paragraph line (the short description). */
function singleLine(blocks: MBlock[]): MBlock[] {
  const segs: Seg[] = [];
  for (const blk of blocks) for (const line of blk.lines) {
    if (segs.length) segs.push({ t: ' ', b: false, i: false });
    segs.push(...line);
  }
  const line = tidyLine(segs, true);
  return line.length ? [{ kind: 'p', lines: [line] }] : [];
}

/** Keep at most `budget` visible characters (plainText's count: a line
 *  break is one, a paragraph break two). Returns whether anything was cut. */
function truncateBlocks(blocks: MBlock[], budget: number): { blocks: MBlock[]; cut: boolean } {
  let left = Math.max(0, budget);
  const out: MBlock[] = [];
  for (let bi = 0; bi < blocks.length; bi++) {
    const blk = blocks[bi]!;
    if (bi > 0) left -= 2;
    const lines: Seg[][] = [];
    for (let li = 0; li < blk.lines.length; li++) {
      if (li > 0) left -= 1;
      if (left <= 0) break;
      const line: Seg[] = [];
      for (const s of blk.lines[li]!) {
        if (left <= 0) break;
        const t = [...s.t];
        const keep = t.slice(0, left).join('');
        left -= Math.min(t.length, left);
        line.push({ ...s, t: keep });
      }
      const tidy = tidyLine(line, false);
      if (tidy.length) lines.push(tidy);
    }
    if (lines.length) out.push({ kind: blk.kind, lines });
    if (left <= 0) {
      const total = blocks.reduce((n, b, k) => n + (k ? 2 : 0) + b.lines.reduce((m, l, j) => m + (j ? 1 : 0) + l.reduce((x, s) => x + [...s.t].length, 0), 0), 0);
      return { blocks: out, cut: total > budget };
    }
  }
  return { blocks: out, cut: false };
}

interface SerialiseOpts extends CollectOpts {
  /** One paragraph, no lists (the short description). */
  single?: boolean;
}

/** Serialise an editor (or any DOM fragment) to the stored markdown subset. */
export function domToRichText(root: Node, opts: SerialiseOpts = {}): string {
  const blocks = collect(root, opts);
  return emit(opts.single ? singleLine(blocks) : blocks);
}

function textBlocks(text: string): MBlock[] {
  const blocks: MBlock[] = [];
  let para: MBlock | null = null;
  for (const raw of text.replace(/\r\n?/g, '\n').split('\n')) {
    const segs = tidyLine([{ t: raw, b: false, i: false }], false);
    if (!segs.length) {
      para = null;
      continue;
    }
    if (!para) {
      para = { kind: 'p', lines: [] };
      blocks.push(para);
    }
    para.lines.push(segs);
  }
  return blocks;
}

function htmlBlocks(html: string, plain: boolean): MBlock[] {
  const doc = new DOMParser().parseFromString(html, 'text/html'); // inert: no scripts, no image loads
  return collect(doc.body, { plain, paste: true });
}

/** Plain text (e.g. a text/plain paste) to the markdown subset: literal text,
 *  line breaks kept, blank lines = paragraphs, stars escaped if needed. */
export function textToRichText(text: string): string {
  return emit(textBlocks(text));
}

/** Pasted HTML to the markdown subset (bold, italic, lists, paragraphs only). */
export function htmlToRichText(html: string, plain = false): string {
  return emit(htmlBlocks(html, plain));
}

/** Clipboard content cleaned for the editor, cut to `budget` visible chars. */
export function clipboardToRichText(
  html: string,
  text: string,
  o: { plain?: boolean; single?: boolean; budget?: number } = {}
): { md: string; cut: boolean } {
  let blocks = html ? htmlBlocks(html, !!o.plain) : textBlocks(text);
  if (o.single) blocks = singleLine(blocks);
  let cut = false;
  if (o.budget !== undefined) ({ blocks, cut } = truncateBlocks(blocks, o.budget));
  return { md: emit(blocks), cut };
}

// ---------------------------------------------------------------------------
// The editor UI
// ---------------------------------------------------------------------------

const LOCK_SVG = '<svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="4" y="10.5" width="16" height="10.5" rx="2.5"/><path d="M8 10.5V7.5a4 4 0 0 1 8 0v3"/></svg>';
const BULLET_SVG = '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" aria-hidden="true"><path d="M9 6h11M9 12h11M9 18h11"/><circle cx="4.5" cy="6" r="1.2" fill="currentColor"/><circle cx="4.5" cy="12" r="1.2" fill="currentColor"/><circle cx="4.5" cy="18" r="1.2" fill="currentColor"/></svg>';
const NUMBER_SVG = '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" aria-hidden="true"><path d="M10 6h10M10 12h10M10 18h10"/><path d="M4 4.5h1.5V9M3.6 9h3.4" stroke-width="1.6"/><path d="M3.7 14.6c.3-.6.9-.9 1.5-.9.9 0 1.5.6 1.5 1.3 0 1.2-2.9 2.1-3 4h3.1" stroke-width="1.6"/></svg>';

const isMac = typeof navigator !== 'undefined' && /Mac|iPhone|iPad/.test(navigator.platform || navigator.userAgent);
const MOD = isMac ? '⌘' : 'Ctrl+';

const EXEC: Record<string, string> = { bold: 'bold', italic: 'italic', ul: 'insertUnorderedList', ol: 'insertOrderedList' };

let uid = 0;

export function attachRichTextEditor(ta: HTMLTextAreaElement, opts: Options = {}): RichTextEditor {
  const n = ++uid;
  const bar = document.createElement('div');
  bar.className = 'rte-bar';
  bar.setAttribute('role', 'toolbar');
  bar.setAttribute('aria-label', 'Description formatting');
  const btn = (cmd: string, html: string, label: string) => {
    const b = document.createElement('button');
    b.type = 'button';
    b.className = 'rte-btn';
    b.dataset.cmd = cmd;
    b.innerHTML = html;
    b.title = label;
    b.setAttribute('aria-label', label);
    b.setAttribute('aria-pressed', 'false');
    return b;
  };
  const single = !!opts.singleParagraph;
  const buttons = [
    btn('bold', '<strong>B</strong>', `Bold (${MOD}B)`),
    btn('italic', '<em>I</em>', `Italic (${MOD}I)`),
    ...(single ? [] : [btn('ul', BULLET_SVG, 'Bullet list'), btn('ol', NUMBER_SVG, 'Numbered list')]),
  ];
  buttons.forEach((b) => bar.appendChild(b));
  const pill = document.createElement('span');
  pill.className = 'rte-lock';
  pill.innerHTML = `${LOCK_SVG} `;
  pill.append(opts.lockLabel ?? 'Verified plan');
  bar.appendChild(pill);

  // The box: looks like the field it replaces, reads like the public page.
  const ed = document.createElement('div');
  ed.className = `${ta.className} rich-text rte-editor${single ? ' rte-editor--short' : ''}`.trim();
  ed.style.cssText = ta.style.cssText;
  ed.style.removeProperty('resize');
  ed.contentEditable = 'true';
  ed.id = ta.id ? `${ta.id}-editor` : `rte-editor-${n}`;
  ed.setAttribute('role', 'textbox');
  ed.setAttribute('aria-multiline', single ? 'false' : 'true');
  ed.spellcheck = true;
  ed.dataset.placeholder = ta.placeholder || 'Describe what you do…';
  bar.setAttribute('aria-controls', ed.id);

  const max = opts.maxChars ?? (ta.maxLength > 0 ? ta.maxLength : 0);
  const count = document.createElement('div');
  count.className = 'rte-count';
  count.id = `${ed.id}-count`;
  const countNote = document.createElement('span');
  countNote.className = 'rte-count-note';
  countNote.setAttribute('role', 'status');
  const countNum = document.createElement('span');
  countNum.className = 'rte-count-num';
  count.append(countNote, countNum);
  count.hidden = !max;
  ed.setAttribute('aria-describedby', count.id);

  // The label's own words name the box (its textContent would include the
  // editor's text). The textarea leaves the <label> so the label's click
  // activation doesn't aim at a hidden control; it stays in the form.
  const label = ta.closest('label');
  const labelText =
    ta.getAttribute('aria-label') ||
    (label
      ? Array.from(label.childNodes)
          .filter((c) => c.nodeType === 3)
          .map((c) => c.textContent!.trim())
          .filter(Boolean)
          .join(' ')
      : '') ||
    'Description';
  ed.setAttribute('aria-label', labelText);
  if (opts.lockNote) {
    if (!opts.lockNote.id) opts.lockNote.id = `rte-lock-note-${n}`;
    ed.setAttribute('aria-describedby', `${count.id} ${opts.lockNote.id}`);
  }

  ta.before(bar);
  ta.before(ed);
  ta.before(count);
  if (label) {
    label.after(ta);
    // Without a `for`, a label's control is its first labelable descendant —
    // now the Bold button — so every click in the box would also "click"
    // Bold. Point it at the (hidden, inert) textarea instead.
    if (!ta.id) ta.id = `rte-source-${n}`;
    label.htmlFor = ta.id;
  }
  ta.hidden = true;
  ta.classList.add('rte-source');
  ta.tabIndex = -1;
  ta.setAttribute('aria-hidden', 'true');
  label?.addEventListener('click', (ev) => {
    const t = ev.target as HTMLElement;
    if (t === label) ed.focus();
  });

  let locked = !!opts.locked;
  let saved: Range | null = null;
  // The raw stored text may be longer than the visible count (markers), but
  // never past the textarea's own maxlength when that is the bigger cap.
  const rawMax = ta.maxLength > 0 ? Math.max(ta.maxLength, max) : 0;
  const used = () => visibleLength(ta.value);

  let noteTimer = 0;
  const note = (msg: string) => {
    countNote.textContent = msg;
    clearTimeout(noteTimer);
    if (msg) noteTimer = window.setTimeout(() => (countNote.textContent = ''), 6000);
  };
  const updateCount = () => {
    if (!max) return;
    const len = used();
    countNum.textContent = `${len} / ${max}`;
    countNum.setAttribute('aria-label', `${len} of ${max} characters used`);
    count.classList.toggle('is-near', len >= max * 0.9 && len <= max);
    count.classList.toggle('is-over', len > max);
    if (len > max) countNote.textContent = `${len - max} over the limit — please shorten it`;
    else if (countNote.textContent?.includes('over the limit')) countNote.textContent = '';
  };

  const isBlank = () => !ed.textContent!.replace(/[\s​﻿]/g, '') && !ed.querySelector('li');

  const paintEmpty = () => ed.classList.toggle('is-empty', isBlank());

  /** value -> box. Locked shows what the public page shows: plain text. */
  const load = () => {
    const v = ta.value;
    ed.innerHTML = locked ? plainHtml(v) : renderRichText(v); // safe: both escape everything
    paintEmpty();
    updateCount();
  };

  /** A focused, empty box always holds one <p> with the caret in it. With
   *  no child at all, Chrome takes the caret's style from OUTSIDE the box
   *  (the bold <label>), so the first thing typed came out bold. */
  const ensureParagraph = () => {
    if (ed.firstChild) return;
    ed.innerHTML = '<p><br></p>';
    const sel = document.getSelection();
    if (sel && document.activeElement === ed) {
      const r = document.createRange();
      r.setStart(ed.firstChild!, 0);
      r.collapse(true);
      sel.removeAllRanges();
      sel.addRange(r);
    }
  };

  /** box -> value. */
  const sync = () => {
    if (!ed.firstChild && document.activeElement === ed) ensureParagraph();
    paintEmpty();
    const md = domToRichText(ed, { plain: locked, single });
    if (md !== ta.value) ta.value = md;
    updateCount();
    paintState();
  };

  const inEditor = (node: Node | null) => !!node && (node === ed || ed.contains(node));

  const paintState = () => {
    const sel = document.getSelection();
    const active = !locked && document.activeElement === ed && sel && inEditor(sel.anchorNode);
    for (const b of buttons) {
      let on = false;
      if (active) {
        try {
          on = document.queryCommandState(EXEC[b.dataset.cmd!]!);
        } catch {
          on = false;
        }
      }
      b.setAttribute('aria-pressed', on ? 'true' : 'false');
    }
  };

  let primed = false;
  const prime = () => {
    if (primed) return;
    primed = true;
    try {
      document.execCommand('defaultParagraphSeparator', false, 'p');
      document.execCommand('styleWithCSS', false, 'false');
    } catch {
      /* older engines: their defaults are handled by the serialiser */
    }
  };

  const restoreSelection = () => {
    ed.focus();
    const sel = document.getSelection();
    if (sel && saved && !inEditor(sel.anchorNode) && inEditor(saved.startContainer)) {
      sel.removeAllRanges();
      sel.addRange(saved);
    }
  };

  const run = (cmd: string) => {
    if (locked || ta.disabled || ta.readOnly) return;
    restoreSelection();
    prime();
    try {
      document.execCommand(EXEC[cmd]!, false);
    } catch {
      /* unsupported: no-op */
    }
    sync();
  };

  /** Insert pasted / dropped content at the caret, cleaned to what the
   *  stored format can hold (and to plain text while locked). */
  const insertClean = (data: DataTransfer | null) => {
    if (!data) return;
    const html = data.getData('text/html');
    const text = data.getData('text/plain');
    restoreSelection();
    // Room left: the limit, minus what's there, plus whatever the paste replaces.
    const sel = document.getSelection();
    const replacing = sel && sel.rangeCount && inEditor(sel.anchorNode) ? sel.toString().length : 0;
    const budget = max ? Math.max(0, max - used() + replacing) : undefined;
    const { md, cut } = clipboardToRichText(html, text, { plain: locked, single, budget });
    if (cut) note(md ? `Pasted text was cut to fit the ${max}-character limit.` : `No room left: the limit is ${max} characters.`);
    if (!md) return;
    prime();
    if (!md.includes('\n') && !html && !cut) {
      document.execCommand('insertText', false, single ? text.replace(/\s+/g, ' ').trim() : text.trim());
    } else {
      let out = locked ? plainHtml(md) : renderRichText(md);
      // One plain paragraph goes in inline so it doesn't split the line.
      const one = /^<p>((?:(?!<\/?p>).)*)<\/p>$/.exec(out);
      if (one && !one[1]!.includes('<br>')) out = one[1]!;
      document.execCommand('insertHTML', false, out);
    }
    sync();
  };

  // mousedown preventDefault keeps the box's selection when a button is
  // clicked (otherwise focus moves to the button first on some browsers).
  bar.addEventListener('mousedown', (ev) => {
    if ((ev.target as HTMLElement).closest('.rte-btn')) ev.preventDefault();
  });
  bar.addEventListener('click', (ev) => {
    const b = (ev.target as HTMLElement).closest<HTMLButtonElement>('.rte-btn');
    if (!b) return;
    ev.preventDefault(); // inside a <label>: don't bounce focus elsewhere
    run(b.dataset.cmd!);
  });

  ed.addEventListener('focus', () => {
    prime();
    ensureParagraph();
  });
  // A click lands the caret after focus; put it back inside the <p> when the
  // box is empty (and refill it if everything was just deleted).
  ed.addEventListener('mouseup', () => {
    if (!isBlank()) return;
    if (ed.firstChild && ed.firstChild.nodeName !== 'P') ed.innerHTML = '';
    if (!ed.firstChild) ensureParagraph();
    else {
      const sel = document.getSelection();
      const p = ed.firstChild;
      if (sel && !p.contains(sel.anchorNode)) {
        const r = document.createRange();
        r.setStart(p, 0);
        r.collapse(true);
        sel.removeAllRanges();
        sel.addRange(r);
      }
    }
  });
  ed.addEventListener('keydown', (ev) => {
    if (single && ev.key === 'Enter') {
      ev.preventDefault(); // one paragraph only
      return;
    }
    if (!(ev.ctrlKey || ev.metaKey) || ev.altKey) return;
    const k = ev.key.toLowerCase();
    if (k === 'u' && !ev.shiftKey) {
      ev.preventDefault(); // underline isn't part of the format
      return;
    }
    if ((k !== 'b' && k !== 'i') || ev.shiftKey) return;
    ev.preventDefault(); // locked: ignored; unlocked: same path as the buttons
    if (!locked) run(k === 'b' ? 'bold' : 'italic');
  });
  ed.addEventListener('beforeinput', (ev) => {
    const type = ev.inputType || '';
    if (type.startsWith('format')) {
      // iOS's B/I/U menu and the like: only bold/italic, and only unlocked.
      if (locked || (type !== 'formatBold' && type !== 'formatItalic')) ev.preventDefault();
      return;
    }
    if (single && (type === 'insertParagraph' || type === 'insertLineBreak')) {
      ev.preventDefault();
      return;
    }
    if (!type.startsWith('insert') || type === 'insertFromPaste' || type === 'insertFromDrop') return;
    // At the limit, typing stops (replacing a selection is still allowed).
    const sel = document.getSelection();
    const replacing = !!sel && !sel.isCollapsed && inEditor(sel.anchorNode);
    if (!replacing && ((max && used() >= max) || (rawMax && ta.value.length >= rawMax))) {
      ev.preventDefault();
      note(`That's the ${max}-character limit.`);
    }
  });
  ed.addEventListener('input', sync);
  ed.addEventListener('paste', (ev) => {
    ev.preventDefault();
    insertClean(ev.clipboardData);
  });
  ed.addEventListener('drop', (ev) => {
    ev.preventDefault();
    const d = ev.dataTransfer;
    const doc = document as Document & { caretPositionFromPoint?: (x: number, y: number) => { offsetNode: Node; offset: number } | null };
    let r: Range | null = null;
    if (doc.caretPositionFromPoint) {
      const p = doc.caretPositionFromPoint(ev.clientX, ev.clientY);
      if (p) {
        r = document.createRange();
        r.setStart(p.offsetNode, p.offset);
      }
    } else if (document.caretRangeFromPoint) {
      r = document.caretRangeFromPoint(ev.clientX, ev.clientY);
    }
    if (r && inEditor(r.startContainer)) saved = r;
    ed.focus();
    const sel = document.getSelection();
    if (sel && saved) {
      sel.removeAllRanges();
      sel.addRange(saved);
    }
    insertClean(d);
  });
  // Leaving the field: redraw it from the stored text, so what's on screen is
  // exactly what will be saved (drops stray browser spans/styles).
  ed.addEventListener('focusout', (ev) => {
    const to = ev.relatedTarget as Node | null;
    if (to && bar.contains(to)) return;
    load();
    paintState();
  });
  document.addEventListener('selectionchange', () => {
    const sel = document.getSelection();
    if (sel && sel.rangeCount && inEditor(sel.anchorNode)) saved = sel.getRangeAt(0).cloneRange();
    paintState();
  });
  ta.form?.addEventListener('reset', () => setTimeout(load, 0));

  const setLocked = (on: boolean) => {
    const changed = on !== locked;
    locked = on;
    bar.classList.toggle('is-locked', on);
    buttons.forEach((b) => (b.disabled = on));
    pill.hidden = !on;
    if (opts.lockNote) opts.lockNote.hidden = !on;
    if (changed) load();
    paintState();
  };
  setLocked(locked);
  load();
  return { setLocked, refresh: load };
}
