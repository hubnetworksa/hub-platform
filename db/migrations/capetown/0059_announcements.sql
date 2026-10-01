-- One-off service announcements (the relaunch email) and the POPIA opt-out
-- that must accompany them.
--
-- users.email_opt_out: 1 once the person clicks "Unsubscribe from updates"
-- in an announcement. Only service announcements honour it — account and
-- billing emails (password resets, invoices, listing confirmations) are
-- transactional and keep going regardless.
-- users.unsubscribe_token: the per-user secret in that unsubscribe link,
-- minted lazily the first time an announcement is sent to them
-- (functions/api/admin/send-announcement.ts) and looked up by
-- functions/api/unsubscribe.ts. NULL until then.
-- announcement_sends: one row per (user, campaign) so a campaign can be
-- re-run safely after a partial failure without emailing anyone twice.
ALTER TABLE users ADD COLUMN email_opt_out INTEGER NOT NULL DEFAULT 0;
ALTER TABLE users ADD COLUMN unsubscribe_token TEXT;
CREATE UNIQUE INDEX idx_users_unsubscribe_token ON users(unsubscribe_token);
CREATE TABLE announcement_sends (
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  campaign TEXT NOT NULL,
  sent_at TEXT NOT NULL DEFAULT (datetime('now')),
  PRIMARY KEY (user_id, campaign)
);
