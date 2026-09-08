-- Description enrichment, batch 16 (interactive session, round 3, per
-- owner request 2026-09-02 to push job 4 forward as fast as possible).
-- Continues the alphabetical backlog (description_enriched_at IS NULL).
-- Each business researched individually via WebSearch/WebFetch by parallel
-- research agents; "researched" ones cite what was actually found and
-- append new source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'Aida Pretoria Moot is an estate agency handling property sales and rentals in Villieria, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'aida-pretoria-moot-villieria' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'AidaDias&Co provides online business management (OBM) and fractional COO services, including systems audits, SOP creation, and virtual assistant support, but does not undertake creative work such as graphic design or copywriting.',
  description_enriched_at = datetime('now')
WHERE slug = 'aidadias-co-online-business-manager-services-candlewoods-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'aignite (ai.gnite) is an AI-powered platform that helps South African startup founders validate ideas, build business plans and pitch decks, and generate financial forecasts.',
  description_enriched_at = datetime('now')
WHERE slug = 'aignite-amberfield-glen' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Aimes and Isles is a nursery and garden centre in Riviera, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'aimes-and-isles-riviera' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Air Service Centre distributes, installs, and maintains compressed air systems, including piston and screw compressors, medical gas installations, and pressure vessels, and has operated in the industry for nearly two decades.',
  hours = 'Open 24 hours',
  description_enriched_at = datetime('now')
WHERE slug = 'air-service-centre-salieshoek' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Air To Water Africa is an industrial supplier based in Annlin, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'air-to-water-africa-annlin' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Airbag Services, trading as Airbag Testing and Training (Pty) Ltd, has offered specialist OEM electronic airbag fitment and repair since 2003, and is the only company in South Africa offering non-destructive airbag testing to SABS ARP 068 standards and dedicated airbag training programmes.',
  source_urls = '["scraped:google-places-no-website", "https://airbagservices.co.za/about-us/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'airbag-services-waverley' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Airmatix CC has supplied, installed, and serviced air conditioning and refrigeration systems since 2007, partnering with major brands including Samsung, LG, Daikin, Carrier, and Toshiba.',
  description_enriched_at = datetime('now')
WHERE slug = 'airmatix-cc-villieria' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Airnd Sourcing and Procurement is a Centurion-based procurement service offering sourcing, freight forwarding, clearing agents, and international payment solutions, along with export services for South African wholesale goods.',
  source_urls = '["http://www.airndprocurement.com/", "https://za.linkedin.com/company/airnd-exports"]',
  description_enriched_at = datetime('now')
WHERE slug = 'airnd-sourcing-and-procurement-midlands-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'airXpert is a building and construction business based in Constantia Park, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'airxpert-constantia-park' AND description_enriched_at IS NULL;
