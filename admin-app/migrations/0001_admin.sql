-- Hub Admin's own database (hub-admin-db): data that belongs to the admin
-- app rather than to any one city.

-- Small key/value store: the Web Push (VAPID) key pair, generated on first
-- use, and the notifier's "seen up to" marks per site and queue type.
CREATE TABLE settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TEXT NOT NULL DEFAULT (datetime('now'))
);

-- One row per device that turned notifications on.
CREATE TABLE push_subscriptions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  endpoint TEXT NOT NULL UNIQUE,
  p256dh TEXT NOT NULL,
  auth TEXT NOT NULL,
  email TEXT NOT NULL,
  label TEXT,
  -- JSON array of queue types this device wants, e.g. ["submission","claim"]
  types TEXT NOT NULL DEFAULT '["submission","claim","report","message","review","event","event-claim"]',
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  last_sent_at TEXT,
  fail_count INTEGER NOT NULL DEFAULT 0
);

-- What was announced, so a device can read what its last push was about and
-- the Alerts screen can show recent history.
CREATE TABLE notifications (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  url TEXT NOT NULL DEFAULT '/#/',
  -- JSON array of the queue types this notification covers
  types TEXT NOT NULL DEFAULT '[]',
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX idx_notifications_created ON notifications (created_at);

-- Upgrades to build on the sites.
CREATE TABLE upgrades (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  title TEXT NOT NULL,
  details TEXT NOT NULL DEFAULT '',
  -- JSON array of site slugs, or ["all"]
  sites TEXT NOT NULL DEFAULT '["all"]',
  priority TEXT NOT NULL DEFAULT 'normal' CHECK (priority IN ('low', 'normal', 'high', 'urgent')),
  status TEXT NOT NULL DEFAULT 'idea' CHECK (status IN ('idea', 'planned', 'in_progress', 'done')),
  created_by TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  updated_at TEXT NOT NULL DEFAULT (datetime('now')),
  done_at TEXT
);
CREATE INDEX idx_upgrades_status ON upgrades (status, priority);
