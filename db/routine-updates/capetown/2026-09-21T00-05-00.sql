-- Cape Town routine: Simon's Town suburb research (3 new standalone businesses)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'black-marlin-simons-town', 'Black Marlin',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  'Main Road, Millers Point, Simon''s Town, Cape Town, 7975', '021 786 1621', 'https://blackmarlin.co.za/', NULL,
  'Black Marlin is a seafood restaurant at Millers Point, Simon''s Town, in a historic former whaling-station building overlooking False Bay.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/black-marlin-restaurant-230818", "https://afktravel.com/restaurant/black-marlin/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'black-marlin-simons-town'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'salty-sea-dog-simons-town', 'Salty Sea Dog',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  '2 Wharf Street, Simon''s Town, Cape Town, 7995', '021 786 1918', 'https://saltyseadog.capetown/', NULL,
  'Salty Sea Dog is a casual seafood restaurant on the water''s edge at Simon''s Town jetty and harbour, known locally for its fish and chips.',
  NULL, NULL,
  '["https://www.trip.com/travel-guide/simon-s-town-30438-restaurant/salty-sea-dog-27449991/", "https://www.tripadvisor.com/Restaurant_Review-g319718-d1552127-Reviews-or30-Salty_Sea_Dog-Simon_s_Town_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'salty-sea-dog-simons-town'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pisces-divers-simons-town', 'Pisces Divers',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  'Good''s Shed, Main Road, Simon''s Town, Cape Town, 7975', '021 786 3799', 'https://piscesdivers.co.za/', NULL,
  'Pisces Divers is a PADI dive training centre in Simon''s Town offering scuba courses from beginner to instructor level, plus equipment rental, sales and servicing.',
  NULL, NULL,
  '["https://www.capetown.travel/listing/pisces-divers-scuba-diving/", "https://www.padi.com/dive-center/south-africa/pisces-divers/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pisces-divers-simons-town'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
