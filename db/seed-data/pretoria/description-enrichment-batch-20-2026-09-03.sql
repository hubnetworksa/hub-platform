-- Description enrichment, batch 20 (interactive session, "lean" mode --
-- agents write SQL straight to a file and report only a short summary,
-- instead of returning full SQL in chat, to cut context/token overhead).
-- Continues the alphabetical backlog (description_enriched_at IS NULL).
-- "researched" entries cite what was actually found and append new
-- source_urls; "reworded" entries use only already-verified fields when no
-- additional real information turned up. Guarded by description_enriched_at
-- IS NULL so this is safe to re-run.

UPDATE businesses SET
  description = 'Alphabusinessassociates is a business consulting firm based in Sinoville, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'alphabusinessassociates-sinoville' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Amalooloo, based in Koedoespoort Industrial, developed and manufactures a patented pre-cast concrete sanitation system offering both waterborne and dry (ventilated improved pit) toilet structures used by municipalities across South Africa.',
  source_urls = '["scraped:google-places-no-website", "https://pretoria.infoisinfo.co.za/card/amalooloo/535092"]',
  description_enriched_at = datetime('now')
WHERE slug = 'amalooloo-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Amara The Hills is a multi-cuisine restaurant and social space within The Hills Eco-Game Estate overlooking a lake, serving all-day dining from burgers, steaks and pizzas to seafood platters and slow-cooked stews.',
  hours = 'Mon-Fri 10:00-21:00, Sat 09:00-21:00, Sun 09:00-18:00',
  description_enriched_at = datetime('now')
WHERE slug = 'amara-the-hills-the-hills-eco-game-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Andre Muller is an insurance broker serving clients in Annlin, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'andre-muller-annlin-west' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'attooh! is an authorised financial services provider (FSP 32189) offering comprehensive financial planning, including life, health and investment insurance plus retirement and estate planning, from its Faerie Glen office.',
  source_urls = '["http://attooh.co.za/", "https://www.brokerdirectory.co.za/listing.php?listing=attooh-financial-wellness-pty-ltd&listings_id=2143258"]',
  description_enriched_at = datetime('now')
WHERE slug = 'attooh-willow-glen' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'atWORK Internet Software Solutions, founded in 1998 and based in Erasmuskloof, builds cloud-based CRM, practice management, compliance management and financial planning software for financial advisors.',
  source_urls = '["https://www.atwork.co.za/", "https://www.work.za.com/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'atwork-internet-software-solutions-erasmuskloof' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'b consulting is a business consulting firm based in Waterkloof Glen, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'b-consulting-waterkloof-glen' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Bamayi and Groups Investment (Pty) Ltd is a business consulting firm based in Olievenhoutbosch, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'bamayi-and-groups-investment-pty-ltd-olievenhoutbosch' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'A barbershop offering haircuts and grooming services in Amberfield Glen, Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'barbershop-amberfield' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'bb. studio (Beauty and Business), led by Maritzka, is a branding and web design studio in Olympus offering brand identity, website design and social media content creation.',
  description_enriched_at = datetime('now')
WHERE slug = 'bb-studio-beauty-and-business-olympus' AND description_enriched_at IS NULL;
