-- Lets an organiser pay to feature their event right at submission time,
-- the same way a business can pay for a tier at submission time (see
-- pending_submissions.chosen_tier/m_payment_id/payment_status and
-- submit-business.ts's inline checkout) — a real PayFast checkout, not an
-- email exchange with admin. No `events` row exists yet at submission time,
-- so this mirrors pending_submissions' shape exactly rather than touching
-- the events table. See functions/api/submit-event.ts and the
-- "event-submission:<id>" branch of functions/api/subscribe/notify.ts.
ALTER TABLE event_submissions ADD COLUMN wants_feature INTEGER NOT NULL DEFAULT 0;
ALTER TABLE event_submissions ADD COLUMN m_payment_id TEXT;
ALTER TABLE event_submissions ADD COLUMN payment_status TEXT;
