-- Payments hardening (see functions/api/subscribe/notify.ts + start.ts).
--
-- payfast_token on pending_submissions: a signup-tier checkout pays before
-- any `businesses` row exists, so the recurring-billing token that came
-- back on the ITN had nowhere to live and the resulting subscription could
-- never be cancelled. Stored here at ITN time and carried into the
-- `subscriptions` row when the submission is approved+confirmed.
ALTER TABLE pending_submissions ADD COLUMN payfast_token TEXT;

-- What the event submission was actually quoted at checkout, plus the raw
-- ITN body, so the webhook validates against the quoted price rather than
-- whatever the live price happens to be when the ITN lands.
ALTER TABLE event_submissions ADD COLUMN amount_cents INTEGER;
ALTER TABLE event_submissions ADD COLUMN raw_itn TEXT;

-- PayFast retries an ITN until it gets a 200, so the same payment can land
-- more than once. This makes the duplicate insert a no-op at the database
-- level (INSERT OR IGNORE in notify.ts) rather than a second payment row
-- and a second invoice. SQLite allows multiple NULLs in a unique index, so
-- rows without a pf_payment_id are unaffected.
CREATE UNIQUE INDEX idx_payments_pf_payment_id ON payments(pf_payment_id);

-- Rate-card entries the admin pricing editor already accepts but that had
-- no row to edit. Placeholder amounts — the public pricing page already
-- says prices are placeholders.
INSERT OR IGNORE INTO site_settings (key, value) VALUES
  ('price_sponsor_guide_cents','75000'),
  ('price_ad_search_cents','45000'),
  ('price_ad_profile_cents','35000');
