UPDATE businesses
SET description = 'Central Park Foods is a takeaway food outlet serving the Central Park precinct in Elsies River Estate, Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 06:00-16:30, Sat-Sun Closed'
WHERE slug = 'central-park-foods-elsies-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Craven Park Pharmacy is a pharmacy on Connaught Road in Elsies River, Cape Town.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-19:00, Fri 09:00-12:30 & 14:00-19:00, Sat 09:00-18:00, Sun Closed'
WHERE slug = 'craven-park-pharmacy-elsies-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'M&L Panelbeaters is a family-owned panelbeating and spray-painting workshop in Elsies River that has repaired vehicles in Cape Town since 1984, also handling general mechanical repairs and insurance claim assistance.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://panelshop.co.za/listing/m-l-panelbeaters/", "https://www.africanadvice.com/1215212/Panel_Beaters_And_Spray_Painters/Cape_Town/M_And_L_Panelbeaters/", "https://www.mlpanelbeaters.co.za/"]'
WHERE slug = 'm-l-panelbeaters-elsies-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'SA Autoparts is a motor spares supplier on Halt Road, Elsies River, that has traded in Cape Town for over 25 years, importing new and used engines, gearboxes, differentials, and performance accessories.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://saautoparts.co.za/", "https://www.brabys.com/za/western-cape/cape-town/elsies-river/motor-car-parts/s-a-auto-parts", "https://saautoparts.co.za/pages/about-us"]'
WHERE slug = 'sa-autoparts-elsies-river' AND description_enriched_at IS NULL;
