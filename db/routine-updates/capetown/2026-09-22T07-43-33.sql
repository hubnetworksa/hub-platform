INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spec-savers-goodwood-mall-goodwood', 'Spec-Savers Goodwood Mall',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'goodwood-mall-goodwood'),
  'Shop S02, Goodwood Mall, 26 Dirkie Uys Street, Goodwood Estate, Cape Town, 7460', '021 476 0207', 'https://www.specsavers.co.za/store/goodwood-mall', NULL,
  'Spec-Savers Goodwood Mall is an optometrist and eyewear store, part of the Spec-Savers chain, in Goodwood Mall.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/spec-savers-goodwood-mall-580304", "https://www.specsavers.co.za/store/goodwood-mall/contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spec-savers-goodwood-mall-goodwood'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capitec-bank-goodwood-mall-goodwood', 'Capitec Bank Goodwood Mall',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'goodwood-mall-goodwood'),
  'Shop 8A, Goodwood Mall, Cnr Voortrekker Road & MacDonald Street, Goodwood Estate, Cape Town, 7460', '021 591 5584', NULL, NULL,
  'Capitec Bank Goodwood Mall is a bank branch, part of the Capitec Bank chain, in Goodwood Mall.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/goodwood/capitec-bank-shop-a-b-and-goodwood-mall/64479", "http://textmap.co.za/5121/1743"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capitec-bank-goodwood-mall-goodwood'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mini-kem-pharmacy-goodwood-mall-goodwood', 'Mini-Kem Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'goodwood-mall-goodwood'),
  '1 Goodwood Mall, 22 McDonald Street, Goodwood Estate, Cape Town, 7460', '021 591 3001', NULL, NULL,
  'Mini-Kem Pharmacy is a community pharmacy near Entrance 1 of Goodwood Mall.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/mini-kem-179331", "https://www.yep.co.za/biz/store/iyp/53832_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mini-kem-pharmacy-goodwood-mall-goodwood'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hungry-lion-goodwood-mall-goodwood', 'Hungry Lion Goodwood Mall',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'goodwood-mall-goodwood'),
  'Shop 15, 16 & 17, Goodwood Mall, 26 Dirkie Uys Street, Goodwood Estate, Cape Town, 7460', '021 493 4700', 'https://www.hungrylion.co.za/store_details/goodwood-mall', NULL,
  'Hungry Lion Goodwood Mall is a fried-chicken fast-food outlet, part of the Hungry Lion chain, in Goodwood Mall.',
  NULL, NULL,
  '["https://www.hungrylion.co.za/store_details/goodwood-mall", "https://hungrylionmenu.co.za/locations/hungry-lion-goodwood-mallmall26-dirkie-uys-streetgoodwood-estatecape-town7460/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hungry-lion-goodwood-mall-goodwood'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-goodwood-mall-goodwood', 'PEP Goodwood Mall',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'goodwood-mall-goodwood'),
  'Shop 11-13, Goodwood Mall, Cnr McDonald Street & Voortrekker Road, Goodwood, Cape Town, 7460', '021 591 6416', 'https://www.pepstores.com', NULL,
  'PEP Goodwood Mall is a value clothing and general merchandise store, part of the national PEP chain, in Goodwood Mall.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop--goodwood-mall-cnr-mcdonald-voortrekker-road-goodwood-cape-town-western-cape/70576", "https://www.cybo.com/ZA-biz/pep-goodwood-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-goodwood-mall-goodwood'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'african-bank-goodwood-mall-goodwood', 'African Bank Goodwood Mall',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'goodwood-mall-goodwood'),
  'Shop 16, Goodwood Mall, 16 Voortrekker Road, Cnr Voortrekker & MacDonald Road, Goodwood Estate, Cape Town, 7460', '021 591 2093', NULL, NULL,
  'African Bank Goodwood Mall is a bank branch, part of the African Bank chain, in Goodwood Mall.',
  NULL, NULL,
  '["http://textmap.co.za/5121/1845", "https://nearbyza.com/place/african-bank-556"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'african-bank-goodwood-mall-goodwood'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'monument-pharmacy-goodwood', 'Monument Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  '75 Voortrekker Road, Goodwood Estate, Cape Town, 7460', '021 591 4164', NULL, NULL,
  'Monument Pharmacy is an independent community pharmacy on Voortrekker Road in Goodwood.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/monument-pharmacy-23702226.html", "https://www.yep.co.za/biz/store/iyp/37183_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'monument-pharmacy-goodwood'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
