-- Event ownership: mirrors how businesses work — an event submitted while
-- logged in (or claimed afterward) gets a real owner who can edit it once
-- admin approves, and can pay to feature it. Featuring is a single payment
-- (event_payments), not a subscriptions row, because an event has a fixed
-- date and doesn't recur the way a business's monthly plan does.
ALTER TABLE events ADD COLUMN event_owner_user_id INTEGER;

CREATE TABLE event_claims (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  event_id INTEGER NOT NULL REFERENCES events(id),
  user_id INTEGER NOT NULL REFERENCES users(id),
  status TEXT NOT NULL DEFAULT 'pending', -- pending | approved | rejected
  contact_name TEXT,
  contact_phone TEXT,
  contact_email TEXT,
  role_note TEXT,
  review_token TEXT,
  reviewed_at TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX idx_event_claims_event_id ON event_claims(event_id);
CREATE INDEX idx_event_claims_review_token ON event_claims(review_token);

CREATE TABLE event_payments (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  event_id INTEGER NOT NULL REFERENCES events(id),
  m_payment_id TEXT NOT NULL,
  amount_cents INTEGER NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending', -- pending | complete
  raw_itn TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  paid_at TEXT
);
CREATE INDEX idx_event_payments_event_id ON event_payments(event_id);
CREATE INDEX idx_event_payments_m_payment_id ON event_payments(m_payment_id);
