-- Description enrichment, batch 19 (interactive session, round 3, per
-- owner request 2026-09-02 to push job 4 forward as fast as possible).
-- Continues the alphabetical backlog (description_enriched_at IS NULL).
-- Each business researched individually via WebSearch/WebFetch by parallel
-- research agents; "researched" ones cite what was actually found and
-- append new source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'Alex Business Development is a business consulting firm in Waltloo.',
  description_enriched_at = datetime('now')
WHERE slug = 'alex-business-development-waltloo' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Alexivect Branding Solutions provides digital printing, branding, web design and digital services from its Kilner Park premises.',
  source_urls = '["http://alexivectbrandingsolutions.com/", "https://pretoria.co.za/listing/alexivect-branding-solutions/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'alexivect-branding-solutions-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Alfie''s is a small, intimate Italian cafe in Hazelwood run by an Italian owner and known for fresh homemade pasta, with its gnocchi highly recommended by regulars.',
  source_urls = '["https://www.openstreetmap.org/node/9573572517", "https://www.eatout.co.za/venue/alfies/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'alfie-s-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Alfie''s Hazelwood is the original Italian cafe of the Alfie''s restaurant group, run by an Italian owner and known for its fresh homemade pasta dishes, including a gnocchi regulars recommend, served in a small, trattoria-style setting.',
  source_urls = '["https://www.alfies.co.za/", "https://magicpin.com/south-africa/Pretoria/Hazelwood/Restaurant/Alfies-Italian-Cafe/store/235ca4a", "https://www.eatout.co.za/venue/alfies/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'alfie-s-hazelwood-menlyn' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Alijende Business Solutions is a business consulting firm based in Waterkloof Glen.',
  description_enriched_at = datetime('now')
WHERE slug = 'alijende-business-solutions-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Alive Properties is an estate agency based in Boardwalk Manor.',
  description_enriched_at = datetime('now')
WHERE slug = 'alive-properties-boardwalk-manor' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Alkaline Ionized H₂0 supplies pH9 and pH10 alkaline mineral water, reverse osmosis filter systems, water dispensers and personalised bottled water with refill and delivery services, from its premises in Clubview Corner Shopping Centre.',
  hours = 'Mon-Fri 08:30-17:30, Sat 09:00-14:00, Sun Closed',
  description_enriched_at = datetime('now')
WHERE slug = 'alkaline-ionized-h-0-clubview-east' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'All in one admin South Africa is a business consulting firm based in Moregloed.',
  description_enriched_at = datetime('now')
WHERE slug = 'all-in-one-admin-south-africa-moregloed' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'All Over South Africa Transport & Logistics offers residential, office and commercial, and specialised moving services from its base in Pretoria.',
  source_urls = '["scraped:google-places-no-website", "https://www.procompare.co.za/providers/all-over-south-africa-transport-logistics"]',
  description_enriched_at = datetime('now')
WHERE slug = 'all-over-south-africa-transport-logistics-boekenhoutskloof' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'All Round Afric is a Jan Niemand Park building and renovation company established in 2007 by owner James Williams, specialising in renovations, maintenance, building work, steel works and waterproofing.',
  hours = 'Mon-Fri 08:00-17:00',
  description_enriched_at = datetime('now')
WHERE slug = 'all-round-afric-jan-niemand-park' AND description_enriched_at IS NULL;
