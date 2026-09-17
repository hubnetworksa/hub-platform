INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-mall-lebo-lebowakgomo', 'Mr Price Mall@Lebo',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-lebo-lebowakgomo'),
  'Shop 11, Mall@Lebo, Cnr R518 & R579, Lebowakgomo, 0737', '087 049 6836', NULL, NULL,
  'Mr Price Mall@Lebo is a branch of the Mr Price clothing retail chain, in Mall@Lebo, Lebowakgomo.',
  NULL, NULL,
  '["https://mallatlebo.co.za/business-directory/mr-price/", "https://www.mrp.com/en_za/store/mr-price-lebowakgomo"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-price-mall-lebo-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jet-mall-lebo-lebowakgomo', 'Jet Mall@Lebo',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  (SELECT id FROM shopping_centers WHERE slug = 'mall-lebo-lebowakgomo'),
  'Shop 31, Mall@Lebo, Cnr R518 & R579, Lebowakgomo, 0737', '015 633 0891', NULL, NULL,
  'Jet Mall@Lebo is a branch of the Jet discount clothing and footwear retail chain, in Mall@Lebo, Lebowakgomo.',
  NULL, NULL,
  '["https://mallatlebo.co.za/business-directory/jet/", "https://www.jetonline.co.za/directory/jet-mall-lebowakgomo/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jet-mall-lebo-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
