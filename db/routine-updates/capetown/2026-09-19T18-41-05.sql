UPDATE businesses
SET description = 'Builders Warehouse is a branch of the national hardware and building-materials chain, situated in the Northgate Estate industrial park in Ysterplaat.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 08:00-16:00'
WHERE slug = 'builders-warehouse-ysterplaat' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Clearance Warehouse is a clearance depot in Paarden Eiland selling end-of-range, overstocked and discontinued tiles, sanitaryware and ready-made table-tops at discounted prices.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-17:00, Sat 09:00-14:00',
    source_urls = '["https://clearancewarehouse.co.za/pages/contact-us", "https://opening-hours.co.za/02794464/Clearance_Warehouse", "https://clearancewarehouse.co.za/pages/about-us"]'
WHERE slug = 'clearance-warehouse-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Flooring Warehouse in Paarden Eiland stocks laminate, carpet, vinyl, and solid wood and bamboo flooring along with skirting and trims, and also offers a fully installed flooring service.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-17:00, Sat 08:00-13:00, Sun Closed',
    source_urls = '["https://www.flooringwarehouse.co.za/pages/contact", "https://northgateestate.co.za/flooring-warehouse/", "https://finfloor.co.za/distributor-cape-town-flooring-warehouse-paarden-eiland/"]'
WHERE slug = 'flooring-warehouse-paarden-eiland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Clothing is a clothing branch of the Pick n Pay retail group, trading inside The Point in Sea Point.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-17:00, Sun 09:00-16:00'
WHERE slug = 'pick-n-pay-clothing-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Local Kenridge is a Pick n Pay convenience supermarket branch trading inside IPIC Shopping Centre Kenridge.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 07:00-21:00, Sun 08:00-20:00'
WHERE slug = 'pick-n-pay-local-kenridge-kenridge' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Maitland Square is a Pick n Pay supermarket branch trading inside Maitland Square on Voortrekker Road, Maitland.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-maitland-square-maitland' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay QualiSave Liberty Promenade is a Pick n Pay supermarket branch trading inside Liberty Promenade shopping centre in Mitchells Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-20:00, Sun 11:00-18:00'
WHERE slug = 'pick-n-pay-qualisave-liberty-promenade-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay QualiSave Vangate Mall is a Pick n Pay supermarket branch trading inside Vangate Mall in Athlone.',
    description_enriched_at = datetime('now')
WHERE slug = 'pick-n-pay-qualisave-vangate-mall-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pick n Pay Supermarket Plattekloof is a standalone Pick n Pay supermarket branch on the corner of Gert van Rooyen and Plattekloof Roads in Plattekloof.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 08:00-20:00'
WHERE slug = 'pick-n-pay-supermarket-plattekloof-plattekloof' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Pigalle Cape Town is a large restaurant and live-entertainment venue in Green Point known for fresh seafood and steak with a Portuguese-inflected menu, featuring nightly live jazz, swing and salsa performances alongside DJ sets on weekends.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://pigalle.capetown/welcome-to-pigalle/contact-us", "https://www.yep.co.za/biz/store/pigalle-restaurant/656347", "https://www.capetown.travel/listing/pigalle-cape-town/"]'
WHERE slug = 'pigalle-cape-town-green-point' AND description_enriched_at IS NULL;
