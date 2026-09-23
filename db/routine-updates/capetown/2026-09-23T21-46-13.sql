INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shin-thai-asian-kitchen-marina-da-gama', 'Shin Thai Asian Kitchen',
  (SELECT id FROM suburbs WHERE slug = 'marina-da-gama'),
  (SELECT id FROM shopping_centers WHERE slug = 'eastlake-shopping-centre-marina-da-gama'),
  '40 Eastlake Drive, Marina Da Gama, Muizenberg, Cape Town, 7945', '021 788 6765', NULL, NULL,
  'Shin Thai Asian Kitchen is a Thai and sushi restaurant in Eastlake Shopping Centre, Marina Da Gama, open for dinner seven nights a week.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1509162-d6032287-Reviews-Shin_Thai_Asian_Kitchen-Muizenberg_Western_Cape.html", "https://www.dining-out.co.za/md-menu/Shin-Thai-Asian-Kitchen-Marina-Da-Gama/4353"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shin-thai-asian-kitchen-marina-da-gama'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eastlake-barber-shop-marina-da-gama', 'Eastlake Barber Shop',
  (SELECT id FROM suburbs WHERE slug = 'marina-da-gama'),
  (SELECT id FROM shopping_centers WHERE slug = 'eastlake-shopping-centre-marina-da-gama'),
  'Shop 13, Eastlake Shopping Centre, Eastlake Drive, Marina Da Gama, Muizenberg, Cape Town, 7945', '081 414 4250', NULL, NULL,
  'Eastlake Barber Shop is a barber shop in Eastlake Shopping Centre, Marina Da Gama.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/eastlake-barber-shop-cape-town-Wq8lkX", "https://www.facebook.com/p/EastLake-Barber-Shop-100062782496644/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eastlake-barber-shop-marina-da-gama'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
