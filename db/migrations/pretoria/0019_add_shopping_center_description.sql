-- Short editorial description per shopping centre / mall, shown on its page
-- (src/pages/shopping-center/[slug].astro). Hand-written, not routine-managed
-- — the research routine only ever adds centres and links tenants, it does
-- not touch this column.
--
-- Backported from Polokwane during the multi-site consolidation (2026-09-08)
-- — Pretoria's schema had drifted one migration behind; this brings it back
-- in line with what src/lib/data.ts and scripts/fetch-d1-data.mjs expect from
-- every site's shopping_centers table.
ALTER TABLE shopping_centers ADD COLUMN description TEXT;
