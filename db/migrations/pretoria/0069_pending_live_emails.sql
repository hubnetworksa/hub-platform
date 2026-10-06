-- Owner "you're live" emails are queued here instead of being sent the
-- moment the owner confirms (functions/api/owner-confirm-listing.ts), since
-- at that point the site hasn't rebuilt yet and the listing isn't actually
-- live. functions/api/admin/send-live-emails.ts drains this queue, called
-- from deploy.yml only after this site's own build+deploy step has
-- succeeded, so the email is never sent before the listing really is live.
CREATE TABLE pending_live_emails (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  business_name TEXT NOT NULL,
  owner_email TEXT NOT NULL,
  listing_url TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
