INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'makhaza-shopping-centre-khayelitsha', 'Makhaza Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  'Corner Japhta K Masemola Road & Cekeca Road, Makhaza, Khayelitsha, Cape Town, 7784', NULL, NULL,
  '["https://www.facebook.com/p/Makhaza-Shopping-Centre-100064238104324/", "https://www.shoprite.co.za/Western-Cape/Cape-Town/Khayelitsha/Shoprite-Makhaza/store-details/41943"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-makhaza-khayelitsha', 'Clicks Makhaza',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  (SELECT id FROM shopping_centers WHERE slug = 'makhaza-shopping-centre-khayelitsha'),
  'Shop A2 & A3, Makhaza Shopping Centre, Govan Mbeki Road, Khayelitsha, Cape Town, 7784', '021 488 8010', NULL, NULL,
  'Clicks Makhaza is a pharmacy and health, beauty and homeware retailer in the Makhaza Shopping Centre, Khayelitsha.',
  NULL, NULL,
  '["https://clicks.co.za/store/Makhaza/2048", "https://www.tiendeo.co.za/stores/cape-town/clicks-a-a-shop-a-a-makhaza-shopping-centre/75601"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-makhaza-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-makhaza-khayelitsha', 'Shoprite Makhaza',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  (SELECT id FROM shopping_centers WHERE slug = 'makhaza-shopping-centre-khayelitsha'),
  'Makhaza Shopping Centre, Corner Japhta K Masemola Road & Cekeca Road, Khayelitsha, Cape Town, 7784', '021 365 8000', NULL, NULL,
  'Shoprite Makhaza is a supermarket in the Makhaza Shopping Centre, Khayelitsha.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Khayelitsha/Shoprite-Makhaza/store-details/41943", "https://www.facebook.com/p/Makhaza-Shopping-Centre-100064238104324/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-makhaza-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cashbuild-makhaza-khayelitsha', 'Cashbuild Makhaza',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  (SELECT id FROM shopping_centers WHERE slug = 'makhaza-shopping-centre-khayelitsha'),
  'Unit 25, Makhaza Shopping Centre, Corner Lansdowne & Cekeca Roads, Khayelitsha, Cape Town, 7784', '021 362 8081', NULL, NULL,
  'Cashbuild Makhaza is a building materials and hardware store in the Makhaza Shopping Centre, Khayelitsha.',
  NULL, NULL,
  '["https://stores.cashbuild.co.za/western-cape/khayelitsha/unit-25-makhaza-shopping-centre", "https://www.opendi.co.za/cape-town/157390.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cashbuild-makhaza-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-cell-makhaza-khayelitsha', 'PEP Cell Makhaza',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  (SELECT id FROM shopping_centers WHERE slug = 'makhaza-shopping-centre-khayelitsha'),
  'Shop 20B, Makhaza Shopping Centre, Corner Lansdowne & Cekeca Roads, Khayelitsha, Cape Town, 7784', '021 362 6110', NULL, NULL,
  'PEP Cell Makhaza is a mobile phone and accessories store in the Makhaza Shopping Centre, Khayelitsha.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/khayelitsha/pep-cell-shop-b-makhaza-shopping-centre-corner-landsdowne-and-cekaka-roads/71193", "https://www.facebook.com/PEPKhayelitshaMakhaza/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-cell-makhaza-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-makhaza-khayelitsha', 'Ackermans Makhaza',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  (SELECT id FROM shopping_centers WHERE slug = 'makhaza-shopping-centre-khayelitsha'),
  'Makhaza Shopping Centre, Cekeca Road, Khayelitsha, Cape Town, 7784', '021 362 4435', NULL, NULL,
  'Ackermans Makhaza is a clothing and homeware retailer in the Makhaza Shopping Centre, Khayelitsha.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/khayelitsha/ackermans-makhaza-centrelansdowne-corner-road/68111", "https://www.guzzle.co.za/ackermans/khayelitsha/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-makhaza-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sikis-koffee-kafe-khayelitsha', 'Siki''s Koffee Kafe',
  (SELECT id FROM suburbs WHERE slug = 'khayelitsha'),
  '7 Ntaba Street, Village 1 South, Khayelitsha, Cape Town, 7783', '082 369 8229', NULL, NULL,
  'Siki''s Koffee Kafe is a coffee shop and social hub in Khayelitsha, roasting and serving African coffee.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g2427234-d14169358-Reviews-Siki_s_Koffee_Kafe-Khayelitsha_Western_Cape.html", "https://www.facebook.com/SikisKoffeeKafe/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sikis-koffee-kafe-khayelitsha'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
