INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wellness-warehouse-glengarry-shopping-centre-brackenfell', 'Wellness Warehouse Glengarry',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'glengarry-shopping-centre-brackenfell'),
  'Shop 12 & 13, Glengarry Shopping Centre, 285 De Bron Road, Vredekloof, Brackenfell North, Cape Town, 7560', '021 981 2099', 'https://www.wellnesswarehouse.com', NULL,
  'Wellness Warehouse Glengarry is a health, supplements and natural-products store, part of the Wellness Warehouse chain, in Glengarry Shopping Centre.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/wellness-warehouse-glengarry-shopping-centre-227992", "https://www.fresha.com/lvp/wellness-warehouse-glengarry-shopping-centre-cape-town-JQVY94"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wellness-warehouse-glengarry-shopping-centre-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spec-savers-brackenfell-shopping-centre-brackenfell', 'Spec-Savers Brackenfell',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-shopping-centre-brackenfell'),
  'Shop 19-20, Brackenfell Shopping Centre, Cnr Old Paarl Road & Jeanette Street, Brackenfell, Cape Town, 7560', '021 981 1515', 'https://www.specsavers.co.za/store/brackenfell', NULL,
  'Spec-Savers Brackenfell is an optometrist and eyewear store, part of the Spec-Savers chain, in Brackenfell Shopping Centre.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/spec-savers-shop--brackenfell-centre-corner-of-old-paarl-road-jeanette-street-frans-conradie-drive-hypermarket-brackenfell/54515", "https://brackenfellcentre.co.za/store/spec-savers/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spec-savers-brackenfell-shopping-centre-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-brackenfell-shopping-centre-brackenfell', 'KFC Brackenfell',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-shopping-centre-brackenfell'),
  'Old Paarl Road, Brackenfell Shopping Centre, Brackenfell, Cape Town, 7560', '021 981 4310', 'https://locations.kfc.co.za/western-cape/brackenfell/old-paarl-road', NULL,
  'KFC Brackenfell is a fried-chicken fast-food outlet, part of the KFC chain, in Brackenfell Shopping Centre.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/brackenfell/old-paarl-road", "https://za.africabz.com/western-cape/kfc-brackenfell-37290"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-brackenfell-shopping-centre-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'navaho-spur-brackenfell-shopping-centre-brackenfell', 'Navaho Spur',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-shopping-centre-brackenfell'),
  'Shop 22, Brackenfell Shopping Centre, Old Paarl Road, Brackenfell, Cape Town, 7560', '021 981 2521', NULL, NULL,
  'Navaho Spur is a family steakhouse restaurant, part of the Spur Steak Ranches chain, in Brackenfell Shopping Centre.',
  NULL, NULL,
  '["https://magicpin.com/south-africa/Cape-Town/Brackenfell/Restaurant/Navaho-Spur/store/2362555", "https://www.dining-out.co.za/md/Navaho-Spur-Steak-Ranch-Brackenfell/4297"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'navaho-spur-brackenfell-shopping-centre-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spec-savers-cape-gate-brackenfell', 'Spec-Savers Cape Gate',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'capegate-shopping-centre-brackenfell'),
  'Shop L74a, Cape Gate Shopping Centre, Cnr Okavango & De Bron Road, Brackenfell, Cape Town, 7562', '021 981 9656', 'https://www.specsavers.co.za/store/cape-gate', NULL,
  'Spec-Savers Cape Gate is an optometrist and eyewear store, part of the Spec-Savers chain, in Cape Gate Shopping Centre.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/spec-savers-cape-gate-105771", "https://www.specsavers.co.za/store/cape-gate"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spec-savers-cape-gate-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-cape-gate-brackenfell', 'Mr Price Cape Gate',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'capegate-shopping-centre-brackenfell'),
  'Shop 28, Cape Gate Shopping Centre, Cnr Okavango & De Bron Road, Brackenfell, Cape Town, 7562', '021 981 0975', 'https://www.mrp.com/en_za/store/mr-price-cape-gate', NULL,
  'Mr Price Cape Gate is a value fashion and homeware store, part of the national Mr Price chain, in Cape Gate Shopping Centre.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/mr-price-cape-gate-cape-town", "https://capegatecentre.co.za/shop/mr-price"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-price-cape-gate-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
