UPDATE businesses
SET description = 'Clicks Goodwood Mall is a pharmacy and health, beauty and personal-care retailer inside Goodwood Mall, offering prescription dispensing alongside its usual range of over-the-counter medicines and toiletries.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Tue 08:00-17:00, Wed 09:00-17:00, Thu-Sat 08:00-17:00, Sun 09:00-14:00'
WHERE slug = 'clicks-goodwood-mall-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Durbanville Fisheries is a fish and chips takeaway in Durbanville Town Centre with Portuguese and South African roots dating back to 1955, serving fresh fish alongside classic seafood takeaway fare.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-18:00, Sat 08:00-16:00, Sun Closed'
WHERE slug = 'durbanville-fisheries-durbanville' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Factory Toy Shop is a toy store on Voortrekker Road in Parow, stocking a range of toys and games for children.',
    description_enriched_at = datetime('now')
WHERE slug = 'factory-toy-shop-parow' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Jordan Footwear Factory Outlet is a footwear factory shop on Voortrekker Road in Goodwood, selling Jordan-branded stock alongside other footwear brands including Bolton, Barker and Watson for men, women and children.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-17:30, Sat 08:30-15:00, Sun 09:00-14:00'
WHERE slug = 'jordan-footwear-factory-outlet-goodwood' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Leopards Panel Beaters is an auto body repair shop in Epping offering panel beating and spray painting, along with dent repair, rust removal, scratch removal and leak detection.',
    description_enriched_at = datetime('now')
WHERE slug = 'leopards-panel-beaters-epping' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lily''s is an all-day eatery on Mouille Point''s Beach Road strip, serving breakfast, lunch and dinner in a space known for its playful, whimsical decor.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:00-22:00',
    source_urls = '["https://www.kovecollection.co.za/lilys/", "https://www.sluurpy.co.za/cape-town-central/restaurant/4731737/lily-s-restaurant", "https://insideguide.co.za/cape-town/restaurants/lilys/"]'
WHERE slug = 'lilys-mouille-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lime Tree Café is a restaurant and deli in Bergvliet''s Sherwood Centre that has served the surrounding area for over 11 years, with a menu spanning breakfast items like croissants and tartines through to lunch and dinner.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 08:00-16:30, Tue-Sat 08:00-22:00, Sun 08:30-16:30'
WHERE slug = 'lime-tree-cafe-bergvliet' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lira & Fynn is a women''s fashion boutique in Waterstone Village offering a curated range of locally designed and made clothing, with sister stores in Stellenbosch, Paarl and George.',
    description_enriched_at = datetime('now'),
    source_urls = '["https://www.waterstonevillage.co.za", "https://findngo.com/waterstone-village", "https://lirafynn.com/pages/about-us"]'
WHERE slug = 'lira-fynn-somerset-west' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lite-Kem Camps Bay Pharmacy is a pharmacy in The Promenade on Victoria Road, Camps Bay, offering prescription dispensing and everyday health and beauty essentials.',
    description_enriched_at = datetime('now')
WHERE slug = 'lite-kem-camps-bay-pharmacy' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Lupa Osteria Durbanville is an Italian restaurant in The Village Square serving authentic Roman-style dining, with homemade pasta and wood-fired pizza made using imported Italian flour.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sat 12:00-22:00, Sun 12:00-21:00'
WHERE slug = 'lupa-osteria-durbanville' AND description_enriched_at IS NULL;
