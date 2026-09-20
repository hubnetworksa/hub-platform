-- A claim on a business that has an email on file is verified by a link sent to
-- THAT address (not the claimant's). verify_token is the single-use secret in
-- the link, verify_sent_to records where it went, email_verified_at is set when
-- someone at that address confirmed the claim.
ALTER TABLE business_claims ADD COLUMN verify_token TEXT;
ALTER TABLE business_claims ADD COLUMN verify_sent_to TEXT;
ALTER TABLE business_claims ADD COLUMN email_verified_at TEXT;
CREATE INDEX idx_business_claims_verify_token ON business_claims(verify_token);
