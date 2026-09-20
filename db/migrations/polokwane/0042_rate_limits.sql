-- One row per accepted-or-attempted submission on the public forms, keyed by a
-- hash of the visitor's IP (never the IP itself), so the endpoints can limit
-- how many a single visitor can send per hour. Old rows are pruned as it grows.
CREATE TABLE rate_limits (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  action TEXT NOT NULL,
  ip_hash TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX idx_rate_limits ON rate_limits(action, ip_hash, created_at);
