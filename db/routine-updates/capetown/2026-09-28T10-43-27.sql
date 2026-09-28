INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-elsies-river', 'Shoprite Elsies River',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  'Corner Owen and Halt Road, Elsies River, Cape Town', '021 929 2060', 'http://www.shoprite.co.za', NULL,
  'Shoprite Elsies River is a supermarket branch at the corner of Owen and Halt Road, in Elsies River.',
  NULL, NULL,
  '["https://www.netpages.co.za/Elsies+River/ShopriteHalt+Road-218613.html", "https://www.callupcontact.com/b/Supermarkets/Shoprite_Halt_Road/4781"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
