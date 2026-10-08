-- Sales rep / referral programme. One rep per account, per hub (per-city DB).
CREATE TABLE sales_reps (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL UNIQUE REFERENCES users(id),
  code TEXT NOT NULL UNIQUE,
  status TEXT NOT NULL DEFAULT 'active' CHECK (status IN ('active','suspended')),
  display_name TEXT,
  bank_name TEXT,
  bank_account_holder TEXT,
  bank_account_number TEXT,
  bank_branch_code TEXT,
  bank_account_type TEXT,
  bank_consent_at TEXT,
  suspended_at TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE rep_payouts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  rep_id INTEGER NOT NULL REFERENCES sales_reps(id),
  period TEXT NOT NULL,
  total_cents INTEGER NOT NULL,
  reference TEXT,
  paid_by TEXT,
  paid_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX idx_rep_payouts_rep ON rep_payouts(rep_id);

-- One row per first payment that carried a rep code. Written only by
-- subscribe/notify.ts (ITN COMPLETE); renewals never add a row.
CREATE TABLE rep_commissions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  rep_id INTEGER NOT NULL REFERENCES sales_reps(id),
  rep_code TEXT NOT NULL,
  source_type TEXT NOT NULL CHECK (source_type IN ('subscription','pending_submission')),
  source_id INTEGER NOT NULL,
  client_name TEXT NOT NULL,
  product_label TEXT NOT NULL,
  sale_amount_cents INTEGER NOT NULL,
  commission_cents INTEGER NOT NULL,
  status TEXT NOT NULL DEFAULT 'approved' CHECK (status IN ('pending','approved','paid','void')),
  payout_id INTEGER REFERENCES rep_payouts(id),
  void_reason TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  approved_at TEXT,
  paid_at TEXT,
  UNIQUE(source_type, source_id)
);
CREATE INDEX idx_rep_commissions_rep_status ON rep_commissions(rep_id, status);

ALTER TABLE subscriptions ADD COLUMN rep_code TEXT;
ALTER TABLE pending_submissions ADD COLUMN rep_code TEXT;
