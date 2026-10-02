import type { APIRoute } from 'astro';
import { businesses, suburbFor, categoriesFor, websiteUrl, logoFor, whatsappFor, groupForCategory } from '../lib/data';
import { synonymsFor, locationSynonymsFor } from '../lib/categorySynonyms';
import { formatPhoneZA } from '../lib/phone';
import { plainLine } from '../lib/rich-text';
import site from '../site';

export const GET: APIRoute = () => {
  const index = businesses.map((b) => {
    const cat = categoriesFor(b)[0];
    const suburb = suburbFor(b);
    const logo = logoFor(b);
    const wa = whatsappFor(b);
    return {
      n: b.name,
      s: b.slug,
      sb: suburb?.name ?? '',
      sbs: suburb?.slug ?? '',
      c: cat?.name ?? '',
      g: cat ? groupForCategory(cat.slug)?.iconPath ?? '' : '',
      // Informal/trade-jargon search terms for this business's category
      // (e.g. "junk removal" for Rubbish & Rubble Removal), plus this
      // site's own city-qualified variants (e.g. "polokwane accommodation")
      // — lets someone typing what they actually call the service still
      // find it, even though that word appears nowhere in the business's
      // own name or formal category label. See src/lib/categorySynonyms.ts.
      k: cat ? [...synonymsFor(cat.slug), ...locationSynonymsFor(cat.name, site.cityLabel)].join(' ') : '',
      t: b.subscription_tier,
      h: Boolean(b.hours),
      // Raw trading-hours text, for the client-side "Open now" filter and
      // badge (src/lib/openNow.ts parses it; unparseable text just means
      // "unknown"). Empty for the vast majority of listings.
      hr: b.hours ?? '',
      // Only the pinned (top Featured) result renders these — see
      // renderRow(r, pinned=true) in search.astro — so they're worth the
      // extra bytes despite not being used by every row.
      p: formatPhoneZA(b.phone),
      w: websiteUrl(b.website) ?? '',
      a: b.address ?? '',
      // Markers stripped — the formatted version is only on the business page.
      d: plainLine(b.description),
      // The owner's short description (cards, search rows), only when written —
      // at most 160 characters, and absent for nearly every row.
      ...(b.short_description ? { sd: plainLine(b.short_description) } : {}),
      // Logo URL — only on paid listings that have one (see logoFor), so
      // the key is simply absent for nearly every row.
      ...(logo ? { l: logo } : {}),
      // WhatsApp chat link (wa.me) — only on paid-up Featured listings with a
      // number (see whatsappFor), for the pinned card's WhatsApp button.
      ...(wa ? { wa } : {}),
    };
  });
  return new Response(JSON.stringify(index), {
    headers: { 'Content-Type': 'application/json' },
  });
};
