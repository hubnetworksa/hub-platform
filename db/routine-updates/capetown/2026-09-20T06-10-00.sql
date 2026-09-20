UPDATE businesses
SET description = 'Bird & Co Kromboom is a branch of the South African fast-food chain known for deboned chicken and wood-fired pizza, operating from Kromboom Convenience Centre in Crawford.',
    description_enriched_at = datetime('now'),
    hours = 'Sun-Thu 10:00-21:00, Fri-Sat 10:00-22:00'
WHERE slug = 'bird-and-co-kromboom-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Kromboom Medical Practice is a family general practice and travel clinic on the corner of Kromboom and Sunnyside Roads in Crawford, offering general, travel, occupational and insurance medical services.',
    description_enriched_at = datetime('now')
WHERE slug = 'kromboom-medical-practice-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'KwikSpar Kromboom is a Spar-group supermarket in Kromboom Convenience Centre, Crawford, stocking groceries and everyday essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'kwikspar-kromboom-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Steers Kromboom Rd is a branch of the flame-grilled burger, chicken and ribs fast-food chain, trading from Shop 3 in the Kromboom Convenience Centre in Crawford.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 09:00-22:00, Fri-Sat 09:00-23:00, Sun 09:00-22:00',
    source_urls = '["https://www.tripadvisor.com/Restaurant_Review-g1722390-d34071294-Reviews-Steers_Kromboom_Rd-Cape_Town_Western_Cape.html", "https://www.southafricabusinessdirectory.co.za/company/33de2ade960dcf16af9a4c32c6dab387/steers/cape-town/restaurants", "https://locations.steers.co.za/restaurants-KromboomCentre-SteersKromboomRd"]'
WHERE slug = 'steers-kromboom-crawford' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The President Hotel is a hotel in Bantry Bay offering sea-facing rooms, a heated pool, the Cove Wellness Spa, multiple on-site restaurants and cafes, and direct beach access.',
    description_enriched_at = datetime('now'),
    hours = 'Open 24 hours',
    source_urls = '["https://www.sa-venues.com/visit/thepresidenthotel/", "https://www.presidenthotel.co.za/", "https://citysightseeing.co.za/en/cape-town/the-president-hotel-bantry-bay"]'
WHERE slug = 'the-president-hotel-bantry-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Raj is a long-running Indian restaurant on the Camps Bay Promenade, established in 1995, serving North Indian and Tandoori cuisine including seafood specialities, with ocean views.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/venue/the-raj-camps-bay/", "https://www.tripadvisor.com/Restaurant_Review-g312658-d2400415-Reviews-The_Raj-Camps_Bay_Western_Cape.html", "https://homefoodandtravel.co.za/the-raj-indian-restaurant-offers-a-fine-dining-experience-in-camps-bay/"]'
WHERE slug = 'the-raj-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Real Repair Company is a device repair specialist in Gardens Shopping Centre, fixing Apple, Samsung and Huawei smartphones, tablets and smartwatches with a typical one-hour turnaround and a parts-and-labour guarantee.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:00, Sat-Sun Closed',
    source_urls = '["https://therealrepaircompany.co.za/store-locator", "https://za.africabz.com/western-cape/the-real-repair-company-353454", "https://www.gardensshoppingcentre.co.za/stores/the-real-repair-company-pty-ltd/"]'
WHERE slug = 'the-real-repair-company-gardens-shopping-centre-gardens' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Shop Restaurant is a casual, chef-owned bistro in Three Anchor Bay serving simple, honest food built around meat, fish and vegetarian options with an emphasis on sustainably sourced produce; it opened in November 2017 in the space previously occupied by Buzbey Grill.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.eatout.co.za/venue/the-shop/", "https://crushmag-online.com/the-shop-restaurant-sea-point/", "https://www.capetownmagazine.com/the-shop-restaurant"]'
WHERE slug = 'the-shop-restaurant-three-anchor-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Sports Concept Store is a premium sportswear and running-shoe retailer in Cape Quarter Lifestyle Village, De Waterkant, open since 2013 and stocking brands including Hoka, On, Under Armour and Asics alongside Randolph Sunglasses and Gooroo yoga mats.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 09:00-16:00, Sun 10:00-14:00'
WHERE slug = 'sports-concept-store-de-waterkant' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'The Tux Tailor is a tailoring and alterations business in Riverlands Mall, Observatory, offering custom-made suits for weddings and matric balls alongside alterations for men''s, ladies'' and children''s clothing.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://riverlands.capetown/mall/", "https://www.instagram.com/the_tux_tailor_riverlandsmall/", "https://thetuxtailor.com/"]'
WHERE slug = 'the-tux-tailor-riverlands-observatory' AND description_enriched_at IS NULL;
