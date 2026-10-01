-- Messages sent through the website itself (never via the visitor's mail app):
-- the /contact/ form and the "Send an enquiry" form on a business page. The
-- row is the source of truth (shown on the admin Enquiries tab); the email to
-- the site or business is best-effort on top of it.
CREATE TABLE messages (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  kind TEXT NOT NULL CHECK (kind IN ('contact', 'enquiry')),
  name TEXT,
  contact TEXT NOT NULL,
  topic TEXT,
  message TEXT NOT NULL,
  business_slug TEXT,
  business_name TEXT,
  ip_hash TEXT,
  emailed INTEGER NOT NULL DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'open' CHECK (status IN ('open', 'resolved')),
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  resolved_at TEXT
);
CREATE INDEX idx_messages_status ON messages(status);
CREATE INDEX idx_messages_ip ON messages(ip_hash, created_at);
