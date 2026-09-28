INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'golden-food-market-hanover-park', 'Golden Food Market',
  (SELECT id FROM suburbs WHERE slug = 'hanover-park'),
  'Corner of Civic Road and Lonedown Road, Hanover Park, Cape Town', '021 207 6786', 'https://goldenfoodmarket.co.za/', NULL,
  'Golden Food Market is a butchery, deli and grocery store in Hanover Park.',
  NULL, NULL,
  '["https://goldenfoodmarket.co.za/", "https://www.facebook.com/p/Golden-Food-Market-Hanover-Park-100086994050533/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'golden-food-market-hanover-park'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
