INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cest-la-vie-fish-hoek', 'C''est La Vie',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  '2A Recreation Road, Fish Hoek, Cape Town, 7975', '083 676 7430', NULL, NULL,
  'C''est La Vie is a French-style artisan bakery and coffee shop in Fish Hoek, serving breakfast and light lunches.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/cest-la-vie/", "https://za.africabz.com/western-cape/cest-la-vie-82581"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cest-la-vie-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fish-hoek-fisheries-fish-hoek', 'Fish Hoek Fisheries',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  '43 Main Road, Fish Hoek, Cape Town, 7975', '021 782 2314', NULL, NULL,
  'Fish Hoek Fisheries is a fish and chips takeaway on Main Road in Fish Hoek.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g635515-d3308075-Reviews-Fish_Hoek_Fisheries-Fish_Hoek_Western_Cape.html", "https://www.eatout.co.za/venue/fish-hoek-fisheries/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fish-hoek-fisheries-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'barracudas-fish-hoek', 'Barracudas',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  'Cnr Beach Road & Recreation Road, Fish Hoek, Cape Town, 7975', '064 126 6499', NULL, NULL,
  'Barracudas is a family seafood restaurant on the Fish Hoek beachfront.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g635515-d3308123-Reviews-Barracudas-Fish_Hoek_Western_Cape.html", "https://www.baracudas.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barracudas-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bhandaris-indian-restaurant-fish-hoek', 'Bhandaris Indian Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  '144 Main Road, Fish Hoek, Cape Town', '021 782 1525', NULL, NULL,
  'Bhandaris Indian Restaurant serves North Indian cuisine in Fish Hoek, with dine-in, takeaway and outdoor seating.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g635515-d1988115-Reviews-Bhandaris_Indian_Restaurant-Fish_Hoek_Western_Cape.html", "https://www.eatout.co.za/venue/bhandaris-indian-restaurant-fish-hoek/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bhandaris-indian-restaurant-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
