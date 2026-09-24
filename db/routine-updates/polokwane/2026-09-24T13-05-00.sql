INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'truworths-seshego', 'Truworths',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  (SELECT id FROM shopping_centers WHERE slug = 'seshego-circle-seshego'),
  'Shop 22, Seshego Circle, Ditlou Street, Seshego, Polokwane, 0742', '015 296 3632', NULL, NULL,
  'Truworths is a fashion and clothing retailer in Seshego Circle, Seshego.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/seshego/truworths-seshego-circle/76349", "https://www.facebook.com/Seshegocircle/photos/our-storeoftheday-today-is-our-truworths-fashion-what-is-your-favorite-item-to-b/1052693855428793/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'truworths-seshego'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'exact-seshego', 'Exact',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  (SELECT id FROM shopping_centers WHERE slug = 'seshego-circle-seshego'),
  'Shop 2C, Seshego Circle, Ditlou Street, Seshego, Polokwane, 0742', '015 233 9341', NULL, NULL,
  'Exact is a fashion and clothing retailer in Seshego Circle, Seshego.',
  NULL, NULL,
  '["https://businessfindersa.com/business/exact-seshego/", "https://south-africa.africa-places.com/places/exact-seshego-shop-2c"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'exact-seshego'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
