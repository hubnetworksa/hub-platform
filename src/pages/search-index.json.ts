import type { APIRoute } from 'astro';
import { businesses, suburbFor, categoriesFor, websiteUrl } from '../lib/data';
import { groupForCategory } from '../lib/categoryGroups';
import { synonymsFor, locationSynonymsFor } from '../lib/categorySynonyms';
import site from '../site';

export const GET: APIRoute = () => {
  const index = businesses.map((b) => {
    const cat = categoriesFor(b)[0];
    const suburb = suburbFor(b);
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
      p: b.phone ?? '',
      w: websiteUrl(b.website) ?? '',
      a: b.address ?? '',
      d: b.description ?? '',
    };
  });
  return new Response(JSON.stringify(index), {
    headers: { 'Content-Type': 'application/json' },
  });
};
