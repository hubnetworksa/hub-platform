INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clovelly-country-club-clovelly', 'Clovelly Country Club',
  (SELECT id FROM suburbs WHERE slug = 'clovelly'),
  '177 Clovelly Road, Clovelly, Cape Town', '021 784 2111', NULL, NULL,
  'Clovelly Country Club is a golf course and country club on Clovelly Road, offering golf, clubhouse dining and function facilities.',
  NULL, NULL,
  '["https://clovellygolfclub.co.za/contact/", "https://www.leadingcourses.com/clubs/africa+south-africa+western-cape/clovelly-country-club"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clovelly-country-club-clovelly'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'barstaurant-glencairn', 'BarStaurant',
  (SELECT id FROM suburbs WHERE slug = 'glencairn'),
  '14 Glen Road, Glencairn, Cape Town', '021 773 0220', NULL, NULL,
  'BarStaurant is a family-friendly restaurant at the historic Glencairn Hotel with sea views and a play area for kids.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/barstaurant-restaurant", "https://www.tripadvisor.co.za/Restaurant_Review-g3250511-d23141223-Reviews-BarStaurant-Glencairn_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barstaurant-glencairn'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dixies-restaurant-and-pub-glencairn', 'Dixies Restaurant and Pub',
  (SELECT id FROM suburbs WHERE slug = 'glencairn'),
  '134 Main Road, Glencairn, Cape Town, 7975', '021 786 3309', NULL, NULL,
  'Dixies Restaurant and Pub is a long-running coastal restaurant and pub on Main Road in Glencairn, known for its sea views, seafood, steak and wood-fired pizza.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/enjoy-a-cold-one-at-dixies-pub/", "https://www.dining-out.co.za/md/Dixies-Restaurant/987"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dixies-restaurant-and-pub-glencairn'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blended-health-cafe-and-catering-glencairn', 'Blended Health Cafe & Catering',
  (SELECT id FROM suburbs WHERE slug = 'glencairn'),
  '13 Glen Road, Glencairn, Cape Town, 7975', '083 554 1323', NULL, NULL,
  'Blended Health Cafe & Catering is a plant-based cafe and catering business on Glen Road in Glencairn.',
  NULL, NULL,
  '["https://blendedbar.co.za/contact-us/", "https://www.tripadvisor.co.za/Restaurant_Review-g3250511-d15058299-Reviews-Blended-Glencairn_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'blended-health-cafe-and-catering-glencairn'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
