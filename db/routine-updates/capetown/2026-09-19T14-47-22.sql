-- Jobs 1-2: edgemead suburb research
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'edgemead-village-centre-edgemead', 'Edgemead Village Centre',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  '50 Louis Thibault Drive, Corner Letchworth Drive, Edgemead, Cape Town, 7441',
  NULL, NULL,
  '["https://www.edgemeadvillagecentre.co.za/", "https://edgemeadnews.co.za/shopping-centre/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-edgemead-village-centre-edgemead', 'Woolworths Edgemead Village Centre',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  (SELECT id FROM shopping_centers WHERE slug = 'edgemead-village-centre-edgemead'),
  'Shop 21 & 22, Edgemead Village Centre, 50 Louis Thibault Drive, Edgemead, Cape Town, 7441', '021 559 9700', NULL, NULL,
  'Woolworths Edgemead Village Centre is a Woolworths Food branch in the Edgemead Village Centre.',
  NULL, NULL,
  '["https://www.edgemeadvillagecentre.co.za/store-directory/", "https://www.tiendeo.co.za/stores/cape-town/clicks-edgemead-shopping-centre-louis-thibault-drive/27781"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-edgemead-village-centre-edgemead'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'superspar-edgemead-village-centre-edgemead', 'SuperSpar Edgemead',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  (SELECT id FROM shopping_centers WHERE slug = 'edgemead-village-centre-edgemead'),
  'Shop 1, Edgemead Village Centre, Corner Louis Thibault & Letchworth Drive, Edgemead, Cape Town, 7441', '021 558 0120', NULL, NULL,
  'SuperSpar Edgemead is a branch of the Spar supermarket chain, in the Edgemead Village Centre.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/superspar-edgemead-cape-town", "https://www.edgemeadvillagecentre.co.za/store-directory/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'superspar-edgemead-village-centre-edgemead'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-pharmacy-edgemead', 'Clicks Pharmacy Edgemead',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  (SELECT id FROM shopping_centers WHERE slug = 'edgemead-village-centre-edgemead'),
  'Shop 14, Edgemead Village Centre, 50 Louis Thibault Drive, Edgemead, Cape Town, 7441', '021 558 1047', NULL, NULL,
  'Clicks Pharmacy Edgemead is a branch of the Clicks pharmacy and health chain, in the Edgemead Village Centre.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/clicks/14-edgemead-shopping-centre-50-louis-thibault-drive-edgemead", "https://www.tiendeo.co.za/stores/cape-town/clicks-edgemead-shopping-centre-louis-thibault-drive/27781"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-pharmacy-edgemead'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'barksole-edgemead', 'Barksole Edgemead',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  (SELECT id FROM shopping_centers WHERE slug = 'edgemead-village-centre-edgemead'),
  'Shop 13, Edgemead Village Centre, Letchworth Drive, Edgemead, Cape Town, 7441', '021 559 0362', 'https://barksole.co.za/store-locator/edgemead/', NULL,
  'Barksole Edgemead is a one-stop shop for key cutting, shoe and motorcycle boot repairs, luggage repairs, dry cleaning drop-off and engraving, in the Edgemead Village Centre.',
  NULL, NULL,
  '["https://barksole.co.za/store-locator/edgemead/", "https://www.facebook.com/BarksoleEdgemead/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barksole-edgemead'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
