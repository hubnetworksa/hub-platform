INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-bothasig-bothasig', 'Shoprite Bothasig',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Bothasig Square, Cnr Vryburger Avenue & Tafelberg Street, Bothasig, Cape Town, 7441', '021 559 4196', NULL, NULL,
  'Shoprite Bothasig is a supermarket anchoring Bothasig Square, Bothasig.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/Supermarkets/Shoprite_Bothasig/4766", "https://vymaps.com/ZA/Shoprite-Centre-Bothasig-1315861105173165/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-bothasig-bothasig'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'build-it-bothasig-bothasig', 'Build It Bothasig',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Bothasig Square, Vryburger Avenue, Bothasig, Cape Town, 7441', '021 558 5709', 'https://www.buildit.co.za/Stores/View/Build-it-Bothasig-Western-Cape', NULL,
  'Build It Bothasig is a hardware and building materials store in Bothasig Square, Bothasig.',
  NULL, NULL,
  '["https://www.buildit.co.za/Stores/View/Build-it-Bothasig-Western-Cape", "https://za.africabz.com/western-cape/build-it-bothasig-110717"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'build-it-bothasig-bothasig'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-bothasig-bothasig', 'Ackermans Bothasig',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Shop 4, Bothasig Square, Vryburger Avenue, Bothasig, Cape Town, 7441', '021 558 0531', NULL, NULL,
  'Ackermans Bothasig is a discount clothing and homeware store in Bothasig Square, Bothasig.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/ackermans/shoprite-centre-vryburger-ave-bothasig", "https://www.facebook.com/AckermansBothasig/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-bothasig-bothasig'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steers-bothasig-bothasig', 'Steers Bothasig',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Shop 53 & 54, Bothasig Square, Vryburger Avenue, Bothasig, Cape Town, 7441', '021 559 4999', NULL, NULL,
  'Steers Bothasig is a fast-food burger restaurant in Bothasig Square, Bothasig.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/bothasig/steers/shop-53-54-shoprite-centre-vryburger-ave", "https://www.tiendeo.co.za/stores/cape-town/steers-shop-shoprite-centre-vryburger-ave/36014"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steers-bothasig-bothasig'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'debonairs-pizza-bothasig-bothasig', 'Debonairs Pizza Bothasig',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Shop 53, Bothasig Square, Cnr Vryburger Avenue & Tafelberg Street, Bothasig, Cape Town, 7441', '021 879 0887', 'https://location.debonairspizza.co.za/bothasig', NULL,
  'Debonairs Pizza Bothasig is a pizza takeaway and delivery restaurant in Bothasig Square, Bothasig.',
  NULL, NULL,
  '["https://location.debonairspizza.co.za/bothasig", "https://www.cylex.net.za/company/debonairs-pizza-23692766.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'debonairs-pizza-bothasig-bothasig'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bothasig-pharmacy-bothasig', 'Bothasig Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Shop 28-32, Bothasig Square, Vryburger Avenue, Bothasig, Cape Town, 7441', '021 558 1933', NULL, NULL,
  'Bothasig Pharmacy is an AlphaPharm pharmacy in Bothasig Square, Bothasig.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/bothasig-pharmacy-bothasig", "https://za.africabz.com/western-cape/bothasig-pharmacy-158210"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bothasig-pharmacy-bothasig'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-cedar-bothasig', 'SPAR Cedar',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  'Cnr Vryburger Avenue & Botma Street, Bothasig, Cape Town, 7441', '021 558 3940', NULL, NULL,
  'SPAR Cedar is a supermarket at the corner of Vryburger Avenue and Botma Street in Bothasig.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/spar-cedar-66657", "https://my-catalogue.co.za/stores/bothasig/spar/cnr-vryburger-ave-bothma-street"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-cedar-bothasig'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
