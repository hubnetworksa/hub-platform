INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'die-boer-restaurant-durbanville', 'Die Boer Restaurant Teater',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  '6 Chenoweth Street, Durbanville, Cape Town, 7550', '021 979 1911', NULL, NULL,
  'Die Boer Restaurant Teater is a dinner-theatre restaurant on Chenoweth Street, in Durbanville.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1057715-d3600478-Reviews-Die_Boer-Durbanville_Western_Cape.html", "https://dieboer.com/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'die-boer-restaurant-durbanville'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'essential-health-pharmacy-clara-anna-durbanville', 'Essential Health Pharmacy Clara Anna',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  'Shop 10, Clara Anna Fontein, 1 Shamwari Close, Durbanville, 7550', '021 879 1148', NULL, NULL,
  'Essential Health Pharmacy Clara Anna is a pharmacy in the Clara Anna Fontein area of Durbanville.',
  NULL, NULL,
  '["https://www.recomed.co.za/clinic/durbanville/essential-health-pharmacy-clara-anna/33834/", "https://essentialhealth.co.za/pages/essential-health-pharmacy-br-durbanville"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'essential-health-pharmacy-clara-anna-durbanville'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
