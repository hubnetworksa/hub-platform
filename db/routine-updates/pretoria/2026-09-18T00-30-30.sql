INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'virgin-active-highveld', 'Virgin Active Centurion (Byls Bridge)',
  (SELECT id FROM suburbs WHERE slug = 'highveld'),
  (SELECT id FROM shopping_centers WHERE slug = 'byls-bridge-promenade-highveld'),
  'Byls Bridge Promenade, Bloukrans Rd, Highveld, Centurion, 0157', '012 665 0304', NULL, NULL,
  'Virgin Active Centurion (Byls Bridge) is a health and fitness club in Byls Bridge Promenade, Highveld.',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/virgin-active-centurion-18034", "http://2pos.co.za/4/20776/virgin-active-health-club"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'virgin-active-highveld'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sportsmans-warehouse-highveld', 'Sportsmans Warehouse Centurion',
  (SELECT id FROM suburbs WHERE slug = 'highveld'),
  (SELECT id FROM shopping_centers WHERE slug = 'byls-bridge-promenade-highveld'),
  'Shop 2, Byls Bridge Promenade, 501 Bloukrans Road, Highveld, Centurion, 0157', '012 665 0768', NULL, NULL,
  'Sportsmans Warehouse Centurion is a sporting goods retailer at Shop 2, Byls Bridge Promenade, Highveld.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/15675060_2", "https://za.africabz.com/gauteng/sportsmans-warehouse-centurion-5151"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sportsmans-warehouse-highveld'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-byls-bridge-highveld', 'Pick n Pay Byls Bridge',
  (SELECT id FROM suburbs WHERE slug = 'highveld'),
  (SELECT id FROM shopping_centers WHERE slug = 'byls-bridge-promenade-highveld'),
  'Koaline Dr, Byls Bridge Promenade, Highveld, Centurion, 0157', '012 665 2295', NULL, NULL,
  'Pick n Pay Byls Bridge is a supermarket in Byls Bridge Promenade, Highveld.',
  NULL, NULL,
  '["https://www.yellowpages.net.za/phone-27-126652295-convenience-store-Centurion-ZA115791.html", "https://za.africabz.com/gauteng/pick-n-pay-byls-bridge-26216"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-byls-bridge-highveld'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bidvest-waltons-highveld', 'Bidvest Waltons Centurion',
  (SELECT id FROM suburbs WHERE slug = 'highveld'),
  (SELECT id FROM shopping_centers WHERE slug = 'byls-bridge-promenade-highveld'),
  'Shop 10, Byls Bridge Promenade, Bloukrans Road, Highveld, Centurion, 0157', '012 665 5053', NULL, NULL,
  'Bidvest Waltons Centurion is an office and stationery supplies store at Shop 10, Byls Bridge Promenade, Highveld.',
  NULL, NULL,
  '["https://za.africabz.com/gauteng/bidvest-waltons-centurion-236384", "https://www.tiendeo.co.za/stores/centurion/bidvest-waltons-shop-byls-bridge-promenade-bloukrans-road-off-john-voster-drive-highveld/60802"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bidvest-waltons-highveld'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'poorguys-fast-food-highveld', 'Poor Guys Fast Food',
  (SELECT id FROM suburbs WHERE slug = 'highveld'),
  (SELECT id FROM shopping_centers WHERE slug = 'highveld-shopping-centre-highveld'),
  'Shop 4, Highveld Shopping Centre, 54 John Vorster Drive, Centurion, 0169', '060 682 8103', NULL, NULL,
  'Poor Guys Fast Food is a takeaway restaurant in Highveld Shopping Centre, Centurion.',
  NULL, NULL,
  '["https://www.facebook.com/PoorGuysFastFoodCenturion/", "https://za.africabz.com/gauteng/poor-guys-fast-food-12257"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'poorguys-fast-food-highveld'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'highveld-autoworks-highveld', 'Highveld Autoworks',
  (SELECT id FROM suburbs WHERE slug = 'highveld'),
  '48 Oak Avenue, Highveld Techno Park, Centurion, 0169', '010 109 1000', 'https://highveldautoworks.co.za', NULL,
  'Highveld Autoworks is a car mechanic and vehicle repair workshop in Highveld Techno Park, Centurion.',
  NULL, NULL,
  '["https://highveldautoworks.co.za/", "https://www.thebusinessdirectory.co.za/listings/highveld-autoworks-centurion/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'highveld-autoworks-highveld'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);
