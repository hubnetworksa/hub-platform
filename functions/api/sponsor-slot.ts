import type { PagesFunction, D1Database } from '@cloudflare/workers-types';
import { isSlotTaken, isSponsorProductType, sponsorPriceCents } from '../_lib/pricing';
import { isValidSponsorTarget } from '../_lib/sponsor-targets';

interface Env {
  DB: D1Database;
  SITE: string;
}

// Live availability for one sponsorship slot, for the self-serve sponsor
// page. The static pages only know what was sold at the last rebuild; this
// is what checkout will actually accept right now.
export const onRequestGet: PagesFunction<Env> = async (context) => {
  const url = new URL(context.request.url);
  const productType = url.searchParams.get('type');
  const target = url.searchParams.get('target') || null;
  if (!isSponsorProductType(productType)) return json({ ok: false, error: 'Unknown sponsorship.' }, 400);

  const db = context.env.DB;
  const valid = await isValidSponsorTarget(db, context.env.SITE, productType, target);
  if (!valid) return json({ ok: true, valid: false, taken: false, priceCents: null, yearlyPriceCents: null });

  // priceCents is the monthly price (unchanged); yearlyPriceCents is the
  // yearly one, already falling back to monthly × 10 when not set.
  const [taken, priceCents, yearlyPriceCents] = await Promise.all([
    isSlotTaken(db, productType, target),
    sponsorPriceCents(db, productType),
    sponsorPriceCents(db, productType, 'yearly'),
  ]);
  return json({ ok: true, valid: true, taken, priceCents, yearlyPriceCents });
};

function json(data: unknown, status = 200): Response {
  return new Response(JSON.stringify(data), {
    status,
    headers: { 'Content-Type': 'application/json', 'Cache-Control': 'no-store' },
  });
}
