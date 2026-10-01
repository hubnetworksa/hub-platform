// South African phone display formatting, shared by the Astro site and Pages
// Functions. Formatting is applied at display time (and to new input on save);
// anything that doesn't parse as an SA number is returned trimmed and unchanged.

const SPLIT_RE = /\s*(?:\/|,|;|\||\s+or\s+)\s*/i;
const EXT_RE = /\s*((?:ext\.?|extension|x)\s*\d+)\s*$/i;
const SHARECALL = ['0800', '0860', '0861', '0862'];

interface Parsed { national: string; ext: string }

function parseOne(part: string): Parsed | null {
  let s = part.trim();
  let ext = '';
  const m = s.match(EXT_RE);
  if (m && m.index !== undefined) { ext = m[1].trim(); s = s.slice(0, m.index).trim(); }
  if (!s || /[^\d\s+().\-]/.test(s)) return null;
  let digits = s.replace(/[^\d+]/g, '');
  const plus = digits.startsWith('+');
  digits = digits.replace(/\+/g, '');
  if (plus || digits.startsWith('00')) {
    if (digits.startsWith('0027')) digits = digits.slice(4);
    else if (plus && digits.startsWith('27')) digits = digits.slice(2);
    else return null;
    if (digits.length !== 9) return null;
    digits = '0' + digits;
  } else if (digits.startsWith('27') && digits.length === 11) {
    digits = '0' + digits.slice(2);
  }
  if (digits.length !== 10 || digits[0] !== '0' || digits[1] === '0') return null;
  return { national: digits, ext };
}

function splitNumbers(text: string): string[] {
  return text.split(SPLIT_RE).filter((p) => p.trim());
}

function formatNational(d: string): string {
  return SHARECALL.includes(d.slice(0, 4))
    ? `${d.slice(0, 4)} ${d.slice(4, 7)} ${d.slice(7)}`
    : `${d.slice(0, 3)} ${d.slice(3, 6)} ${d.slice(6)}`;
}

/** Format a raw phone value as `012 345 6789` (multiple numbers joined with ` / `). */
export function formatPhoneZA(raw: string | null | undefined): string {
  const text = (raw ?? '').trim();
  if (!text) return '';
  const out: string[] = [];
  for (const p of splitNumbers(text)) {
    const parsed = parseOne(p);
    if (!parsed) return text;
    out.push(formatNational(parsed.national) + (parsed.ext ? ` ${parsed.ext}` : ''));
  }
  return out.join(' / ');
}

/** International schema.org-style form of the first number, e.g. `+27 12 345 6789`; original text when unparseable. */
export function phoneInternationalZA(raw: string | null | undefined): string {
  const text = (raw ?? '').trim();
  const parsed = parseOne(splitNumbers(text)[0] ?? '');
  if (!parsed) return text;
  const d = parsed.national.slice(1);
  return SHARECALL.includes(parsed.national.slice(0, 4))
    ? `+27 ${d.slice(0, 3)} ${d.slice(3, 6)} ${d.slice(6)}`
    : `+27 ${d.slice(0, 2)} ${d.slice(2, 5)} ${d.slice(5)}`;
}

/** `tel:` href for the first number: `tel:+27…` when it parses, otherwise the digits as typed. */
export function phoneHref(raw: string | null | undefined): string {
  const first = splitNumbers((raw ?? '').trim())[0] ?? '';
  const parsed = parseOne(first);
  if (parsed) return `tel:+27${parsed.national.slice(1)}`;
  return `tel:${first.replace(EXT_RE, '').replace(/[^\d+*#]/g, '').replace(/#/g, '%23')}`;
}

/** WhatsApp only works on a mobile number: 06x, 07x or 08x, except the
 *  non-mobile 080x (toll-free) and 086x (sharecall/fax) ranges. */
function isMobileNational(d: string): boolean {
  return /^0[67]\d{8}$/.test(d) || /^08[1-57-9]\d{7}$/.test(d);
}

/** wa.me digits (`27821234567`) when the value is exactly one SA mobile number
 *  (0821234567, 082 123 4567, +27 82 123 4567, 0027…), otherwise null. */
export function whatsappDigitsZA(raw: string | null | undefined): string | null {
  const text = (raw ?? '').trim();
  if (!text || splitNumbers(text).length !== 1) return null;
  const parsed = parseOne(text);
  if (!parsed || parsed.ext || !isMobileNational(parsed.national)) return null;
  return '27' + parsed.national.slice(1);
}
