INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wingate-park-country-club-wingate-park', 'Wingate Park Country Club',
  (SELECT id FROM suburbs WHERE slug = 'wingate-park'),
  '539 Norval St, Wingate Park, Pretoria, 0153', '012 997 1312', 'https://wingateparkcountryclub.co.za', 'admin@wingatecc.co.za',
  'Wingate Park Country Club is a sports and social club established in 1947, with an eighteen-hole championship golf course, five bowling greens, four tennis courts, a road-running club and a licensed restaurant, in Wingate Park.',
  NULL, NULL,
  '["https://www.sa-venues.com/golf/wingate-park-country-club.php", "https://where2golf.com/south-africa/wingate-park-country-club"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wingate-park-country-club-wingate-park'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-angels-place-boutique-hotel-wingate-park', 'The Angels Place Boutique Hotel',
  (SELECT id FROM suburbs WHERE slug = 'wingate-park'),
  '610 Rubenstein Dr, Moreleta Park, Pretoria, 0044', '012 997 7018', 'https://www.theangelsplace.co.za', NULL,
  'The Angels Place Boutique Hotel is a 12-room boutique guest house in Moreleta Park with views over Moreleta Kloof, offering free Wi-Fi, room service, laundry service and free onsite parking.',
  NULL, NULL,
  '["https://www.amimagazine.global/Meeting-Event-Venues/Pretoria-South-Africa/Convention-Hotel/The-Angels-Place-Boutique-Guest-House-p58000705", "https://www.vn.kayak.com/Pretoria-Hotels-The-Angels-Place-Boutique-Hotel.753273.len.ksp"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-angels-place-boutique-hotel-wingate-park'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blue-diamond-boutique-hotel-wingate-park', 'Blue Diamond Boutique Hotel',
  (SELECT id FROM suburbs WHERE slug = 'wingate-park'),
  '761 Rubenstein Rd, Moreleta Park, Pretoria, 0044', '012 940 5222', 'https://bluediamond.co.za', 'rooms@bluediamond.co.za',
  'Blue Diamond Boutique Hotel is a boutique hotel in Moreleta Park offering four room types, a swimming pool, fitness centre, steam room and the Gemstone Restaurant, serving breakfast, lunch and dinner.',
  NULL, NULL,
  '["https://bluediamond.co.za", "https://www.za.kayak.com/Pretoria-Hotels-Blue-Diamond-Boutique-Hotel.466854.ksp"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'blue-diamond-boutique-hotel-wingate-park'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);
