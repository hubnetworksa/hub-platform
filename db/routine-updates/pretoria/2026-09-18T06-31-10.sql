INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ok-foods-trios-jan-niemand-park', 'OK Foods Trios',
  (SELECT id FROM suburbs WHERE slug = 'jan-niemand-park'),
  '110 Jan Coetzee St, Jan Niemand Park, Pretoria, 0186', '012 800 2453', NULL, NULL,
  'OK Foods Trios is a butcher, bakery and grocery store in Jan Niemand Park, Pretoria.',
  NULL, NULL,
  '["https://www.facebook.com/oktrios/", "https://vymaps.com/ZA/Trios-OK-Grocer-581605/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ok-foods-trios-jan-niemand-park'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-east-lynne-jan-niemand-park', 'SPAR East Lynne',
  (SELECT id FROM suburbs WHERE slug = 'jan-niemand-park'),
  '77 Jan Coetzee St, Jan Niemand Park, Pretoria, 0186', '012 800 4854', NULL, NULL,
  'SPAR East Lynne is a SPAR supermarket branch in Jan Niemand Park, Pretoria.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/7868c73ee1cd4ec4564fcf7e70bb3625/spar-east-lynne/pretoria/markets-food-stores", "https://www.thinklocal.co.za/biz/spar-east-lynne-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-east-lynne-jan-niemand-park'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'trios-liquor-store-jan-niemand-park', 'Trios Liquor Store',
  (SELECT id FROM suburbs WHERE slug = 'jan-niemand-park'),
  '110 Jan Coetzee St, Jan Niemand Park, Pretoria, 0186', '012 800 4310', NULL, NULL,
  'Trios Liquor Store is a bottle store in Jan Niemand Park, Pretoria.',
  NULL, NULL,
  '["https://textmap.co.za/6/35211", "https://readymap.co.za/8/46948"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'trios-liquor-store-jan-niemand-park'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);
