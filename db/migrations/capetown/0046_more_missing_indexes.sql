-- Same bug class as 0045's rate_limits fix: a WHERE/ORDER BY on a column
-- that isn't the leading column of any existing index forces a full table
-- scan. Found by auditing every D1 query in functions/ against the actual
-- index list. Each index below is tied to a specific hot query:

-- functions/api/enquiry.ts's per-business rate check — WHERE kind = ?
-- AND business_slug = ? AND created_at > ? — runs on every single "Send an
-- enquiry" submission, unconditionally (not the 5%-of-requests housekeeping
-- shape of the rate_limits bug — this one full-scans messages on every call).
CREATE INDEX idx_messages_kind_business_created ON messages(kind, business_slug, created_at);
-- admin/messages.ts's Enquiries tab: ORDER BY (status = 'open') DESC, created_at DESC.
CREATE INDEX idx_messages_status_created ON messages(status, created_at);

-- payments had no index at all beyond the invoice_number UNIQUE constraint,
-- despite being joined by subscription_id on every owner Billing tab
-- (update-business.ts) and admin Invoices tab (admin/payments.ts) load, and
-- sorted by paid_at on both.
CREATE INDEX idx_payments_subscription_id ON payments(subscription_id);
CREATE INDEX idx_payments_paid_at ON payments(paid_at);

-- Owner dashboards (my-businesses.ts / my-events.ts) filter on the owner
-- columns; none were indexed, so every dashboard load scanned the entire
-- businesses/events table looking for one owner's rows.
CREATE INDEX idx_businesses_owner_user_id ON businesses(owner_user_id);
CREATE INDEX idx_events_owner_user_id ON events(event_owner_user_id);

-- Same dashboards also list the signed-in user's claims — business_claims
-- and event_claims had no index on user_id.
CREATE INDEX idx_business_claims_user_id ON business_claims(user_id);
CREATE INDEX idx_event_claims_user_id ON event_claims(user_id);
-- admin/overview.ts's "pending claims" count, loaded on every admin page.
CREATE INDEX idx_business_claims_status ON business_claims(status);

-- admin/overview.ts's active-subscriptions-by-product count (every admin
-- page load) and the daily expired-sponsorship sweep both filter on status.
CREATE INDEX idx_subscriptions_status ON subscriptions(status);
-- The daily expired-tier sweep (process-expired-subscriptions.ts) scans
-- businesses for subscription_tier > 0 AND subscription_expires_at <= now.
CREATE INDEX idx_businesses_subscription_expiry ON businesses(subscription_tier, subscription_expires_at);

-- admin/users.ts's "last seen" column runs a correlated subquery against
-- sessions per user row — sessions only had an index on its lookup token,
-- not on user_id.
CREATE INDEX idx_sessions_user_id ON sessions(user_id);

-- Owner dashboards' "pending submissions" lists filter by the submitter,
-- not by the tokens already indexed.
CREATE INDEX idx_pending_submissions_email ON pending_submissions(email);
CREATE INDEX idx_event_submissions_submitted_by ON event_submissions(submitted_by_user_id);
