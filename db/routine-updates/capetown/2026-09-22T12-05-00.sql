INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'evertsdal-guest-house-eversdal', 'Evertsdal Guest House',
  (SELECT id FROM suburbs WHERE slug = 'eversdal'),
  '1 Gillian Street, Eversdal, Durbanville, Cape Town', '021 919 1752', NULL, NULL,
  'Evertsdal Guest House is a guest house in Eversdal, Durbanville, offering rooms with a garden and swimming pool.',
  NULL, NULL,
  '["https://evertsdal.com/", "https://www.tripadvisor.com/Hotel_Review-g1057715-d2177211-Reviews-Evertsdal_Guesthouse-Durbanville_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'evertsdal-guest-house-eversdal'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eversdal-primary-school-eversdal', 'Eversdal Primary School',
  (SELECT id FROM suburbs WHERE slug = 'eversdal'),
  'Stepping Stones Road, Eversdal, Durbanville, Cape Town, 7551', '021 976 8134', NULL, NULL,
  'Eversdal Primary School is a government primary school in Eversdal, Durbanville.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/wc/cape-town/eversdal-primary-school", "https://textmap.co.za/3/39720"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eversdal-primary-school-eversdal'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eversdal-pre-primary-school-eversdal', 'Eversdal Pre-Primary School',
  (SELECT id FROM suburbs WHERE slug = 'eversdal'),
  'Mountainview Road, Eversdal, Durbanville, Cape Town, 7551', '021 919 3213', NULL, NULL,
  'Eversdal Pre-Primary School is a Grade R pre-primary school in Eversdal, Durbanville.',
  NULL, NULL,
  '["https://durbanvillehub.com/directory/schools/eversdal-pre-primary-school", "https://www.holakids.co.za/centre/eversdal-pre-primary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eversdal-pre-primary-school-eversdal'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
