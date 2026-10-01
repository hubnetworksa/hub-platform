-- The cloud description-enrichment routine (job 4) is switched off: it once
-- replaced a paying owner's own description with a generic one-liner
-- (Polokwane business 1418, 1 Oct 2026). Its prompts live in another account,
-- so the block has to live here, in three layers:
--   1. scripts/routines/next.mjs never hands out enrichment work,
--   2. scripts/routines/validate.mjs rejects any routine SQL that sets
--      description or description_enriched_at on businesses,
--   3. this trigger, for SQL that slips past both.
--
-- Every enrichment write stamps description_enriched_at; nothing else does.
-- The owner dashboard (functions/api/update-business.ts) and the admin editor
-- (functions/api/admin/listings.ts) change description without touching that
-- column, so they are unaffected. Any UPDATE that changes
-- description_enriched_at is dropped whole (RAISE(IGNORE) skips the row
-- silently, so the rest of a routine file still applies). New businesses
-- (INSERTs from discovery or submissions) are not affected.
CREATE TRIGGER IF NOT EXISTS block_routine_description_enrichment
BEFORE UPDATE OF description_enriched_at ON businesses
WHEN NEW.description_enriched_at IS NOT OLD.description_enriched_at
BEGIN
  SELECT RAISE(IGNORE);
END;
