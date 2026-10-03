-- Health, reports and the activity log (Health, Inbox, Quality, Growth and
-- Money screens).

-- One row per site per notifier run (every 5 minutes): is the homepage up,
-- how fast, and does the site's database answer. Kept 14 days.
CREATE TABLE health_checks (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  site TEXT NOT NULL,
  ok INTEGER NOT NULL,
  status INTEGER NOT NULL,
  ms INTEGER NOT NULL,
  db_ok INTEGER NOT NULL DEFAULT 1,
  problem TEXT,
  checked_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX health_checks_site_time ON health_checks (site, checked_at);

-- The latest copy of each report (JSON): GitHub workflow runs, broken links,
-- security checks, data quality per city, ...
CREATE TABLE reports (
  kind TEXT PRIMARY KEY,
  data TEXT NOT NULL,
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- Cloudflare D1 usage per database per day (UTC, as Cloudflare counts it).
CREATE TABLE d1_usage (
  day TEXT NOT NULL,
  database TEXT NOT NULL,
  rows_read INTEGER NOT NULL DEFAULT 0,
  rows_written INTEGER NOT NULL DEFAULT 0,
  read_queries INTEGER NOT NULL DEFAULT 0,
  write_queries INTEGER NOT NULL DEFAULT 0,
  size_bytes INTEGER,
  PRIMARY KEY (day, database)
);

-- What admins did from Hub Admin (approvals, replies, bulk changes).
CREATE TABLE activity (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  actor TEXT NOT NULL,
  site TEXT,
  action TEXT NOT NULL,
  target TEXT,
  detail TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX activity_time ON activity (created_at);

-- Where to send the weekly summary email (optional, per admin).
ALTER TABLE admin_users ADD COLUMN email TEXT;
ALTER TABLE admin_users ADD COLUMN weekly_email INTEGER NOT NULL DEFAULT 0;

-- Devices that already have alerts on also get the new kinds: a site going
-- down, a failed deploy, the database nearing its daily limit and a late
-- routine (each can be turned off again in Settings).
UPDATE push_subscriptions SET types = json_insert(types, '$[#]', 'health', '$[#]', 'deploy', '$[#]', 'usage', '$[#]', 'routine');
