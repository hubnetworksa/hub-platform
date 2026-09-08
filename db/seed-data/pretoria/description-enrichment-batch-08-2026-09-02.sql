-- Description enrichment, batch 08 (interactive session, round 2, per
-- owner request 2026-09-02 to push job 4 forward as fast as possible).
-- Continues the alphabetical backlog (description_enriched_at IS NULL).
-- Each business researched individually via WebSearch/WebFetch by parallel
-- research agents; "researched" ones cite what was actually found and
-- append new source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'This is the South African office of Accuenergy, a global manufacturer of power and energy meters, current transformers, and cloud-based energy management software used for tenant submetering, EV charging, and power quality monitoring.',
  source_urls = '["http://accuenergy.com/", "https://www.accuenergy.com/contact/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'accuenergy-buffelsdrift' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Accukeep Business Solutions is an accounting and bookkeeping practice serving businesses and individuals in Kilner Park.',
  description_enriched_at = datetime('now')
WHERE slug = 'accukeep-business-solutions-kilner-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'AccuLaser (Pty) Ltd is a perspex and 3D design manufacturing studio in Koedoespoort Industrial, laser-cutting custom retail displays, brochure holders and acrylic enclosures alongside MDF manufacturing and steel detailing, operating since 2018.',
  hours = 'Mon-Fri 08:00-16:00',
  description_enriched_at = datetime('now')
WHERE slug = 'acculaser-pty-ltd-koedoespoort' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'accuracyinclinetechnologies is an industrial supplies and manufacturing business based in Brooklands Lifestyle Estate, Kosmosdal.',
  description_enriched_at = datetime('now')
WHERE slug = 'accuracyinclinetechnologies-brooklands-lifestyle-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Ace Ends I.T is a software development company in Theresapark that builds custom business systems such as ERP, point-of-sale and HR management platforms, alongside web and app development and cloud deployment services.',
  description_enriched_at = datetime('now')
WHERE slug = 'ace-ends-i-t-theresapark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Aces Of Spades is a 24-hour internet cafe in Lyttelton Manor offering reliable Wi-Fi, coffee and a comfortable space to work, study or browse online.',
  hours = 'Open 24 hours',
  source_urls = '["https://prive.ggslot.pro/", "https://pretoria.co.za/place/aces-of-spades"]',
  description_enriched_at = datetime('now')
WHERE slug = 'aces-of-spades-kloofsig' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Acheron Systems is a software development company in Wingate Park specialising in cloud-native development and microservices architecture, building custom software for finance, security and service-delivery clients.',
  description_enriched_at = datetime('now')
WHERE slug = 'acheron-systems-wingate-park' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Acheron Technologies is a software development business based in Woodhill Golf Estate.',
  description_enriched_at = datetime('now')
WHERE slug = 'acheron-technologies-woodhill-golf-estate' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Ackermans branch on Johannes Ramokhoase Street in Pretoria Central sells the retailer''s value-priced clothing, footwear and accessories for the whole family.',
  hours = 'Mon-Fri 08:30-17:00, Sat 08:30-13:00',
  description_enriched_at = datetime('now')
WHERE slug = 'ackermans-pretoria-central-5' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Ackermans in Centurion Mall sells value-priced clothing, footwear and accessories for the whole family.',
  description_enriched_at = datetime('now')
WHERE slug = 'ackermans-centurion' AND description_enriched_at IS NULL;
