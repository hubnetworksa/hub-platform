INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'lansdowne-corner-shopping-centre-lansdowne', 'Lansdowne Corner Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  'Corner Jan Smuts Drive & Lansdowne Road, Lansdowne, Cape Town', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/lansdowne-corner-shopping-centre.html", "https://www.lansdownecorner.co.za/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-lansdowne-corner-lansdowne', 'Shoprite Lansdowne Corner',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  (SELECT id FROM shopping_centers WHERE slug = 'lansdowne-corner-shopping-centre-lansdowne'),
  'Lansdowne Corner Shopping Centre, Corner Jan Smuts Drive & Lansdowne Road, Lansdowne, Cape Town, 7780', '021 704 9740', NULL, NULL,
  'Shoprite Lansdowne Corner is a supermarket and the anchor tenant of Lansdowne Corner Shopping Centre, in Lansdowne.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Ottery/Shoprite-Lansdowne-Corner/store-details/30716", "https://www.lansdownecorner.co.za/browse-directory/2172/shoprite/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-lansdowne-corner-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-lansdowne-corner-lansdowne', 'PEP Lansdowne Corner',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  (SELECT id FROM shopping_centers WHERE slug = 'lansdowne-corner-shopping-centre-lansdowne'),
  'Shop 9-11, Lansdowne Corner Shopping Centre, Corner Lansdowne Road & Jan Smuts Drive, Lansdowne, Cape Town, 7780', '021 704 0432', NULL, NULL,
  'PEP at Lansdowne Corner Shopping Centre is a branch of the value clothing, footwear and homeware retail chain, in Lansdowne.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop--lansdowne-corner-shopping-centre-cnr-lansdowne-road-jan-smuts-drive-lansdowne-cape-town-western-cape/69656", "https://www.lansdownecorner.co.za/browse-directory/2169/pep-stores/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-lansdowne-corner-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-lansdowne-corner-lansdowne', 'Ackermans Lansdowne Corner',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  (SELECT id FROM shopping_centers WHERE slug = 'lansdowne-corner-shopping-centre-lansdowne'),
  'Shop 24 & 26, Lansdowne Corner Shopping Centre, Corner Lansdowne Road & Jan Smuts Drive, Lansdowne, Cape Town, 7780', '021 704 0344', NULL, NULL,
  'Ackermans at Lansdowne Corner Shopping Centre is a branch of the value fashion and clothing retail chain, in Lansdowne.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/lansdowne/ackermans/lansdowne-corner-shopping-centre-cnr-lansdowne-strandfontein-jan-smuts-dr", "https://www.lansdownecorner.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-lansdowne-corner-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'caltex-lansdowne-corner-lansdowne', 'Caltex Lansdowne Corner',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  (SELECT id FROM shopping_centers WHERE slug = 'lansdowne-corner-shopping-centre-lansdowne'),
  'Corner Jan Smuts Drive & Govan Mbeki Road, Lansdowne Corner Shopping Centre, Lansdowne, Cape Town', '021 703 3489', NULL, NULL,
  'Caltex at Lansdowne Corner Shopping Centre is a fuel station with an on-site FreshStop convenience shop, in Lansdowne.',
  NULL, NULL,
  '["https://westerncape.yalwa.co.za/ID_135427028/FreshStop-at-Caltex-Jan-Smuts.html", "https://www.lansdownecorner.co.za/browse-directory/2151/caltex-service-stations/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'caltex-lansdowne-corner-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'going-under-clothing-lansdowne', 'Going Under Clothing',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  '5 Induland Avenue, Lansdowne, Cape Town, 7779', '021 691 1617', 'http://www.goingunder.co.za/', NULL,
  'Going Under Clothing is a factory clothing outlet in Lansdowne.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/wc/cape-town/going-under-clothing-lansdowne", "https://za.africabz.com/western-cape/going-under-clothing-lansdowne-451885"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'going-under-clothing-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
