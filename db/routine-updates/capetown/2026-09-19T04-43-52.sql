-- Jobs 1-2: new businesses discovered in Camps Bay, Fresnaye, Three Anchor Bay

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mantra-cafe-camps-bay', 'Mantra Cafe',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  '1st Floor, 43 Victoria Road, Camps Bay, Cape Town', '021 437 0206', NULL, 'campsbay@melissas.co.za',
  'Mantra Cafe is a cafe and restaurant on Victoria Road in Camps Bay.',
  NULL, NULL,
  '["https://www.mantracafe.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g312658-d11916221-Reviews-Mantra_Cafe-Camps_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mantra-cafe-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'surfshack-camps-bay', 'Surfshack',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  '201 The Promenade, Victoria Road, Camps Bay, Cape Town', '021 437 1802', NULL, 'info@surfshackdiner.co.za',
  'Surfshack is a beachfront diner at The Promenade in Camps Bay, serving cocktails, shareables and wood-fired pizza with sea views.',
  NULL, NULL,
  '["https://www.kovecollection.co.za/surfshack/", "https://www.tripadvisor.com/Restaurant_Review-g312658-d19254567-Reviews-Surfshack-Camps_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'surfshack-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'la-belle-bistro-bakery-camps-bay', 'La Belle Bistro & Bakery',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  '201 The Promenade, Victoria Road, Camps Bay, Cape Town', '021 437 1278', NULL, NULL,
  'La Belle Bistro & Bakery is a bistro and bakery at The Promenade in Camps Bay, serving bistro fare alongside freshly baked pastries.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312658-d7021776-Reviews-La_Belle_Bistro_Bakery-Camps_Bay_Western_Cape.html", "https://www.sa-venues.com/things-to-do/westerncape/la-belle-bistro-and-bakery/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'la-belle-bistro-bakery-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'gelato-mania-camps-bay', 'Gelato Mania',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  'Shop 11, Ground Floor, The Promenade, Victoria Road, Camps Bay, Cape Town', '078 696 5055', NULL, NULL,
  'Gelato Mania is a gelato and ice cream shop at The Promenade in Camps Bay.',
  NULL, NULL,
  '["https://gelatomania.co.za/camps-bay/", "https://za.africabz.com/western-cape/gelato-mania-183447"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gelato-mania-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'grande-kloof-boutique-hotel-fresnaye', 'Grande Kloof Boutique Hotel',
  (SELECT id FROM suburbs WHERE slug = 'fresnaye'),
  '69 Kloof Road, Fresnaye, Cape Town, 8005', '021 434 2220', 'https://www.grandekloof.co.za/', 'service@grandekloof.co.za',
  'Grande Kloof Boutique Hotel is a boutique hotel on Kloof Road in Fresnaye, offering rooms, backpacker beds and apartments.',
  NULL, NULL,
  '["https://www.grandekloof.co.za/", "https://www.sa-venues.com/visit/grandekloof/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'grande-kloof-boutique-hotel-fresnaye'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bootlegger-three-anchor-bay', 'Bootlegger Coffee Company (Three Anchor Bay)',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '257 Main Road, Three Anchor Bay, Cape Town, 8005', '021 201 7275', NULL, NULL,
  'Bootlegger Coffee Company (Three Anchor Bay) is a branch of the Cape Town coffee shop chain, at the corner of Camberwell and Main Road.',
  NULL, NULL,
  '["https://ourcafes.bootlegger.coffee/FoodDrink-CapeTown-BootleggerThreeAnchorBayHalaal", "https://www.facebook.com/bootleggercoffeecompany/posts/-bootlegger-three-anchor-bay-co-camberwell-main-road-257-main-road-three-anchor-/2957585187615497/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bootlegger-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-shop-restaurant-three-anchor-bay', 'The Shop Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '3 Three Anchor Bay Road, Three Anchor Bay, Cape Town', '083 782 5240', 'https://www.theshoprestaurant.co.za', NULL,
  'The Shop Restaurant is a casual bistro-style restaurant on Three Anchor Bay Road.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/the-shop/", "https://crushmag-online.com/the-shop-restaurant-sea-point/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-shop-restaurant-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
