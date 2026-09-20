INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'the-paddocks-shopping-centre-milnerton', 'The Paddocks Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  'Cnr Racecourse Rd & Marine Dr, Milnerton, Cape Town', NULL, NULL,
  '["https://thepaddocks.co.za/", "https://www.sa-venues.com/things-to-do/westerncape/paddocks-shopping-centre/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'moksh-indian-restaurant-milnerton', 'MoKsh Indian Restaurant Paddocks Milnerton',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-paddocks-shopping-centre-milnerton'),
  'The Paddocks Shopping Centre, Racecourse Rd, Milnerton, Cape Town', '021 525 9343', NULL, NULL,
  'MoKsh Indian Restaurant Paddocks Milnerton is an Indian restaurant inside The Paddocks Shopping Centre in Milnerton.',
  NULL, NULL,
  '["https://mokshrestaurants.com/paddocks-milnerton/", "https://www.facebook.com/Mokshrestaurantpaddocksmilnerton/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'moksh-indian-restaurant-milnerton'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'west-coast-fisheries-milnerton', 'West Coast Fisheries Milnerton',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  '424 Koeberg Rd, Tijgerhof, Milnerton, Cape Town', '021 555 0538', NULL, NULL,
  'West Coast Fisheries Milnerton is a seafood take-away and licensed restaurant on Koeberg Road, serving fish and chips, calamari and fresh snoek and hake.',
  NULL, NULL,
  '["https://westcoastfisheries.co.za/milnerton-menu/", "https://www.facebook.com/WestCoastFisheriesMilnerton/", "https://www.mrdfood.com/food-delivery/restaurant/west-coast-fisheries-milnerton_milnerton/11190"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'west-coast-fisheries-milnerton'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
