-- Two-stage approval: after an admin approves a submission, the business
-- owner must also confirm their own data before it actually publishes —
-- see functions/api/confirm-listing.ts and functions/owner-confirm-listing.ts.
-- owner_confirm_token is NULL while awaiting admin review, set once the
-- admin approves (which is what actually triggers the owner-confirmation
-- email), and the row is deleted once the owner confirms or disputes.
ALTER TABLE pending_submissions ADD COLUMN owner_confirm_token TEXT;
ALTER TABLE pending_submissions ADD COLUMN admin_approved_at TEXT;

CREATE INDEX idx_pending_submissions_owner_confirm_token ON pending_submissions(owner_confirm_token);
