INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-mandalay-mandalay', 'KFC Mandalay',
  (SELECT id FROM suburbs WHERE slug = 'mandalay'),
  (SELECT id FROM shopping_centers WHERE slug = 'mandalay-mall-mandalay'),
  'Shop 21, Thembokwezi Square, Swartklip Road, Mandalay, Khayelitsha, Cape Town, 7784', '021 387 0039', NULL, NULL,
  'KFC Mandalay is a fast food restaurant in Thembokwezi Square (Mandalay Mall), Mandalay, Khayelitsha.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/kfc-mandalay-68665", "https://www.tripadvisor.com/Restaurant_Review-g312659-d24168861-Reviews-KFC_Mandalay_Mall-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-mandalay-mandalay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'debonairs-pizza-mandalay-mandalay', 'Debonairs Pizza Mandalay',
  (SELECT id FROM suburbs WHERE slug = 'mandalay'),
  (SELECT id FROM shopping_centers WHERE slug = 'mandalay-mall-mandalay'),
  'Shop 12, Thembokwezi Square, Swartklip Road, Mandalay, Khayelitsha, Cape Town, 7784', '021 201 1391', NULL, NULL,
  'Debonairs Pizza Mandalay is a pizza takeaway and delivery outlet in Thembokwezi Square (Mandalay Mall), Mandalay, Khayelitsha.',
  NULL, NULL,
  '["https://redirect.foursquare.com/v/debonairs-pizza/5cc7432066fc65002c3c2603", "https://www.cylex.net.za/company/debonairs-pizza-23692605.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'debonairs-pizza-mandalay-mandalay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-mandalay-mandalay', 'PEP Mandalay',
  (SELECT id FROM suburbs WHERE slug = 'mandalay'),
  (SELECT id FROM shopping_centers WHERE slug = 'mandalay-mall-mandalay'),
  'Shop 5, Mandalay Mall, Swartklip Road, Mandalay, Khayelitsha, Cape Town, 7784', '021 387 0110', NULL, NULL,
  'PEP Mandalay is a discount clothing and general merchandise store in Mandalay Mall, Mandalay, Khayelitsha.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-mandalay-mall-swartklip-road-khayeltisha-cape-town-western-cape/70605", "https://rsa.worldorgs.com/catalog/cape-town/baby-clothing-store/pep-khayelitsha-mandalay"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-mandalay-mandalay'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-liquorshop-mandalay-mandalay', 'Shoprite LiquorShop Mandalay',
  (SELECT id FROM suburbs WHERE slug = 'mandalay'),
  (SELECT id FROM shopping_centers WHERE slug = 'mandalay-mall-mandalay'),
  'Shop 11, Mandalay Shopping Centre, Swartklip Road, Mandalay, Khayelitsha, Cape Town, 7785', '021 980 8410', NULL, NULL,
  'Shoprite LiquorShop Mandalay is a liquor store in Mandalay Mall, Mandalay, Khayelitsha.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/shoprite-liquorshop-mandalay-swartklip-road/55060", "https://rsa.worldorgs.com/catalog/cape-town/liquor-store/shoprite-liquorshop-mandalay"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-liquorshop-mandalay-mandalay'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);
