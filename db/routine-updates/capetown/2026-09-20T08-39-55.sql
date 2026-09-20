UPDATE businesses
SET description = 'Akmed Pharmacy has provided prescription dispensing, chronic medication management and over-the-counter health and beauty products from its Grassy Park premises since 2008.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 09:00-22:00, Sun 09:00-12:50 & 17:00-22:00',
    source_urls = '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=247005", "https://www.brabys.com/za/western-cape/grassy-park/pharmacies/akmed-pharmacy-cc", "https://www.akmedpharmacy.co.za/"]'
WHERE slug = 'akmed-pharmacy-grassy-park' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Excellent Meat Market is a family-owned Halaal butchery that has traded from the corner of Epping Avenue and Halt Road in Elsies River since 1970.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.brabys.com/za/western-cape/cape-town/elsies-river/butchers-wholesalers/excellent-meat-market", "https://excellentmeat.co.za/find-us/", "https://www.worldofmeats.co.za/view/excellent-meat-market"]'
WHERE slug = 'excellent-meat-market-elsies-river' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Truworths is a South African fashion and lifestyle clothing retailer, with a branch in Liberty Promenade, Mitchell''s Plain.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-18:00, Fri 09:00-19:00, Sat 09:00-17:00, Sun 09:00-15:00'
WHERE slug = 'truworths-liberty-promenade-mitchells-plain' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tsonga is a South African shoe store, with a branch in Waterstone Village, Somerset West, offering footwear and accessories.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00'
WHERE slug = 'tsonga-waterstone-village-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Tuska Atelier is a handcrafted ostrich leather boutique, and its first store is located at the Old Biscuit Mill in Woodstock.',
    description_enriched_at = datetime('now')
WHERE slug = 'tuska-atelier-woodstock' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Two Gingers Gember Distillery is a craft gin distillery in Muizenberg, founded in 2022, offering a range of gins and interactive distillery tours.',
    description_enriched_at = datetime('now')
WHERE slug = 'two-gingers-gember-distillery-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'U-turn Charity Shop is part of U-Turn Homeless Ministries'' network of Cape Town charity shops, selling secondhand clothing, household goods and furniture to fund programmes equipping people to overcome homelessness. U-Turn was founded in 1997.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://homeless.org.za/charity-shops/", "https://grapevinesa.co.za/index.php/u-turn-charity-shop-durbanville-9", "https://southernsuburbstatler.co.za/news/2022-11-03-u-turn-helping-the-homeless-for-25-years/"]'
WHERE slug = 'u-turn-charity-shop-parow' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Urban Health Pharmacy is a 24-hour pharmacy in Lansdowne, dispensing prescription medicines and offering chronic medication management around the clock.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours'
WHERE slug = 'urban-health-pharmacy-lansdowne' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Urban Optik Eyecare is an optometry practice in Gardens Shopping Centre, offering eye tests and all-inclusive spectacle packages.',
    description_enriched_at = datetime('now')
WHERE slug = 'urban-optik-eyecare-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Urban Umami is an Asian-inspired restaurant in the Bridgeways Precinct, Century City, serving all-day dining alongside a dedicated breakfast menu.',
    description_enriched_at = datetime('now')
WHERE slug = 'urban-umami-century-city' AND description_enriched_at IS NULL;
