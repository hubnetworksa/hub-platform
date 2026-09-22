INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bradlows-gugulethu-square-gugulethu', 'Bradlows',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Shop 57, Gugulethu Square, Gugulethu, Cape Town, 7751', '021 633 1478', NULL, NULL,
  'Bradlows is a branch of the national furniture and appliance retailer, in Gugulethu Square.',
  NULL, NULL,
  '["https://www.bradlows.co.za/store/gugulethu-mall", "https://www.tiendeo.co.za/stores/guguletu/bradlows-shop-gugulethu-square-gugulethu/14712"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bradlows-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'markham-gugulethu-square-gugulethu', 'Markham',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Shop 64, Gugulethu Square, Cnr NY1 & NY3, Gugulethu, Cape Town, 7750', '021 630 1988', NULL, NULL,
  'Markham is a branch of the men''s fashion retail chain, in Gugulethu Square.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/markham-shop-gugulethu-square-cnr-ny-ny-roads/72725", "https://www.sayellow.com/view/south-africa/markham-gugulethu-square-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'markham-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jam-clothing-gugulethu-square-gugulethu', 'JAM Clothing',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Shop 15, Gugulethu Square, Cnr NY25 & Steve Biko Drive, Gugulethu, Cape Town, 7750', '021 879 1808', NULL, NULL,
  'JAM Clothing is a branch of the value fashion retail chain, in Gugulethu Square.',
  NULL, NULL,
  '["https://jamclothing.co.za/stores/jam-gugulethu-gugulethu/", "https://www.facebook.com/JAMClothingGugulethuSquare/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jam-clothing-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
