// Build-time plan list for the "Add your business" flow (step 1 picker,
// step 3 "Your plan" card, checkout summary). Prices come from the same
// site_settings snapshot the pricing page uses — never hardcoded. Only ever
// imported from .astro frontmatter (it pulls in the full data snapshot); the
// client scripts get this list serialised into a data- attribute instead.
import { priceRand } from './data';

export interface FlowPlan {
  tier: 0 | 1 | 2;
  name: string;
  /** Short price as shown on the step-1 cards, e.g. "Free" or "R149/mo". */
  price: string;
  /** Bare price for summary lines, e.g. "R149" — empty for the free plan. */
  amount: string;
  /** Step-1 card blurb (mockup copy). */
  note: string;
  /** Step-3 "Your plan" one-liner. */
  summary: string;
}

export function getFlowPlans(): FlowPlan[] {
  // priceRand can return "R399.00"; the mockup shows whole rand ("R399").
  const whole = (v: string) => v.replace(/\.00$/, '');
  const verified = whole(priceRand('price_verified_cents'));
  const featured = whole(priceRand('price_featured_cents'));
  return [
    {
      tier: 0,
      name: 'Basic',
      price: 'Free',
      amount: '',
      note: 'Name, category, phone, hours',
      summary: 'Name, category, phone, hours',
    },
    {
      tier: 1,
      name: 'Verified',
      price: `${verified}/mo`,
      amount: verified,
      note: 'Badge, website link, photos, enquiries',
      summary: 'Badge, website link, photos, enquiries',
    },
    {
      tier: 2,
      name: 'Featured',
      price: `${featured}/mo`,
      amount: featured,
      note: 'Top of your category and suburb',
      summary: 'Top of your category and suburb, photos, enquiry form',
    },
  ];
}
