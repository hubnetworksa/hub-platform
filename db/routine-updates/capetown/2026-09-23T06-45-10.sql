-- Job 1/2: mandalay suburb research, 1 new shopping centre + 2 tenants
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'mandalay-mall-mandalay', 'Mandalay Mall',
  (SELECT id FROM suburbs WHERE slug = 'mandalay'),
  'Swartklip Road, Mandalay, Khayelitsha, Cape Town, 7784', NULL, NULL,
  '["https://www.kimbino.co.za/stores/ackermans-swartklip-road-mandalay-mall/", "https://my-catalogue.co.za/stores/cape-town/ackermans/swartklip-road-mandalay-khayelitsha"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-mandalay-mandalay', 'Shoprite Mandalay',
  (SELECT id FROM suburbs WHERE slug = 'mandalay'),
  (SELECT id FROM shopping_centers WHERE slug = 'mandalay-mall-mandalay'),
  'Mandalay Mall, Swartklip Road, Mandalay, Khayelitsha, Cape Town, 7785', '021 980 8410', NULL, NULL,
  'Shoprite Mandalay is a supermarket in Mandalay Mall, offering groceries and a meat market, bakery and deli, in Mandalay.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Khayelitsha/Shoprite-Mandalay/store-details/34752", "https://vymaps.com/ZA/Shoprite-Mandalay-597800/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-mandalay-mandalay'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-mandalay-mandalay', 'Ackermans',
  (SELECT id FROM suburbs WHERE slug = 'mandalay'),
  (SELECT id FROM shopping_centers WHERE slug = 'mandalay-mall-mandalay'),
  'Shop 4, Mandalay Mall, Swartklip Road, Mandalay, Khayelitsha, Cape Town, 7784', '021 387 0126', NULL, NULL,
  'Ackermans is a value retailer of affordable ladies'' and children''s clothing, footwear and cellular products, in Mandalay Mall, Mandalay.',
  NULL, NULL,
  '["https://www.kimbino.co.za/stores/ackermans-swartklip-road-mandalay-mall/", "https://my-catalogue.co.za/stores/cape-town/ackermans/swartklip-road-mandalay-khayelitsha"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-mandalay-mandalay'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
