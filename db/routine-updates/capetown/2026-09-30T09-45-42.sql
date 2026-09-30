-- Jobs 1-2: mitchells-plain

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'mitchells-plain-town-centre-mitchells-plain', 'Mitchells Plain Town Centre',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  'Mitchells Plain Road, Mitchells Plain, Cape Town, 7785', NULL, NULL,
  '["https://brightwaveproperty.co.za/retail/to-let/mitchells-plain/mitchells-plain-town-centre", "https://emira.co.za/portfolio/mitchells-plain/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-town-centre-mitchells-plain', 'Shoprite Town Centre',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  (SELECT id FROM shopping_centers WHERE slug = 'mitchells-plain-town-centre-mitchells-plain'),
  'Shop 1a, 29 Symphony Walk, Mitchells Plain Town Centre, Mitchells Plain, Cape Town, 7785', '021 378 2000', NULL, NULL,
  'Shoprite Town Centre is a supermarket anchoring Mitchells Plain Town Centre.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Mitchells-Plain/Shoprite-Town-Centre/store-details/2581", "https://my-catalogue.co.za/stores/mitchells-plain/shoprite/town-centre-29-symphony-walk"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-town-centre-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-town-centre-mitchells-plain', 'Clicks Town Centre',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  (SELECT id FROM shopping_centers WHERE slug = 'mitchells-plain-town-centre-mitchells-plain'),
  'Sonata Lane, Mitchells Plain Town Centre, Mitchells Plain, Cape Town, 7785', '021 391 0175', NULL, NULL,
  'Clicks Town Centre is a health, beauty and pharmacy retailer, in Mitchells Plain Town Centre.',
  NULL, NULL,
  '["https://clicks.co.za/store/Town-Centre/2012", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=87303"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-town-centre-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-town-centre-mitchells-plain', 'Ackermans Town Centre',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  (SELECT id FROM shopping_centers WHERE slug = 'mitchells-plain-town-centre-mitchells-plain'),
  'Inn On The Plain, Symphony Walk, Mitchells Plain Town Centre, Mitchells Plain, Cape Town, 7785', '021 391 2122', NULL, NULL,
  'Ackermans Town Centre is a clothing and homeware retailer, in Mitchells Plain Town Centre.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/mitchells-plain/ackermans-symphony-walktown-centre/15254", "https://www.ackermans.co.za/pages/connect-stores"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-town-centre-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
