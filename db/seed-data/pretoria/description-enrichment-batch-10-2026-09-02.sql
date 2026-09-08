-- Description enrichment, batch 10 (interactive session, round 2, per
-- owner request 2026-09-02 to push job 4 forward as fast as possible).
-- Continues the alphabetical backlog (description_enriched_at IS NULL).
-- Each business researched individually via WebSearch/WebFetch by parallel
-- research agents; "researched" ones cite what was actually found and
-- append new source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'Acorn Fasteners has supplied bolts, nuts, rivets and other fastener hardware from Hennopspark since 1995, stocking over 18,000 products and delivering across Gauteng.',
  description_enriched_at = datetime('now')
WHERE slug = 'acorn-fasteners-pty-ltd-hennopspark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'AcquireIT is a business consulting firm based in Raslouw, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'acquireit-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Acrivon operates as a management consultancy from Centurion Central, offering research, training and consultancy services to businesses.',
  source_urls = '["scraped:google-places-no-website", "https://www.facebook.com/p/Acrivon-Management-Consultants-100069599990040/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'acrivon-centurion-central' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Across My Heart operates as an industrial supplier and manufacturer in Valhalla.',
  description_enriched_at = datetime('now')
WHERE slug = 'across-my-heart-valhalla' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'ACT Solutions Pretoria has provided financial and accounting advisory services from Villieria since 1989, covering accounting, auditing, tax compliance, corporate statutory work and estate and trust management.',
  source_urls = '["scraped:google-places-no-website", "https://actgroup.co.za/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'act-solutions-pretoria-inc-villieria' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Action Glass & Aluminium manufactures, supplies and installs fabricated glass and aluminium products from its Laudium base, including windows, doors, shower enclosures, balustrades, shopfronts and custom glass work.',
  source_urls = '["scraped:google-places-no-website", "https://www.actionglass.co.za/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'action-glass-aluminium-laudium' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Cornwall Hill Estate location is part of the ActionCOACH business coaching franchise, running one-on-one programmes such as StartupCOACH, StepUpCOACH and CEO Coaching alongside group programmes like ActionCLUB.',
  description_enriched_at = datetime('now')
WHERE slug = 'actioncoach-cornwall-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This ActionCOACH franchise in Cornwall Hill Estate is run by coach Pieter Scholtz, who helps business owners clarify their business vision and align it with their personal goals.',
  description_enriched_at = datetime('now')
WHERE slug = 'actioncoach-pieter-scholtz-cornwall-hill-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Active Electronics is an official dealer for Kenwood, Icom, Motorola and Kirisun two-way radios, selling and servicing communication equipment for clients in mining, security, logistics, government and other sectors from its Wierdapark base.',
  description_enriched_at = datetime('now')
WHERE slug = 'active-electronics-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Active Transport has over 30 years of experience in furniture removals, handling household and office relocations from its Waltloo base.',
  hours = 'Mon-Sun 08:00-16:00',
  description_enriched_at = datetime('now')
WHERE slug = 'active-transport-moving-company-bergtuin' AND description_enriched_at IS NULL;
