import type { APIRoute } from 'astro';
import { businesses, suburbFor, categoriesFor, shoppingCenters, businessesInShoppingCenter, priceRand } from '../lib/data';

// Build-time snapshot used by the claim page (src/pages/my-businesses/claim.astro)
// to show the chosen business's real details (category, suburb, phone, plan,
// address, hours ...) without an extra API call. Same rebuild-to-refresh
// pattern as search-index.json.
export const GET: APIRoute = () => {
  const b = businesses.map((biz) => ({
    id: biz.id,
    s: biz.slug,
    n: biz.name,
    sb: suburbFor(biz)?.name ?? '',
    c: categoriesFor(biz)[0]?.name ?? '',
    p: biz.phone ?? '',
    a: biz.address ?? '',
    w: biz.website ?? '',
    h: biz.hours ?? '',
    d: biz.description ?? '',
    t: biz.subscription_tier,
    sc: biz.shopping_center_id ?? 0,
    o: biz.owner_user_id ? 1 : 0,
  }));
  const c = shoppingCenters
    .filter((sc) => businessesInShoppingCenter(sc.id).length > 0)
    .map((sc) => ({ id: sc.id, n: sc.name }))
    .sort((x, y) => x.n.localeCompare(y.n));
  const plans = {
    0: { name: 'Basic', price: 'Free', note: 'Listed in search & your suburb' },
    1: { name: 'Verified', price: `${priceRand('price_verified_cents')}/month`, note: 'Verified badge, priority in results' },
    2: { name: 'Featured', price: `${priceRand('price_featured_cents')}/month`, note: 'Featured placement, photo gallery' },
  };
  return new Response(JSON.stringify({ b, c, plans }), {
    headers: { 'Content-Type': 'application/json' },
  });
};
