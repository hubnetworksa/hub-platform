// Shared by to-sql.mjs and owner-sql.mjs: the text rules and the SQL guard, so
// researched and owner-written descriptions are held to exactly the same bar.
export const words = (t) => (t.match(/[A-Za-z0-9'’&-]+/g) ?? []).length;
export const FILLER = /\b(one[- ]stop[- ]shop|look no further|best in (town|the city|pretoria|polokwane|cape town)|second to none|unbeatable|world[- ]class|top[- ]notch|your go-to)\b/i;
export const PHONE = /(\+27|\b0\d{2})[\s-]?\d{3}[\s-]?\d{4}\b/;
export const EMAIL = /[^\s@]+@[^\s@]+\.[a-z]{2,}/i;
export const LINK = /(https?:\/\/|www\.|\b[a-z0-9-]+\.(co\.za|com|org\.za|net)\b)/i;

export const q = (s) => `'${String(s).replace(/'/g, "''")}'`;

// Owned, claimed, paid, owner-submitted, photographed or hand-built listings
// never change; a listing is upgraded once, and only while its text is short.
// The text-unchanged condition (description = the batch file's
// current_description) matters because admin edits made through the Edit modal
// don't stamp description_enriched_at, so without it a hand-written rewrite made
// after the batch was prepared would be overwritten by this update.
export const buildGuard = (slug, currentDescription) => {
  const sameText = currentDescription == null || String(currentDescription) === ''
    ? `COALESCE(description, '') = ''` : `description = ${q(currentDescription)}`;
  return `slug = ${q(slug)} AND ${sameText} AND description_enriched_at IS NULL AND length(COALESCE(description, '')) < 700
  AND owner_user_id IS NULL AND COALESCE(subscription_tier, 0) = 0 AND COALESCE(origin, '') != 'owner_submitted'
  AND status = 'published' AND closed_at IS NULL AND is_test = 0
  AND custom_blocks IS NULL AND page_html IS NULL
  AND NOT EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = businesses.id)
  AND NOT EXISTS (SELECT 1 FROM business_photos p WHERE p.business_id = businesses.id)`;
};

// Text checks shared by researched and owner descriptions. Returns messages.
export const textErrors = (at, d) => {
  const errors = [];
  const w = words(d);
  if (w < 100) errors.push(`${at}: only ${w} words: it needs 100-250 (aim for 110-150)`);
  if (w > 250) errors.push(`${at}: ${w} words: trim it to 110-150 words`);
  if (d.length > 1500) errors.push(`${at}: ${d.length} characters (the site's limit is 1,500)`);
  if (PHONE.test(d)) errors.push(`${at}: phone number in the text`);
  if (EMAIL.test(d)) errors.push(`${at}: email address in the text`);
  if (LINK.test(d)) errors.push(`${at}: link in the text`);
  if (FILLER.test(d)) errors.push(`${at}: sales filler ("${d.match(FILLER)[0]}")`);
  if (/[<>]/.test(d)) errors.push(`${at}: no HTML in the text`);
  return errors;
};

// A sentence that's mostly a trading-hours statement (day names + times) is a
// real, sourced fact, not templated filler, even when several businesses
// genuinely share the same hours — so it's exempt from the repeat check.
const HOURS_SENTENCE = /\b(mon|tue|wed|thu|fri|sat|sun)[a-z]*\b.{0,40}\b\d{1,2}([:.]\d{2})?\s*(am|pm)?\b.{0,20}\b\d{1,2}([:.]\d{2})?\s*(am|pm)?\b|\b24\s*hours?\b|\bopen\b.{0,10}\bdaily\b/i;

// The same sentence in 3+ descriptions is templated filler.
export const repeatedSentenceErrors = (items) => {
  const sentences = new Map();
  for (const it of items) {
    const mine = new Set();
    for (const raw of String(it?.description ?? '').split(/(?<=[.!?])\s+/)) {
      if (HOURS_SENTENCE.test(raw)) continue;
      const n = raw.toLowerCase().replace(/[^a-z0-9 ]+/g, ' ').replace(/\s+/g, ' ').trim();
      if (n.split(' ').length < 4 || mine.has(n)) continue;
      mine.add(n);
      if (!sentences.has(n)) sentences.set(n, { text: raw.trim(), slugs: [] });
      sentences.get(n).slugs.push(it.slug);
    }
  }
  return [...sentences.values()].filter((s) => s.slugs.length >= 3)
    .map(({ text, slugs }) => `templated filler, remove it: "${text}" appears in ${slugs.length} descriptions (${slugs.join(', ')})`);
};
