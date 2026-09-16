INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fumo-groenkloof', 'Fumo',
  (SELECT id FROM suburbs WHERE slug = 'groenkloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'groenkloof-plaza-groenkloof'),
  '48 Bronkhorst Street, Groenkloof, Pretoria, 0181', '012 346 0916', 'https://fumo.co.za', NULL,
  'Fumo is an authentic Italian restaurant at Groenkloof Plaza, serving fresh antipasti, home-made pastas and Neapolitan-style pizza from a wood-burning oven, in Groenkloof.',
  NULL, NULL,
  '["https://fumo.co.za/contact/", "https://www.eatout.co.za/venue/fumo-restaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fumo-groenkloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'motherland-coffee-groenkloof', 'Motherland Coffee',
  (SELECT id FROM suburbs WHERE slug = 'groenkloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'groenkloof-plaza-groenkloof'),
  'Groenkloof Plaza, Cnr George Storrar Drive & Bronkhorst Street, Groenkloof, Pretoria, 0027', '010 900 0873', 'https://www.motherlandcoffee.com', NULL,
  'Motherland Coffee is a coffee shop at Groenkloof Plaza serving African-inspired brews and fresh food, in Groenkloof.',
  NULL, NULL,
  '["https://www.motherlandcoffee.com/locations/", "https://www.tripadvisor.com/Restaurant_Review-g312583-d33357033-Reviews-Motherland_Coffee_Company-Pretoria_Gauteng.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'motherland-coffee-groenkloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'groenkloof-slaghuis-groenkloof', 'Groenkloof Slaghuis',
  (SELECT id FROM suburbs WHERE slug = 'groenkloof'),
  '53 George Storrar Drive, Groenkloof, Pretoria, 0181', '012 460 6995', NULL, NULL,
  'Groenkloof Slaghuis is a butchery specialising in biltong and boerewors, in Groenkloof.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/10106066_2", "https://southafricafirm.com/gauteng/groenkloof-slaghuis-butchery-17096"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'groenkloof-slaghuis-groenkloof'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
