// Browser-side formatting toolbar + live preview for a description <textarea>.
// Writes the tiny markdown subset rendered by ./rich-text.ts (bold, italic,
// bullet and numbered lists) — the preview uses that same renderer, so what
// the owner sees is exactly what the public page shows. Styles live in
// src/styles/global.css (.rte-*).

import { renderRichText } from './rich-text';

export interface RichTextEditor {
  /** Basic plans: buttons disabled, lock pill shown, preview hidden. The
   *  textarea itself always stays editable for plain text. */
  setLocked(locked: boolean): void;
  /** Re-render the preview after setting textarea.value from script. */
  refresh(): void;
}

interface Options {
  locked?: boolean;
  /** Pill text while locked, e.g. "Verified plan". */
  lockLabel?: string;
  /** An element (usually a one-line upgrade note) shown only while locked. */
  lockNote?: HTMLElement | null;
}

const LOCK_SVG = '<svg viewBox="0 0 24 24" width="12" height="12" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><rect x="4" y="10.5" width="16" height="10.5" rx="2.5"/><path d="M8 10.5V7.5a4 4 0 0 1 8 0v3"/></svg>';
const BULLET_SVG = '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" aria-hidden="true"><path d="M9 6h11M9 12h11M9 18h11"/><circle cx="4.5" cy="6" r="1.2" fill="currentColor"/><circle cx="4.5" cy="12" r="1.2" fill="currentColor"/><circle cx="4.5" cy="18" r="1.2" fill="currentColor"/></svg>';
const NUMBER_SVG = '<svg viewBox="0 0 24 24" width="18" height="18" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" aria-hidden="true"><path d="M10 6h10M10 12h10M10 18h10"/><path d="M4 4.5h1.5V9M3.6 9h3.4" stroke-width="1.6"/><path d="M3.7 14.6c.3-.6.9-.9 1.5-.9.9 0 1.5.6 1.5 1.3 0 1.2-2.9 2.1-3 4h3.1" stroke-width="1.6"/></svg>';

const isMac = typeof navigator !== 'undefined' && /Mac|iPhone|iPad/.test(navigator.platform || navigator.userAgent);
const MOD = isMac ? '⌘' : 'Ctrl+';

/** Replace [start,end) with text, keeping the browser's undo stack where it can. */
function replaceRange(ta: HTMLTextAreaElement, start: number, end: number, text: string, selStart: number, selEnd: number) {
  ta.focus();
  ta.setSelectionRange(start, end);
  let ok = false;
  try {
    ok = document.execCommand('insertText', false, text);
  } catch {
    ok = false;
  }
  if (!ok || ta.value.slice(start, start + text.length) !== text) {
    ta.setRangeText(text, start, end, 'end');
    ta.dispatchEvent(new Event('input', { bubbles: true }));
  }
  ta.setSelectionRange(selStart, selEnd);
}

function toggleInline(ta: HTMLTextAreaElement, marker: '**' | '*') {
  const v = ta.value;
  let s = ta.selectionStart;
  let e = ta.selectionEnd;
  // Leading/trailing spaces stay outside the markers (the renderer needs the
  // marker hard against a non-space character).
  while (s < e && /\s/.test(v[s]!)) s++;
  while (e > s && /\s/.test(v[e - 1]!)) e--;
  const m = marker.length;
  const sel = v.slice(s, e);
  // Already wrapped (markers just outside the selection, but not part of a
  // longer run, so *italic* inside **bold** still toggles correctly): unwrap.
  const before = v.slice(Math.max(0, s - m), s);
  const after = v.slice(e, e + m);
  // For italic, a '*' that is really half of a '**' bold marker doesn't count
  // (unless it's '***', i.e. bold + italic).
  const outerOk = marker === '**' || (v[s - 2] !== '*' && v[e + 1] !== '*') || v.slice(s - 3, s) === '***';
  if (sel && before === marker && after === marker && outerOk) {
    replaceRange(ta, s - m, e + m, sel, s - m, e - m);
    return;
  }
  if (sel.length > 2 * m && sel.startsWith(marker) && sel.endsWith(marker) && (marker === '**' || !sel.startsWith('**') || sel.startsWith('***'))) {
    const inner = sel.slice(m, -m);
    replaceRange(ta, s, e, inner, s, s + inner.length);
    return;
  }
  if (!sel) {
    replaceRange(ta, s, e, marker + marker, s + m, s + m);
    return;
  }
  // Markers don't span lines, so wrap each non-empty line on its own.
  const wrapped = sel
    .split('\n')
    .map((line) => {
      const t = line.trim();
      if (!t) return line;
      const lead = line.slice(0, line.indexOf(t));
      return `${lead}${marker}${t}${marker}${line.slice(lead.length + t.length)}`;
    })
    .join('\n');
  replaceRange(ta, s, e, wrapped, s, s + wrapped.length);
}

const BULLET_RE = /^(\s*)[-*•]\s+/;
const NUMBER_RE = /^(\s*)\d{1,3}[.)]\s+/;

function toggleList(ta: HTMLTextAreaElement, kind: 'ul' | 'ol') {
  const v = ta.value;
  const s = v.lastIndexOf('\n', ta.selectionStart - 1) + 1;
  let e = v.indexOf('\n', ta.selectionEnd > ta.selectionStart && v[ta.selectionEnd - 1] === '\n' ? ta.selectionEnd - 1 : ta.selectionEnd);
  if (e === -1) e = v.length;
  const lines = v.slice(s, e).split('\n');
  const mine = kind === 'ul' ? BULLET_RE : NUMBER_RE;
  const content = lines.filter((l) => l.trim());
  const allOn = content.length > 0 && content.every((l) => mine.test(l));
  let n = 0;
  const out = lines
    .map((l) => {
      if (!l.trim() && lines.length > 1) return l;
      const bare = l.replace(BULLET_RE, '$1').replace(NUMBER_RE, '$1');
      if (allOn) return bare;
      n++;
      return (kind === 'ul' ? '- ' : `${n}. `) + bare.trimStart();
    })
    .join('\n');
  replaceRange(ta, s, e, out, s + out.length, s + out.length);
}

export function attachRichTextEditor(ta: HTMLTextAreaElement, opts: Options = {}): RichTextEditor {
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
    return b;
  };
  const buttons = [
    btn('bold', '<strong>B</strong>', `Bold (${MOD}B)`),
    btn('italic', '<em>I</em>', `Italic (${MOD}I)`),
    btn('ul', BULLET_SVG, 'Bullet list'),
    btn('ol', NUMBER_SVG, 'Numbered list'),
  ];
  buttons.forEach((b) => bar.appendChild(b));
  const pill = document.createElement('span');
  pill.className = 'rte-lock';
  pill.innerHTML = `${LOCK_SVG} `;
  pill.append(opts.lockLabel ?? 'Verified plan');
  bar.appendChild(pill);

  const preview = document.createElement('div');
  preview.className = 'rte-preview';
  const previewLabel = document.createElement('div');
  previewLabel.className = 'rte-preview-label';
  previewLabel.textContent = 'Preview';
  const previewBody = document.createElement('div');
  previewBody.className = 'rich-text rte-preview-body';
  preview.append(previewLabel, previewBody);

  ta.before(bar);
  ta.after(preview);
  ta.classList.add('rte-textarea');

  let locked = !!opts.locked;

  const refresh = () => {
    const html = renderRichText(ta.value);
    if (html) {
      previewBody.innerHTML = html; // safe: renderRichText escapes everything
      previewBody.classList.remove('is-empty');
    } else {
      previewBody.textContent = 'Formatted text shows here as you type.';
      previewBody.classList.add('is-empty');
    }
  };

  const run = (cmd: string) => {
    if (locked || ta.disabled || ta.readOnly) return;
    if (cmd === 'bold') toggleInline(ta, '**');
    else if (cmd === 'italic') toggleInline(ta, '*');
    else if (cmd === 'ul' || cmd === 'ol') toggleList(ta, cmd);
    refresh();
  };

  // mousedown preventDefault keeps the textarea's selection when a button is
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
  ta.addEventListener('keydown', (ev) => {
    if (!(ev.ctrlKey || ev.metaKey) || ev.altKey || ev.shiftKey) return;
    const k = ev.key.toLowerCase();
    if (k !== 'b' && k !== 'i') return;
    if (locked) return; // plain-text plans: leave the browser default alone
    ev.preventDefault();
    run(k === 'b' ? 'bold' : 'italic');
  });
  ta.addEventListener('input', refresh);
  ta.form?.addEventListener('reset', () => setTimeout(refresh, 0));

  const setLocked = (on: boolean) => {
    locked = on;
    bar.classList.toggle('is-locked', on);
    buttons.forEach((b) => (b.disabled = on));
    pill.hidden = !on;
    preview.hidden = on;
    if (opts.lockNote) opts.lockNote.hidden = !on;
  };
  setLocked(locked);
  refresh();
  return { setLocked, refresh };
}
