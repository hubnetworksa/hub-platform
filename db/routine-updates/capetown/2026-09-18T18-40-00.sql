-- Job 4: description enrichment sweep, batch 1/2 (10 records)

UPDATE businesses
SET description = 'ABSA is a bank branch inside Gardens Shopping Centre in Gardens, offering everyday retail banking services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:30-15:30, Sat 08:00-11:00'
WHERE slug = 'absa-bank-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Abode is a Cape Town design studio, founded in 2003, creating quirky handcrafted homeware and furniture from recycled mild steel and natural cane, including custom lighting and furniture design, from its store at The Old Biscuit Mill in Woodstock.',
    description_enriched_at = datetime('now')
WHERE slug = 'abode-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Absolute Pets is a branch of the South African pet supply retail chain, stocking pet food, accessories and supplies inside The Point in Sea Point.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'absolute-pets-the-point-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Absolute Pets is a branch of the South African pet supply retail chain, stocking pet food, accessories and supplies inside Cape Quarter Lifestyle Village in De Waterkant.',
    description_enriched_at = datetime('now')
WHERE slug = 'absolute-pets-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Absolute Pets is a branch of the South African pet supply retail chain, stocking pet food, accessories and supplies inside Gardens Shopping Centre in Gardens.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 09:00-18:00, Sun 09:00-16:00',
    source_urls = '["https://za.ads4acause.com/places/cape-town/absolute-pets-gardens-shopping-centre/", "https://www.absolutepets.com/pet-stores/locator", "https://www.gardensshoppingcentre.co.za/stores/absolute-pets/"]'
WHERE slug = 'absolute-pets-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Absolute Pets is a branch of the South African pet supply retail chain, stocking pet food, accessories and supplies inside Waterstone Village in Somerset West.',
    description_enriched_at = datetime('now')
WHERE slug = 'absolute-pets-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Ackermans Vangate Mall is a branch of the South African value fashion retailer, selling affordable clothing, footwear and homeware inside Vangate Mall in Athlone.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-19:00, Fri-Sat 09:00-21:00, Sun 09:00-19:00'
WHERE slug = 'ackermans-vangate-mall-athlone' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Addicted is a fashion and accessories retailer inside Cape Quarter in De Waterkant, carrying the ADDICTED, ES and AD FETISH apparel and accessory lines.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capequarter.co.za/shops/", "https://getoccupi.com/malls/cape-quarter", "https://www.addictedsa.co.za/"]'
WHERE slug = 'addicted-cape-quarter-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'African Elite Properties offers luxury serviced accommodation in De Waterkant, with apartments inside Cape Quarter Lifestyle Village as well as free-standing apartments nearby, some with private pools and braai areas.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capequarter.co.za/shops/", "https://africaneliteproperties.com/stay-with-us/", "https://africaneliteproperties.com/apartments/"]'
WHERE slug = 'african-elite-properties-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Andalousse is a Halal-certified Moroccan restaurant inside Cape Quarter in De Waterkant, serving traditional Moroccan cuisine.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 09:00-23:00'
WHERE slug = 'andalousse-de-waterkant' AND description_enriched_at IS NULL;
