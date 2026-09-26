-- Suburb: Lakeside -- job 1 new business

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'organic-zone-lakeside', 'Organic Zone',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  '1 Main Road & Putter Road, Lakeside, Cape Town, 7945', '021 788 3133', 'https://www.organiczone.co.za', NULL,
  'Organic Zone is an organic grocery store and wholefood deli with an organic coffee bar, in Lakeside.',
  NULL, NULL,
  '["https://aspirelifestyle.co.za/organic-zone-a-community-business/", "https://nearbyza.com/place/organic-zone-coffee-bar"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'organic-zone-lakeside'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
