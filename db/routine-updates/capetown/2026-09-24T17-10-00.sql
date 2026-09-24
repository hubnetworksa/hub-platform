-- Job 2: Steenberg Village (Tokai) tenant discovery -- 9 verified tenants

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-steenberg-village-tokai', 'Pick n Pay Steenberg Village',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'steenberg-village-tokai'),
  'Corner Steenberg Road and Reddam Avenue, Steenberg Village, Tokai, Cape Town', '021 701 0000', NULL, NULL,
  'Pick n Pay Steenberg Village is a supermarket anchor tenant of Steenberg Village, in Tokai.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/tokai/pick-n-pay/cnr-steenberg-rd-reddam-ave", "https://za.africabz.com/western-cape/pick-n-pay-family-steenberg-218696"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'pick-n-pay-steenberg-village-tokai'), (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-food-steenberg-village-tokai', 'Woolworths Food',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'steenberg-village-tokai'),
  'Steenberg Village, Reddam Avenue, Tokai, Cape Town', '021 700 4100', NULL, NULL,
  'Woolworths Food is a supermarket anchor tenant of Steenberg Village, in Tokai.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/steenberg/woolworths/steenberg-village-shopping-centre-reddam-ave", "https://www.facebook.com/SteenbergVillage/posts/the-newly-renovated-woolworths-food-store-in-steenberg-village-has-officially-op/1494636700675787/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'woolworths-food-steenberg-village-tokai'), (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-hussar-grill-steenberg-tokai', 'The Hussar Grill Steenberg',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'steenberg-village-tokai'),
  'Shop F8, Reddam Avenue, Steenberg Village, Tokai, Cape Town', '021 702 4094', NULL, NULL,
  'The Hussar Grill Steenberg is a steakhouse restaurant in Steenberg Village, Tokai.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/The-Hussar-Grill-Steenberg/5377", "https://www.mrdfood.com/food-delivery/restaurant/the-hussar-grill-steenberg_tokai/12538"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'the-hussar-grill-steenberg-tokai'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'basilico-steenberg-tokai', 'Basilico Steenberg',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'steenberg-village-tokai'),
  'Shop B1, Steenberg Village, Reddam Avenue, Tokai, Cape Town', '021 701 3589', NULL, NULL,
  'Basilico Steenberg is an Italian restaurant known for wood-fired pizzas, in Steenberg Village, Tokai.',
  NULL, NULL,
  '["https://constantiavalley.com/basilico-steenberg/", "https://www.sa-venues.com/things-to-do/westerncape/basilico-steenberg-restaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'basilico-steenberg-tokai'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wayne-hodgkinson-optometrists-tokai', 'Wayne Hodgkinson Optometrists',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'steenberg-village-tokai'),
  'G4, Steenberg Village Centre, Reddam Avenue, Tokai, Cape Town', '021 701 3577', NULL, NULL,
  'Wayne Hodgkinson Optometrists is an optometry practice in Steenberg Village, Tokai.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/wayne-hodgkinson-optometrists-23817953.html", "https://za.africabz.com/western-cape/wayne-hodgkinson-optometrist-186447"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'wayne-hodgkinson-optometrists-tokai'), (SELECT id FROM categories WHERE slug = 'opticians'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wellness-warehouse-steenberg-village-tokai', 'Wellness Warehouse Steenberg Village',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'steenberg-village-tokai'),
  'Shop G2, Steenberg Village Centre, Reddam Avenue, Tokai, Cape Town', '021 702 0013', NULL, NULL,
  'Wellness Warehouse Steenberg Village is a health, supplements and organic products retailer in Steenberg Village, Tokai.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/wellness-warehouse-steenberg-village-reddam-avenue-cape-town-wr9BeA", "https://my-catalogue.co.za/stores/cape-town/wellness-warehouse/steenberg-village-centre-shop-g2-reddam-avenue-tokai"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'wellness-warehouse-steenberg-village-tokai'), (SELECT id FROM categories WHERE slug = 'general-retail'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mtn-steenberg-village-tokai', 'MTN Steenberg Village',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'steenberg-village-tokai'),
  'Shop 7, Steenberg Village Shopping Centre, Reddam Avenue, Tokai, Cape Town', '083 869 1542', NULL, NULL,
  'MTN Steenberg Village is a mobile phone and network services store in Steenberg Village, Tokai.',
  NULL, NULL,
  '["https://www.mtn.co.za/home/coverage/store/mtn-store-steenberg-village", "https://www.cylex.net.za/company/mtn-store---steenberg-village-23796977.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'mtn-steenberg-village-tokai'), (SELECT id FROM categories WHERE slug = 'mobile-phones'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sorbet-steenberg-village-tokai', 'Sorbet Steenberg Village',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'steenberg-village-tokai'),
  'Shop F3, Steenberg Village Centre, Reddam Avenue, Tokai, Cape Town', '021 701 0365', NULL, NULL,
  'Sorbet Steenberg Village is a beauty salon offering manicures, pedicures, massages and waxing, in Steenberg Village, Tokai.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/sorbet-salon-reddam-avenue-cape-town-eX04Qe", "https://www.hotfrog.co.za/company/1493261797490688/sorbet-salon/cape-town/hair-nails"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sorbet-steenberg-village-tokai'), (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'), 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rock-thai-sushi-steenberg-tokai', 'Rock Thai Sushi Steenberg',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'steenberg-village-tokai'),
  'Shop B3, Steenberg Village Centre, Reddam Avenue, Tokai, Cape Town', '+27 61 301 2374', NULL, NULL,
  'Rock Thai Sushi Steenberg is a Thai and sushi restaurant in Steenberg Village, Tokai.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/rock-thai-sushi-415507", "https://www.dining-out.co.za/md/Rock-Thai-Sushi-Steenberg/10886"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'rock-thai-sushi-steenberg-tokai'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);
