INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'stellenberg-spar-centre-stellenberg', 'Stellenberg Spar Centre',
  (SELECT id FROM suburbs WHERE slug = 'stellenberg'),
  '40 Haarlem Street, Stellenberg, Bellville, Cape Town', NULL, NULL,
  '["https://my-catalogue.co.za/stores/stellenberg/spar/40-haarlem-street", "https://nearbyza.com/place/stellenberg-spar-centre"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kwikspar-stellenberg-stellenberg', 'KWIKSPAR Stellenberg',
  (SELECT id FROM suburbs WHERE slug = 'stellenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'stellenberg-spar-centre-stellenberg'),
  '40 Haarlem Street, Stellenberg Spar Centre, Stellenberg, Bellville', '021 919 2954', 'https://www.spar.co.za/Home/Store-View/KWIKSPAR-Stellenberg-Western-Cape/', NULL,
  'KWIKSPAR Stellenberg is the anchor supermarket of Stellenberg Spar Centre, in Stellenberg, offering bakery, butchery and fresh produce.',
  NULL, NULL,
  '["https://www.spar.co.za/Home/Store-View/KWIKSPAR-Stellenberg-Western-Cape/", "https://za.africabz.com/western-cape/stellenberg-spar-centre-46239"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kwikspar-stellenberg-stellenberg'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tops-at-spar-stellenberg-stellenberg', 'TOPS at SPAR Stellenberg',
  (SELECT id FROM suburbs WHERE slug = 'stellenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'stellenberg-spar-centre-stellenberg'),
  '40 Haarlem Street, Stellenberg Spar Centre, Stellenberg, Bellville', '021 919 2954', NULL, NULL,
  'TOPS at SPAR Stellenberg is a liquor store in Stellenberg Spar Centre, in Stellenberg.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/tops-at-spar-stellenberg-stellenberg", "https://za.africabz.com/western-cape/tops-at-spar-stellenberg-115771"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tops-at-spar-stellenberg-stellenberg'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'stellenberg-vissery-stellenberg', 'Stellenberg Vissery',
  (SELECT id FROM suburbs WHERE slug = 'stellenberg'),
  '4 Haarlem Street, Stellenberg, Bellville, 7550', '021 919 3137', NULL, NULL,
  'Stellenberg Vissery is a fish and chips shop in Stellenberg, frying fish fresh to order.',
  NULL, NULL,
  '["https://www.sayellow.com/stellenberg-vissery-durbanville", "https://www.yep.co.za/business/3512867_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'stellenberg-vissery-stellenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rex-hardware-stellenberg', 'Rex Hardware',
  (SELECT id FROM suburbs WHERE slug = 'stellenberg'),
  'Bergsig Centre, Springfontein Avenue, Stellenberg, Bellville, 7530', '021 976 5511', NULL, NULL,
  'Rex Hardware is a hardware store in Bergsig Centre, Stellenberg.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/rex-hardware/291246", "https://westerncape.mzansi24.co.za/directory-mzansi24/listings/rex-hardware/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rex-hardware-stellenberg'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
