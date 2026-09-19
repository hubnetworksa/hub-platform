-- Organiser-submitted events (the public "List your event free" form at
-- /events/add/, see functions/api/submit-event.ts). Held here until an admin
-- approves or rejects them on the Events admin page — approving copies the
-- row into `events` (source = 'organiser') and deletes it from here, exactly
-- like pending_submissions does for businesses. Columns mirror `events`
-- (see 0035_events.sql) for the fields an organiser can supply.
CREATE TABLE event_submissions (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  token TEXT NOT NULL UNIQUE,
  title TEXT NOT NULL,
  type TEXT NOT NULL DEFAULT 'Music',
  event_date TEXT NOT NULL,
  event_time TEXT,
  venue TEXT,
  suburb TEXT,
  price TEXT NOT NULL DEFAULT 'Price TBC',
  ticket_url TEXT NOT NULL DEFAULT '#',
  host TEXT,
  image_url TEXT,
  description TEXT NOT NULL DEFAULT '',
  -- Who to contact about it (all optional, never shown publicly).
  contact_name TEXT,
  contact_email TEXT,
  contact_phone TEXT,
  submitted_by_user_id INTEGER,
  status TEXT NOT NULL DEFAULT 'pending',
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX idx_event_submissions_token ON event_submissions(token);
CREATE INDEX idx_event_submissions_status ON event_submissions(status);
