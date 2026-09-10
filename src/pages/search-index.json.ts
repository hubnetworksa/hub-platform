import type { APIRoute } from 'astro';
import { businesses, suburbFor, categoriesFor } from '../lib/data';
import { groupForCategory } from '../lib/categoryGroups';

export const GET: APIRoute = () => {
  const index = businesses.map((b) => {
    const cat = categoriesFor(b)[0];
    return {
      n: b.name,
      s: b.slug,
      sb: suburbFor(b)?.name ?? '',
      c: cat?.name ?? '',
      g: cat ? groupForCategory(cat.slug)?.iconPath ?? '' : '',
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
