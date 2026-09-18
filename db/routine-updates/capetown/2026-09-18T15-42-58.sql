-- Suburb: mouille-point (jobs 1-2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lilys-mouille-point', 'Lily''s',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  'Shop 1, East West Building, Corner Beach Road & Surrey Place, Mouille Point, Cape Town', '021 204 8545', 'https://www.kovecollection.co.za/lilys/', 'info@lilysrestaurant.co.za',
  'Lily''s is an all-day eatery on Mouille Point''s Beach Road strip serving contemporary comfort food from breakfast through dinner.',
  NULL, NULL,
  '["https://www.kovecollection.co.za/lilys/", "https://www.sluurpy.co.za/cape-town-central/restaurant/4731737/lily-s-restaurant"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lilys-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cafe-neo-mouille-point', 'Café Neo',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  '129 Beach Road, Mouille Point, Cape Town', '021 433 0849', NULL, NULL,
  'Café Neo is a Greek-inspired café and deli on Mouille Point''s beachfront, opposite the lighthouse, serving coffee and fresh food throughout the day.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/cafe-neo/", "https://za.africabz.com/western-cape/caffe-neo-1294"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cafe-neo-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'greek-club-restaurant-mouille-point', 'The Greek Club Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  '24 Bay Road, Mouille Point, Cape Town', '021 801 4514', NULL, NULL,
  'The Greek Club Restaurant is a Greek restaurant on Bay Road in Mouille Point serving traditional Greek cuisine for lunch and dinner.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/the-greek-club-restaurant", "https://za.africabz.com/western-cape/the-greek-club-restaurant-278341"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'greek-club-restaurant-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'newport-market-and-deli-mouille-point', 'Newport Market & Deli',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  '125 Beach Road, Mouille Point, Cape Town', '021 439 1538', 'https://www.newportdeli.co.za/', 'admin@newportdeli.co.za',
  'Newport Market & Deli is an artisanal cafe, sourdough bakery and deli on Mouille Point''s Beach Road.',
  NULL, NULL,
  '["https://www.newportdeli.co.za/contact-us/", "https://www.sa-venues.com/things-to-do/westerncape/coffee-and-breakfast-at-newport-deli/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'newport-market-and-deli-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sotano-mouille-point', 'Sotano',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  '121 Beach Road, Mouille Point, Cape Town', '021 433 1757', 'https://www.sotano.co.za', 'info@sotano.co.za',
  'Sotano is a seafood restaurant with a Mediterranean influence on Mouille Point''s Beach Road, open daily from breakfast through dinner.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/sotano-by-caveau/", "https://www.dining-out.co.za/md/Sotano-by-Caveau/5732"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sotano-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
