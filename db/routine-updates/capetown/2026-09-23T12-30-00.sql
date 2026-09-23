INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bargain-books-bayside-mall-table-view', 'Bargain Books Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  'Shop 36, Bayside Mall, Cnr Blaauwberg Rd & Otto du Plessis Dr, Table View, Cape Town, 7441', '021 557 0594', NULL, NULL,
  'Bargain Books Bayside Mall is a discount bookstore inside Bayside Mall, Table View.',
  NULL, NULL,
  '["https://readymap.co.za/106904/23408", "https://www.sa-venues.com/things-to-do/westerncape/bayside-mall/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bargain-books-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mugg-and-bean-bayside-mall-table-view', 'Mugg & Bean Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  'Shop 14, Bayside Mall, Blaauwberg Road, Table View, Cape Town', '021 556 9802', NULL, NULL,
  'Mugg & Bean Bayside Mall is a coffee, breakfast and lunch restaurant inside Bayside Mall, Table View.',
  NULL, NULL,
  '["https://themugg.com/mugg_stores/Bayside-Mall/", "https://www.tripadvisor.com/Restaurant_Review-g2427200-d10084479-Reviews-Mugg_Bean_Bayside_Mall-Table_View_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mugg-and-bean-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vida-e-caffe-bayside-mall-table-view', 'Vida e Caffe Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  'Bayside Centre, Cnr West Coast Rd & Blaauwberg Rd, Table View, Cape Town', '021 556 5479', NULL, NULL,
  'Vida e Caffe Bayside Mall is a coffee shop inside Bayside Mall, Table View.',
  NULL, NULL,
  '["https://baysidemall.co.za/stores/vida-e-caffe/", "https://www.facebook.com/vidabayside/mentions/", "https://www.tripadvisor.co.za/Restaurant_Review-g2427200-d14102530-Reviews-Vida_e_caffe-Table_View_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vida-e-caffe-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hair-drosa-table-view', "Hair D'Rosa",
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  '184 Blaauwberg Rd, Table View, Cape Town, 7441', '083 282 6043', NULL, NULL,
  "Hair D'Rosa is a hair salon on Blaauwberg Road, Table View.",
  NULL, NULL,
  '["https://www.facebook.com/p/Hair-D-Rosa-100076285716254/", "https://www.fresha.com/lvp/hair-drosa-blaauwberg-road-cape-town-Ly9xe9"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hair-drosa-table-view'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
