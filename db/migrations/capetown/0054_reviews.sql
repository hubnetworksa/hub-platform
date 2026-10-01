-- First-party star rating + written review per business. A visitor must be
-- logged in to leave one (see functions/api/review.ts) — UNIQUE(business_id,
-- user_id) is what actually enforces "one review per account per business",
-- not just app-level logic. status starts 'pending' and only ever becomes
-- public (see scripts/fetch-d1-data.mjs's reviews query) once an admin sets
-- it to 'approved' via functions/api/admin/reviews.ts — same pending ->
-- approved/rejected convention as business_claims, not the messages
-- open/resolved one, since this needs a genuine pre-publish gate.
-- flagged/flagged_reason let the owner (functions/api/flag-review.ts) send a
-- review to the moderation queue without being able to remove it themselves
-- — only admin action changes status. owner_reply/owner_reply_at are the
-- owner's one public right of reply (functions/api/review-reply.ts).
CREATE TABLE reviews (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  business_id INTEGER NOT NULL REFERENCES businesses(id) ON DELETE CASCADE,
  user_id INTEGER NOT NULL REFERENCES users(id),
  rating INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
  author_name TEXT NOT NULL,
  comment TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected')),
  flagged INTEGER NOT NULL DEFAULT 0,
  flagged_reason TEXT,
  owner_reply TEXT,
  owner_reply_at TEXT,
  created_at TEXT NOT NULL DEFAULT (datetime('now')),
  reviewed_at TEXT,
  UNIQUE (business_id, user_id)
);
CREATE INDEX idx_reviews_business_status ON reviews(business_id, status, created_at);
CREATE INDEX idx_reviews_moderation ON reviews(status, flagged, created_at);
