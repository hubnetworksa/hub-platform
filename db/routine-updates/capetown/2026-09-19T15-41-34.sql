UPDATE businesses
SET description = 'Old Khaki is a branch of the South African outdoor and casual clothing retailer in Gardens Shopping Centre, stocking men''s and women''s khakis, jackets and leisurewear.',
    description_enriched_at = datetime('now')
WHERE slug = 'old-khaki-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Old Khaki is a branch of the South African outdoor and casual clothing retailer in Victoria Wharf Shopping Centre, stocking men''s and women''s khakis, jackets and leisurewear.',
    description_enriched_at = datetime('now')
WHERE slug = 'old-khaki-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Olivia Grey is an intimate lifestyle and adult-products boutique in Cape Quarter, selling sex toys and accessories in a discreet, upscale in-store setting with delivery available.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://capequarter.co.za/shops/", "https://www.findglocal.com/ZA/Cape-Town/305574869882419/Olivia-Grey", "https://www.cylex.net.za/company/olivia-grey---sex-toys-23679621.html"]'
WHERE slug = 'olivia-grey-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Olympia Cafe and Deli is a casual all-day eatery and bakery across the road from Kalk Bay harbour, serving a daily blackboard menu built around fresh, locally caught fish and seafood.',
    description_enriched_at = datetime('now')
WHERE slug = 'olympia-cafe-and-deli-kalk-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'OptiSmile Dental Care is a multi-speciality dental practice in The Point, Sea Point, specialising in Invisalign clear aligners, cosmetic bonding, teeth whitening and dental implants.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:00, Fri 08:00-16:00, Sat-Sun Closed',
    source_urls = '["https://www.hotfrog.co.za/company/1099851566575616/optismile-advanced-dentistry-and-implant-centre/cape-town/dental-care", "https://seapointcid.org/places/optismile-advanced-dentistry-and-implant-centre/", "https://optismile.co.za/"]'
WHERE slug = 'optismile-dental-care-sea-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Out of Africa is an African gifts and curios store in Victoria Wharf Shopping Centre, selling handcrafted ceramics, basketry, home decor and jewellery sourced through community upliftment programmes.',
    description_enriched_at = datetime('now'),
    hours = 'Open daily 09:00-21:00'
WHERE slug = 'out-of-africa-va-waterfront' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oxford Stationers is a stationery, books and picture-framing shop in Gardens Shopping Centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 09:00-17:00, Sun 09:00-14:00',
    source_urls = '["https://mallguide.co.za/shops/view/34270/gardens-shopping-centre/oxford-stationery-books", "https://www.facebook.com/Oxford.CPT/", "https://www.gardensshoppingcentre.co.za/stores/oxford-stationers/"]'
WHERE slug = 'oxford-stationers-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP is a branch of the South African budget clothing, footwear and homeware retail chain in Golden Acre Shopping Centre, Cape Town CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'pep-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'PEP Cell is a branch of the PEP retail chain''s cellular specialist format in Golden Acre Shopping Centre, selling mobile phones, airtime and cellular accessories.',
    description_enriched_at = datetime('now')
WHERE slug = 'pep-cell-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Palladium Hair Co is a hair salon in Cape Quarter, De Waterkant, offering cuts, colour and styling services.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 09:00-15:00, Sun Closed',
    source_urls = '["https://capequarter.co.za/shops/", "https://palladiumhair.com/contact/", "https://www.fresha.com/lvp/palladium-hair-company-somerset-road-cape-town-PVqJaA"]'
WHERE slug = 'palladium-hair-co-de-waterkant' AND description_enriched_at IS NULL;
