INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'village-hub-scarborough', 'The Village Hub',
  (SELECT id FROM suburbs WHERE slug = 'scarborough'),
  '2 Watsonia Road, Scarborough, Cape Town, 7975', NULL, NULL,
  '["https://www.thevillagehub.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g1862926-d5849590-Reviews-The_Village_Hub-Scarborough_Western_Cape.html"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'camel-rock-restaurant-scarborough', 'Camel Rock Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'scarborough'),
  '264 Main Road, Scarborough, Cape Town', '021 780 1122', NULL, NULL,
  'Camel Rock Restaurant is a family restaurant in Scarborough serving fresh fish and seafood dishes with views over the beach.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/Camel-Rock-Restaurant/10267", "https://www.sa-venues.com/things-to-do/westerncape/camel-rock-restaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'camel-rock-restaurant-scarborough'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'whole-earth-cafe-scarborough', 'Whole Earth Cafe',
  (SELECT id FROM suburbs WHERE slug = 'scarborough'),
  '96 Main Road, Scarborough, Cape Town, 7975', '021 780 1138', NULL, NULL,
  'Whole Earth Cafe is a cafe in Scarborough offering fresh, ethical cuisine with dine-in and outdoor seating.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/whole-earth-cafe/", "https://www.dining-out.co.za/md-menu/Whole-Earth-Cafe/10266", "https://www.wholeearthcollection.com/menu-wholeearthcafe"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'whole-earth-cafe-scarborough'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sopra-scarborough', 'Sopra',
  (SELECT id FROM suburbs WHERE slug = 'scarborough'),
  (SELECT id FROM shopping_centers WHERE slug = 'village-hub-scarborough'),
  'Cnr Watsonia & Main, The Village Hub, Scarborough, Cape Town, 7975', '021 780 1047', 'https://www.sopra.co.za/', NULL,
  'Sopra is an intimate Italian restaurant at The Village Hub in Scarborough, serving handmade pasta and wood-fired pizza.',
  NULL, NULL,
  '["https://www.sopra.co.za/", "https://www.thevillagehub.co.za/sopra/", "https://restaurants-in-cape-town.co.za/restaurants/sopra/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sopra-scarborough'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'foragers-deli-wholefoods-scarborough', 'Foragers Deli & Wholefoods',
  (SELECT id FROM suburbs WHERE slug = 'scarborough'),
  (SELECT id FROM shopping_centers WHERE slug = 'village-hub-scarborough'),
  '2 Watsonia Lane, The Village Hub, Scarborough, Cape Town, 7975', '021 780 1047', NULL, NULL,
  'Foragers Deli & Wholefoods is a deli and whole-foods store at The Village Hub in Scarborough, offering deli-made meals, organic produce and pantry staples.',
  NULL, NULL,
  '["https://www.thevillagehub.co.za/foragers", "https://foursquare.com/v/foragers-deli--wholefoods/56eff97d498e9b717c5854e2", "https://www.tripadvisor.com/Restaurant_Review-g1722390-d19249873-Reviews-Foragers_Deli_Whole_Foods_Store-Cape_Town_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'foragers-deli-wholefoods-scarborough'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'roberto-ricci-designs-scarborough', 'Roberto Ricci Designs',
  (SELECT id FROM suburbs WHERE slug = 'scarborough'),
  (SELECT id FROM shopping_centers WHERE slug = 'village-hub-scarborough'),
  '2 Watsonia on Main Road, The Village Hub, Scarborough, Cape Town, 7975', '083 770 3119', 'https://robertoriccidesigns.com/', NULL,
  'Roberto Ricci Designs is a clothing boutique at The Village Hub in Scarborough, selling Italian-designed outdoor apparel for men, women and children.',
  NULL, NULL,
  '["https://www.thevillagehub.co.za/roberto-ricci-design/", "https://za.locale.online/roberto-ricci-designs-scarborough-2111060499.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'roberto-ricci-designs-scarborough'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
