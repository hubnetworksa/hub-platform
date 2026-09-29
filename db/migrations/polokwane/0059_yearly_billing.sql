-- Yearly billing for paid plans and sponsor spots. billing_period records
-- which PayFast cycle a subscription is on ('monthly' or 'yearly'), so the
-- ITN handler knows whether a payment extends it by a month or a year and
-- the admin revenue figures can spread a yearly payment over 12 months.
-- chosen_billing_period is the same choice made at signup, copied onto the
-- tier subscription when the listing is approved. Existing rows stay monthly.
ALTER TABLE subscriptions ADD COLUMN billing_period TEXT NOT NULL DEFAULT 'monthly';
ALTER TABLE pending_submissions ADD COLUMN chosen_billing_period TEXT NOT NULL DEFAULT 'monthly';
