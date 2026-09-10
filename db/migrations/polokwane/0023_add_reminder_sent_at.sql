-- Tracks whether the 3-day owner-confirmation reminder has already gone
-- out for a pending submission, so functions/api/admin/process-owner-
-- reminders.ts sends it exactly once, then later expires the submission
-- if there's still no response — see that file for the full schedule.
ALTER TABLE pending_submissions ADD COLUMN reminder_sent_at TEXT;
