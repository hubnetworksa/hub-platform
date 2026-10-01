// The one place every "Sponsor this…" button points: the self-serve sponsor
// page, which picks the owner's business, checks the slot is still free and
// goes straight to PayFast. No admin step anywhere in a purchase.
export function sponsorHref(productType: string, target?: string | null): string {
  const q = new URLSearchParams({ type: productType });
  if (target) q.set('target', target);
  return `/my-businesses/sponsor/?${q.toString()}`;
}
