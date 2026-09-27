INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'footgear-kuils-river', 'Footgear',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'access-park-kuils-river'),
  'Shop A17, Access Park, 1 Van Riebeeck Road, Kuils River, Cape Town, 7580', '087 086 8544', NULL, NULL,
  'Footgear is a sneaker and footwear outlet stocking global brands in Access Park, Kuils River.',
  NULL, NULL,
  '["https://accessparkbellville.co.za/directory/footgear/", "https://www.tiendeo.co.za/stores/bellville/footgear-co-la-belle-st-and-van-riebeeck-road/21435"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'footgear-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'timberland-kuils-river', 'Timberland',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'access-park-kuils-river'),
  'Shop B38, Access Park, 1 Van Riebeeck Road, Kuils River, Cape Town, 7580', '021 903 1973', NULL, NULL,
  'Timberland is a footwear, clothing and accessories outlet in Access Park, Kuils River.',
  NULL, NULL,
  '["https://accessparkbellville.co.za/directory/timberland/", "https://www.tiendeo.co.za/stores/bellville/timberland-shop-b-access-park-bellville-strand-road-stikland-industrial-cape-town/75520"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'timberland-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-union-mart-kuils-river', 'Cape Union Mart',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'access-park-kuils-river'),
  'Shop A19, Access Park, 1 Van Riebeeck Road, Kuils River, Cape Town, 7580', '021 003 2781', NULL, NULL,
  'Cape Union Mart is an outdoor and adventure gear and clothing outlet in Access Park, Kuils River.',
  NULL, NULL,
  '["https://accessparkbellville.co.za/directory/cape-union-mart/", "https://www.facebook.com/AccessParkBellville/posts/a19-cape-union-mart-021-003-2781k-way-outlet-drake-down-jacket-normally-r1599-no/3355552647882271/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-union-mart-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sneaker-box-kuils-river', 'Sneaker Box',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'access-park-kuils-river'),
  'Shop B11/19, Access Park, 1 Van Riebeeck Road, Kuils River, Cape Town, 7580', '061 827 3880', NULL, NULL,
  'Sneaker Box is a footwear outlet specialising in Skechers and Anta sneakers in Access Park, Kuils River.',
  NULL, NULL,
  '["https://accessparkbellville.co.za/directory/sneaker-box/", "https://www.instagram.com/p/DFLTKcrMqOt/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sneaker-box-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);
