UPDATE businesses
SET description = 'Food Lover''s Market Tokai, inside Tokai on Main, is a fresh produce and grocery supermarket stocking fruit, vegetables, meat and pantry goods.',
    description_enriched_at = datetime('now'),
    hours = 'Mon 09:00-19:00, Tue-Fri 08:00-19:00, Sat 08:00-18:00, Sun 08:00-16:00',
    source_urls = '["https://foodloversmarket.co.za/stores/western-cape/food-lovers-market-tokai/", "https://za.africabz.com/western-cape/food-lovers-market-tokai-8446", "https://my-catalogue.co.za/stores/tokai/food-lovers-market/tokai-on-main-main-road"]'
WHERE slug = 'food-lovers-market-tokai' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'GAME at Kenilworth Centre is a general merchandise retailer stocking electronics, appliances, homeware and more, at Shop 62 & 63 of the centre.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 08:00-19:00, Sat 08:00-18:00, Sun 09:00-17:00',
    source_urls = '["https://kenilworthcentre.co.za/stores/store-list/game/", "https://za.africabz.com/western-cape/game-46351", "https://my-catalogue.co.za/stores/kenilworth/game/kenilworth-centre-doncastor-road"]'
WHERE slug = 'game-kenilworth' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Gary Rom Man at Riverlands Mall is a barbershop and men''s grooming studio offering haircuts, shaves, hot towel facials, threading and waxing.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Fri 09:00-19:00, Sat-Sun 09:00-17:00'
WHERE slug = 'gary-rom-man-observatory' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Gary''s Surf School is a Muizenberg beachfront surf school established in 1989, offering surf lessons and board and wetsuit rental for beginners through intermediates.',
    description_enriched_at = datetime('now')
WHERE slug = 'garys-surf-school-muizenberg' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Gelato Mania at The Promenade in Camps Bay is a gelato and ice cream parlour on Victoria Road, open daily including public holidays.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 09:00-22:30'
WHERE slug = 'gelato-mania-camps-bay' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Giovanni''s Deliworld on Main Road in Green Point is a delicatessen and cafe offering breakfast, coffee and Italian deli produce, open daily from early morning to evening.',
    description_enriched_at = datetime('now'),
    hours = 'Mon-Sun 07:30-21:00'
WHERE slug = 'giovannis-deliworld-green-point' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Glen Country Club in Clifton is a private sports and social club offering tennis, padel and bowls facilities together with a clubhouse, set within the Clifton scenic reserve near Clifton Beach.',
    description_enriched_at = datetime('now')
WHERE slug = 'glen-country-club-clifton' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Golden Acre Dental Practice is a dental practice located within the Golden Acre shopping centre on Adderley Street in the Cape Town CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'golden-acre-dental-practice-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Golden Acre Pharmacy is a pharmacy located within the Golden Acre shopping centre on Adderley Street in the Cape Town CBD.',
    description_enriched_at = datetime('now')
WHERE slug = 'golden-acre-pharmacy-cape-town-cbd' AND description_enriched_at IS NULL;

UPDATE businesses
SET description = 'Grande Kloof Boutique Hotel is a 12-room boutique hotel on Kloof Road in Fresnaye, with views of Lion''s Head, the Atlantic Ocean and Robben Island, and guest amenities including a sauna, hot tub and terrace.',
    description_enriched_at = datetime('now')
WHERE slug = 'grande-kloof-boutique-hotel-fresnaye' AND description_enriched_at IS NULL;
