-- Description enrichment, batch 15 (interactive session, round 3, per
-- owner request 2026-09-02 to push job 4 forward as fast as possible).
-- Continues the alphabetical backlog (description_enriched_at IS NULL).
-- Each business researched individually via WebSearch/WebFetch by parallel
-- research agents; "researched" ones cite what was actually found and
-- append new source_urls, "reworded" ones use only already-verified fields
-- (name/category/suburb/shopping_center) when no additional real
-- information turned up. Guarded by description_enriched_at IS NULL so
-- this is safe to re-run.

UPDATE businesses SET
  description = 'This Samrand branch of Agrinet, a South African wholesale distributor with more than 70 years of heritage in agricultural retail, stocks hardware, tools, irrigation, plumbing and agricultural supplies at wholesale prices.',
  hours = 'Mon-Fri 07:30-16:30, Sat Closed, Sun Closed',
  source_urls = '["http://www.agrinet.co.za/","https://za.near-place.com/agrinet-pty-ltd-111-sterling-road-samrand-business-park-centurion"]',
  description_enriched_at = datetime('now')
WHERE slug = 'agrinet-samrand-kosmosdal' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Centurion branch of Agriplas, a South African irrigation equipment manufacturer operating for more than 40 years, supplies products such as micro sprinklers and dripper line for agricultural, industrial water filtration and mining use.',
  source_urls = '["https://www.agriplas.co.za/","https://www.agriplas.co.za/about/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'agriplas-centurion-rooihuiskraal' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Agua 84 Minerals is an industrial supplier and manufacturing business based in Hermanstad, Pretoria.',
  description_enriched_at = datetime('now')
WHERE slug = 'agua-84-minerals-hermanstad' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'This Agua e Vida outlet in Wierdapark, also known as Wierda Trinity Living Water, purifies water and infuses it with 84 minerals and trace elements, part of the wider Agua e Vida water-purification network in Centurion.',
  source_urls = '["scraped:google-places-no-website","https://www.jamii.co.za/4929-centurion-water-purification-agua-e-vida-wierdapark"]',
  description_enriched_at = datetime('now')
WHERE slug = 'agua-e-vida-wierda-park-trinity-living-water-wierdapark' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Agua é Vida Willow Way, in the Willow Way Shopping Centre in Die Wilgers, Pretoria East, purifies water and infuses it with 84 minerals and trace elements as part of the wider Agua é Vida network.',
  source_urls = '["https://aguago.co.za/","https://www.jamii.co.za/4933-pretoria-east-water-purification-agua-e-vida-willow-way"]',
  description_enriched_at = datetime('now')
WHERE slug = 'agua-vida-willow-way-de-wilgers' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Aguazoi, formerly Agua e Vida, purifies water through a seven-step process with mineral reintroduction, and offers bottled water distribution, water dispenser rental, bulk water supply, and installation of home and commercial filtration systems.',
  description_enriched_at = datetime('now')
WHERE slug = 'aguazoi-raslouw-corner-formely-agua-e-vida-raslouw-corner-raslouw' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Ahlaams Gourmet Grills is a Halal gourmet grill restaurant and caterer in Centurion serving steaks, ribs, burgers, and pasta, and catering for functions of all sizes.',
  source_urls = '["scraped:google-places-no-website", "https://restaurantguru.com/Ahlaams-Gourmet-Grills-Centurion", "https://halaal.org.za/ahlaams-gourmet-grills/"]',
  description_enriched_at = datetime('now')
WHERE slug = 'ahlaams-gourmet-grills-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Ai events management specialises in wedding planning and management, along with parties and functions.',
  description_enriched_at = datetime('now')
WHERE slug = 'ai-events-management-erasmia' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Aida - Pretoria East is an estate agency handling property sales and rentals in Brummeria and the broader Pretoria East area.',
  description_enriched_at = datetime('now')
WHERE slug = 'aida-pretoria-east-brummeria' AND description_enriched_at IS NULL;

UPDATE businesses SET
  description = 'Aida (Pretoria) Centurion Office is an estate agency handling property sales and rentals in the Centurion Golf Estate area of Centurion.',
  description_enriched_at = datetime('now')
WHERE slug = 'aida-pretoria-centurion-office-centurion-golf-estate' AND description_enriched_at IS NULL;
