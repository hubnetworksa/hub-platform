-- Premium Listings: the subscription-tier ladder (see the plan doc).
-- Tier is a plain int cached on businesses for fast reads on every page
-- render; `subscriptions` is the actual billing record (PayFast token,
-- period), kept separate so re-subscribing/upgrading never has to touch
-- historical rows. 0 = Free throughout.
ALTER TABLE businesses ADD COLUMN subscription_tier INTEGER NOT NULL DEFAULT 0;
ALTER TABLE businesses ADD COLUMN subscription_status TEXT;
ALTER TABLE businesses ADD COLUMN subscription_expires_at TEXT;

CREATE TABLE subscriptions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  business_id INTEGER NOT NULL REFERENCES businesses(id),
  tier INTEGER NOT NULL,
  payfast_token TEXT,
  m_payment_id TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending', -- pending | active | cancelled
  started_at TEXT,
  current_period_end TEXT,
  cancelled_at TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX idx_subscriptions_business_id ON subscriptions(business_id);
CREATE INDEX idx_subscriptions_payfast_token ON subscriptions(payfast_token);
CREATE INDEX idx_subscriptions_m_payment_id ON subscriptions(m_payment_id);

-- One row per PayFast ITN actually received, for reconciliation — the
-- source of truth is always this table, `businesses.subscription_tier` is
-- just a fast-read cache derived from it.
CREATE TABLE payments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  subscription_id INTEGER NOT NULL REFERENCES subscriptions(id),
  pf_payment_id TEXT,
  amount_cents INTEGER NOT NULL,
  status TEXT NOT NULL,
  raw_itn TEXT,
  paid_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE business_photos (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  business_id INTEGER NOT NULL REFERENCES businesses(id),
  r2_key TEXT NOT NULL,
  sort_order INTEGER NOT NULL DEFAULT 0,
  caption TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX idx_business_photos_business_id ON business_photos(business_id);
