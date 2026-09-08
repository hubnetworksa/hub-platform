-- Self-listing submissions now hold here until manually verified via the
-- emailed approve/reject link, rather than publishing straight to
-- `businesses` — see functions/api/submit-business.ts and
-- functions/api/confirm-listing.ts. Separate table (not a businesses.status
-- value) so this doesn't touch the automated-routine's publish/reject
-- contract on the businesses table at all.

CREATE TABLE pending_submissions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  token TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  category_slug TEXT NOT NULL,
  suburb_slug TEXT NOT NULL,
  address TEXT,
  phone TEXT,
  email TEXT,
  website TEXT,
  description TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX idx_pending_submissions_token ON pending_submissions(token);
