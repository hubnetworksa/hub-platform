INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-les-marais-les-marais', 'SPAR Les Marais',
  (SELECT id FROM suburbs WHERE slug = 'les-marais'),
  '662 Paul Kruger St, Les Marais, Pretoria, 0084', '012 335 2964', NULL, 'lesmaraisspar@intekom.co.za',
  'SPAR Les Marais is a supermarket at 662 Paul Kruger Street offering groceries, fresh produce and a TOPS liquor counter, open daily from around 08:00 to 20:00 (09:00 to 19:00 on Sundays), in Les Marais, Pretoria.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/spar-les-marais_1y", "https://www.fyple.co.za/company/spar-les-marais-18ve6gw/", "https://thinklocal.co.za/biz/spar-les-marais-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-les-marais-les-marais'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
