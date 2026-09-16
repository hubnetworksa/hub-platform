INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'liquor-city-castle-walk-erasmuskloof', 'Liquor City Castle Walk',
  (SELECT id FROM suburbs WHERE slug = 'erasmuskloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'castle-walk-shopping-centre-erasmuskloof'),
  '30 Castle Walk Ctr, Nossob St, Erasmuskloof, Pretoria, 0181', '012 347 7191', NULL, NULL,
  'Liquor City Castle Walk is a liquor store in Castle Walk Shopping Centre, Erasmuskloof.',
  NULL, NULL,
  '["https://textmap.co.za/6/46872", "https://my-catalogue.co.za/stores/erasmuskloof/liquor-city/30-castle-walk-ctr-nossob-st"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'liquor-city-castle-walk-erasmuskloof'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'castle-walk-stationers-erasmuskloof', 'Castle Walk Stationers',
  (SELECT id FROM suburbs WHERE slug = 'erasmuskloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'castle-walk-shopping-centre-erasmuskloof'),
  'Shop 8B, Castle Walk Ctr, Nossob St, Erasmuskloof, Pretoria, 0181', '012 347 1676', 'http://www.castlewalkstationers.co.za', NULL,
  'Castle Walk Stationers is a stationery shop in Castle Walk Shopping Centre, Erasmuskloof.',
  NULL, NULL,
  '["https://www.brabys.com/za/gauteng/pretoria/erasmuskloof/stationers/castle-walk-stationers", "https://www.yep.co.za/biz/store/castle-walk-stationers/330148"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'castle-walk-stationers-erasmuskloof'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);
