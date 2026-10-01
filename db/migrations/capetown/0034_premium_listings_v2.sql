-- Premium Listings v2: admin-editable pricing, and generalize
-- `subscriptions` to also cover exclusive sponsorship slots (category /
-- suburb / homepage banner / shopping-centre) rather than a second
-- parallel table — same PayFast checkout/ITN/cancel/expiry machinery for
-- both, distinguished by product_type/product_target. Existing rows are
-- all tier purchases, hence the DEFAULT 'tier' backfill.
ALTER TABLE subscriptions ADD COLUMN product_type TEXT NOT NULL DEFAULT 'tier';
ALTER TABLE subscriptions ADD COLUMN product_target TEXT;
CREATE INDEX idx_subscriptions_product ON subscriptions(product_type, product_target);

-- Site-editable settings (currently just pricing) — the admin "Plans &
-- pricing" page reads/writes these; every checkout computes its charge
-- from here server-side, never from client input. Cents to avoid float
-- rounding on money.
CREATE TABLE site_settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);
INSERT INTO site_settings (key, value) VALUES
  ('price_verified_cents', '14900'),
  ('price_featured_cents', '39900'),
  ('price_sponsor_category_cents', '95000'),
  ('price_sponsor_suburb_cents', '65000'),
  ('price_sponsor_banner_cents', '240000'),
  ('price_sponsor_centre_cents', '120000');

-- Submission-time checkout: a paid tier can be chosen before the listing
-- is even approved (see functions/api/subscribe/start.ts's
-- submission-scoped path, and business-submission.ts's
-- insertApprovedBusiness, which is where the tier actually gets applied
-- once the business row finally exists — either the no-email immediate
-- publish in confirm-listing.ts, or the owner-confirmed publish in
-- owner-confirm-listing.ts).
ALTER TABLE pending_submissions ADD COLUMN chosen_tier INTEGER NOT NULL DEFAULT 0;
ALTER TABLE pending_submissions ADD COLUMN m_payment_id TEXT;
ALTER TABLE pending_submissions ADD COLUMN payment_status TEXT;

