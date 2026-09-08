-- Tracks whether a business's description has been rewritten with real,
-- individual research (vs. the generic bulk-import template, e.g. "X is a
-- business in Y, part of the Z area of the Pretoria/Tshwane metro."). NULL
-- means still generic/original; a timestamp means it's been personalized.
-- Drives the routine's new description-enrichment job (see ROUTINE.md).
ALTER TABLE businesses ADD COLUMN description_enriched_at TEXT;

-- Businesses added via the routine's own research (origin = 'agent_research')
-- already carry an individually-written description (see ROUTINE.md's
-- INSERT template), not the generic seed-import template, so they don't
-- need to go through the enrichment queue -- backfilled as already done.
UPDATE businesses SET description_enriched_at = created_at WHERE origin = 'agent_research';
