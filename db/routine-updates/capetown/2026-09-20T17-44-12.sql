INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'news-cafe-table-view-table-view', 'News Cafe Table View',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  '1 Beach Boulevard, Table View, Cape Town, 7439', '021 557 6336', NULL, NULL,
  'News Cafe Table View is a branch of the News Cafe restaurant and cocktail bar chain, on Beach Boulevard in Table View.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/News-Cafe-Table-View/3087", "https://nearbyza.com/place/news-cafe-table-view"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'news-cafe-table-view-table-view'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'randalls-place-hair-beauty-salon-table-view', 'Randalls Place Hair & Beauty Salon',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  '77 Wood Drive, Table View, Cape Town, 7441', '021 007 4413', NULL, NULL,
  'Randalls Place Hair & Beauty Salon is a hair and beauty salon on Wood Drive in Table View.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/randalls-place-hair-beauty-salon-tableview-83123", "https://www.waze.com/live-map/directions/za/wc/cape-town/randalls-place-hair-and-beauty-salon-tableview"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'randalls-place-hair-beauty-salon-table-view'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dischem-bayside-mall-table-view', 'Dis-Chem Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  'E31, Bayside Mall, Cnr Blaauwberg Road & Otto du Plessis Drive, Table View, Cape Town, 7441', '021 522 6140', NULL, NULL,
  'Dis-Chem Bayside Mall is a branch of the Dis-Chem pharmacy chain inside Bayside Mall in Table View.',
  NULL, NULL,
  '["https://www.dischem.co.za/malvern-park-queensburgh-2", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=291734"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dischem-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-bayside-mall-table-view', 'Clicks Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  'Bayside Mall, Cnr Blaauwberg Rd & Otto du Plessis Dr, Table View, Cape Town, 7441', '021 557 3893', NULL, NULL,
  'Clicks Bayside Mall is a branch of the Clicks pharmacy, health and beauty chain inside Bayside Mall in Table View.',
  NULL, NULL,
  '["https://clicks.co.za/store/Table-View/101", "https://za.africabz.com/western-cape/clicks-pharmacy-18714"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-bayside-mall-table-view', 'Woolworths Bayside Mall',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'bayside-mall-table-view'),
  'Bayside Mall, West Coast Road & Blaauwberg Road, Table View, Cape Town, 7441', '021 521 4611', NULL, NULL,
  'Woolworths Bayside Mall is a branch of the Woolworths food and fashion chain inside Bayside Mall in Table View.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/table-view/woolworths/bayside-centre-blaauwberg-rd", "https://www.gps-data-team.com/where/south_africa/store_locator/Woolworths-ZA/Woolworths-Tableview.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-bayside-mall-table-view'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
