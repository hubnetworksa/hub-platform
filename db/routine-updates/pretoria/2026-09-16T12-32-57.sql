INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-gezina-gezina', 'Shoprite Gezina',
  (SELECT id FROM suburbs WHERE slug = 'gezina'),
  '620 Steve Biko Rd, Gezina, Pretoria, 0084', '012 404 9080', NULL, NULL,
  'Shoprite Gezina is a supermarket on Steve Biko Road offering groceries, fresh meat and general household goods, in Gezina.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/shoprite-gezina", "https://za.africabz.com/gauteng/shoprite-checkers-74576"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-gezina-gezina'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-gezina-galleries-gezina', 'Clicks Gezina Galleries',
  (SELECT id FROM suburbs WHERE slug = 'gezina'),
  (SELECT id FROM shopping_centers WHERE slug = 'gezina-galleries-gezina'),
  'Shop 26, Gezina Galleries, Michael Brink Street, Gezina, Pretoria, 0084', '012 335 5143', 'https://clicks.co.za/store/Gezina-Galleries/1560', NULL,
  'Clicks Gezina Galleries is a pharmacy and health-and-beauty retailer inside Gezina Galleries, Gezina.',
  NULL, NULL,
  '["https://clicks.co.za/store/Gezina-Galleries/1560", "https://www.tiendeo.co.za/stores/pretoria/clicks-gezina-galleries-michael-brink-street/27798"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-gezina-galleries-gezina'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sheet-street-gezina-gezina', 'Sheet Street Gezina',
  (SELECT id FROM suburbs WHERE slug = 'gezina'),
  (SELECT id FROM shopping_centers WHERE slug = 'gezina-galleries-gezina'),
  'Gezina Galleries, Corner Michael Brink and Frederika Streets, Gezina, Pretoria', '087 750 1951', 'https://www.sheetstreet.com/sheet-street-gezina-30236', NULL,
  'Sheet Street Gezina is a homeware and linen retailer inside Gezina Galleries, Gezina.',
  NULL, NULL,
  '["https://www.sheetstreet.com/sheet-street-gezina-30236", "https://www.tiendeo.co.za/stores/pretoria/sheet-street-shop-gezina-galleries-cnr-michael-brink-and-frederika-streets-gezina/40269"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sheet-street-gezina-gezina'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'debonairs-pizza-gezina-gezina', 'Debonairs Pizza Gezina',
  (SELECT id FROM suburbs WHERE slug = 'gezina'),
  (SELECT id FROM shopping_centers WHERE slug = 'gezina-galleries-gezina'),
  'Shop 41, Gezina Galleries, Corner Michael Brink and Frederika Streets, Gezina, Pretoria, 0001', '012 335 5697', 'https://location.debonairspizza.co.za/gezina', NULL,
  'Debonairs Pizza Gezina is a pizza takeaway and delivery outlet inside Gezina Galleries, Gezina.',
  NULL, NULL,
  '["https://location.debonairspizza.co.za/gezina", "https://za.africabz.com/gauteng/debonairs-pizza-32973"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'debonairs-pizza-gezina-gezina'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wimpy-gezina-galleries-gezina', 'Wimpy Gezina Galleries',
  (SELECT id FROM suburbs WHERE slug = 'gezina'),
  (SELECT id FROM shopping_centers WHERE slug = 'gezina-galleries-gezina'),
  'Shop 33, Gezina Galleries, 569 Frederika Street, Gezina, Pretoria, 0084', '012 006 5462', NULL, NULL,
  'Wimpy Gezina Galleries is a family restaurant serving burgers and breakfasts inside Gezina Galleries, Gezina.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/5cf02856046413ae7696e0447ed911dd/wimpy/pretoria/restaurants", "https://www.yellowpages.co.za/business/15787322_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wimpy-gezina-galleries-gezina'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ok-furniture-gezina-gezina', 'OK Furniture Gezina',
  (SELECT id FROM suburbs WHERE slug = 'gezina'),
  (SELECT id FROM shopping_centers WHERE slug = 'gezina-galleries-gezina'),
  'Shop 18, Gezina Galleries, Frederika Street, Gezina, Pretoria, 0084', '012 404 0660', 'https://www.okfurniture.co.za/gezina', NULL,
  'OK Furniture Gezina is a furniture and appliance retailer inside Gezina Galleries, Gezina.',
  NULL, NULL,
  '["https://www.okfurniture.co.za/gezina", "https://www.brabys.com/za/gauteng/pretoria/gezina/furniture-dealers/o-k-furniture"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ok-furniture-gezina-gezina'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-home-gezina-galleries-gezina', 'PEP Home Gezina Galleries',
  (SELECT id FROM suburbs WHERE slug = 'gezina'),
  (SELECT id FROM shopping_centers WHERE slug = 'gezina-galleries-gezina'),
  'Shop 37, Gezina Galleries, 11th Avenue, Gezina, Pretoria', '012 335 1067', NULL, NULL,
  'PEP Home Gezina Galleries is a homeware and bedding retailer inside Gezina Galleries, Gezina.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/pretoria/pep-home-gezina-galleries-corner-michael-brink-frederika-streets/67510", "https://pretoria.co.za/place/pep-home-pta-gezina-galleries"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-home-gezina-galleries-gezina'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
