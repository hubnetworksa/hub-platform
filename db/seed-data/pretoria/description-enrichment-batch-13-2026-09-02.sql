-- Description enrichment, batch 13 (interactive session, round 2, per
-- owner request 2026-09-02 to push job 4 forward as fast as possible).
-- Continues the alphabetical backlog (description_enriched_at IS NULL).
-- Each business researched individually via WebSearch/WebFetch by parallel
-- research agents; "researched" ones cite what was actually found and
-- append new source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'Adlo Management Consulting is a business consulting firm based in Waverley, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'adlo-management-consulting-waverley' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'AdminOnline, a product of Jalia Technologies, is a cloud-based management system that helps small businesses and service providers such as sports coaches, arts instructors and tutors handle invoicing, communication and administration, used by over 26,000 registered families.',
  description_enriched_at = datetime('now')
WHERE slug = 'adminonline-product-of-jalia-technologies-southdowns' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Adorantha Investments (Pty) Ltd is a financial and investment services company based in Boardwalk Meander, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'adorantha-investments-pty-ltd-boardwalk-meander' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Adowa Property Developers, headquartered at Podium at Menlyn, specializes in the investment, development and management of affordable student housing communities across South Africa.',
  description_enriched_at = datetime('now')
WHERE slug = 'adowa-property-developers-midfields-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Adriaan Venter Attorneys & Associates is a boutique law firm in Menlo Park specializing in planning, development, environmental and municipal law.',
  source_urls = '["https://www.openstreetmap.org/node/6989079263", "https://avatt.co.za/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'adriaan-venter-waterkloof' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Ads Digital Advertising is a marketing and advertising agency based in Booysens, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'ads-digital-advertising-booysens' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Ads on the Go is a printing services business based in Moregloed, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'ads-on-the-go-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Adsfind is a marketing and advertising business based in Dorandia, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'adsfind-dorandia' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Adt Garsfontein is a security services provider based in Garsfontein Smallholdings, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'adt-garsfontein-garsfontein-smallholdings' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Adv. J S Gaum is a criminal defence lawyer practicing in Riviera, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'adv-j-s-gaum-criminal-defence-lawyer-riviera' AND description_enriched_at IS NULL;
