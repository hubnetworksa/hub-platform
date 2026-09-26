import type { APIRoute } from 'astro';
import { businesses, suburbFor, categoriesFor } from '../lib/data';
import { groupForCategory } from '../lib/categoryGroups';
import { synonymsFor, locationSynonymsFor } from '../lib/categorySynonyms';
import site from '../site';

export const GET: APIRoute = () => {
  const index = businesses.map((b) => {
    const cat = categoriesFor(b)[0];
    return {
      n: b.name,
      s: b.slug,
      sb: suburbFor(b)?.name ?? '',
      c: cat?.name ?? '',
      g: cat ? groupForCategory(cat.slug)?.iconPath ?? '' : '',
      // Informal/trade-jargon search terms for this business's category
      // (e.g. "junk removal" for Rubbish & Rubble Removal), plus this
      // site's own city-qualified variants (e.g. "polokwane accommodation")
      // — lets someone typing what they actually call the service still
      // find it, even though that word appears nowhere in the business's
      // own name or formal category label. See src/lib/categorySynonyms.ts.
      k: cat ? [...synonymsFor(cat.slug), ...locationSynonymsFor(cat.name, site.cityLabel)].join(' ') : '',
      // Featured (3) / Premium (4) get a small on-site search boost — see
      // the Premium Listings plan. Only applied among rows that already
      // matched the query; never lets an irrelevant result outrank a
      // relevant free listing.
      t: b.subscription_status === 'active' ? b.subscription_tier : 0,
    };
  });
  return new Response(JSON.stringify(index), {
    headers: { 'Content-Type': 'application/json' },
  });
};
