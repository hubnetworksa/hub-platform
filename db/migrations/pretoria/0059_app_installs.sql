-- Anonymous installed-app counter behind the admin dashboard's "App installs"
-- tiles (functions/api/app-event.ts). device_id is a random id the phone
-- generates for itself; no IP address or user id is stored.
CREATE TABLE IF NOT EXISTS app_events (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  event TEXT NOT NULL CHECK (event IN ('install','open')),
  device_id TEXT NOT NULL,
  platform TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_app_events_event_created ON app_events (event, created_at);
CREATE INDEX IF NOT EXISTS idx_app_events_device_event ON app_events (device_id, event);
