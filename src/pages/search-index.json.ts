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
    };
  });
  return new Response(JSON.stringify(index), {
    headers: { 'Content-Type': 'application/json' },
  });
};
