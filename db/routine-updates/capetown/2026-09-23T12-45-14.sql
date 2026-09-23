-- Milnerton: jobs 1-2 -- 2 new businesses

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'good-thyme-cafe-milnerton', 'Good Thyme Cafe',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  '20 Stodels Centre, Racecourse Road, Milnerton, Cape Town, 7441', '021 551 0881', NULL, NULL,
  'Good Thyme Cafe is a cafe inside Stodels Garden Centre in Milnerton, serving breakfast and lunch.',
  NULL, NULL,
  '["https://www.facebook.com/goodthymecafe/", "https://www.tripadvisor.com/Restaurant_Review-g312665-d19240618-Reviews-Good_Thyme_Cafe-Milnerton_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'good-thyme-cafe-milnerton'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-milnerton-milnerton', 'KFC Milnerton',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  '42 Koeberg Rd, Milnerton, Cape Town, 7441', '021 551 1024', 'https://locations.kfc.co.za/western-cape/milnerton/42-koeberg-rd', NULL,
  'KFC Milnerton is a branch of the KFC fast food chain on Koeberg Road in Milnerton.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/milnerton/42-koeberg-rd", "https://textmap.co.za/3/3171"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-milnerton-milnerton'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
