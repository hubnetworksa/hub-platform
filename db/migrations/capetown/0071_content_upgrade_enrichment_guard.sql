-- Content upgrade (CONTENT-UPGRADE-PLAN.md, content-upgrade/README.md):
--   1. clears every description_enriched_at, so the upgrade can stamp each
--      listing again as it writes its new description;
--   2. narrows the 1 Oct 2026 block (block_routine_description_rewrites) so
--      that stamp is refused, silently, only for listings that belong to
--      someone: an owner, a paid plan or any subscription, an owner
--      submission, or any claim (pending, approved or rejected). Those are the
--      listings the original incident was about (a paying owner's own text).
-- Owner and admin edits don't touch description_enriched_at, so they are
-- unaffected, as before.
DROP TRIGGER IF EXISTS block_routine_description_enrichment;
UPDATE businesses SET description_enriched_at = NULL WHERE description_enriched_at IS NOT NULL;
CREATE TRIGGER block_routine_description_enrichment
BEFORE UPDATE OF description_enriched_at ON businesses
WHEN NEW.description_enriched_at IS NOT OLD.description_enriched_at
  AND (
    OLD.owner_user_id IS NOT NULL
    OR COALESCE(OLD.subscription_tier, 0) >= 1
    OR COALESCE(OLD.origin, '') = 'owner_submitted'
    OR EXISTS (SELECT 1 FROM business_claims c WHERE c.business_id = OLD.id)
    OR EXISTS (SELECT 1 FROM subscriptions s WHERE s.business_id = OLD.id)
  )
BEGIN
  SELECT RAISE(IGNORE);
END;
