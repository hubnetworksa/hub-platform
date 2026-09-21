UPDATE businesses
SET description = 'Essential Health Pharmacy - Strand is a branch of the Essential Health Pharmacy Group, providing dispensing and everyday health and wellness services in Strand.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-18:00, Sat 08:00-14:00, Sun 09:00-13:00'
WHERE slug = 'essential-health-pharmacy-strand-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Goldfish Cafe & Eatery is a seafood-focused restaurant on Beach Road in Strand, serving breakfast, lunch and dinner with an emphasis on fresh, sustainably-sourced seafood alongside Italian coffee.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-19:00, Fri 08:00-20:00, Sat-Sun 08:00-15:00',
    source_urls = '["https://www.facebook.com/TheGoldfishEatery/", "https://www.tripadvisor.com/Restaurant_Review-g1236998-d17599385-Reviews-Goldfish_Eatery-Strand_Western_Cape.html", "https://www.eatout.co.za/venue/goldfish-eatery-strand/"]'
WHERE slug = 'goldfish-cafe-and-eatery-strand' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Henri''s Restaurant & Wine Bar is a restaurant in a renovated heritage house on Main Road, Somerset West, known for its aged grass-fed beef and fresh local seafood, with a patio and bar offering craft and imported beers and a wine list served without corkage.',
    description_enriched_at = datetime('now')
WHERE slug = 'henris-restaurant-and-wine-bar-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'MLV Law is a Somerset West law firm handling litigation, family law, labour law, property law, and commercial law, as well as wills, estates and trusts, arbitration, dispute resolution and debt collection.',
    description_enriched_at = datetime('now')
WHERE slug = 'mlv-law-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Magnolia Social Dining Lounge is a tapas-style restaurant at the Erinvale Hotel and Spa in Somerset West, open daily with no reservations required.',
    description_enriched_at = datetime('now'),
    hours = 'Daily 11:00-23:00'
WHERE slug = 'magnolia-social-dining-lounge-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Moksh Indian Restaurant serves authentic North Indian cuisine in Audas Estate, Somerset West, specialising in clay-oven dishes and traditional curries.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 16:00-22:00, Tue-Sat 12:00-22:00, Sun 12:00-18:00'
WHERE slug = 'moksh-indian-restaurant-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Morkel & De Villiers Inc is a Somerset West law firm with a large conveyancing and litigation practice, including property transfers and bond registrations, deceased estate administration, commercial contract drafting, and litigation across the Magistrates Courts of the Helderberg and surrounding areas.',
    description_enriched_at = datetime('now')
WHERE slug = 'morkel-de-villiers-inc-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Oceans 8 Seafood & Sushi is a seafood and sushi restaurant at the corner of Main and Van der Byl Roads in Van der Stel, Somerset West.',
    description_enriched_at = datetime('now'),
    hours = 'Mon Closed, Tue-Sun 12:00-22:00'
WHERE slug = 'oceans-8-seafood-and-sushi-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'South End Hardware & Gas is a hardware store and gas supplier on Lower Gordon''s Bay Road in Strand.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Thu 08:00-17:30, Fri 08:00-12:30 & 14:30-17:30, Sat 09:00-17:00, Sun 09:00-13:00'
WHERE slug = 'south-end-hardware-and-gas-strand' AND description_enriched_at IS NULL;
