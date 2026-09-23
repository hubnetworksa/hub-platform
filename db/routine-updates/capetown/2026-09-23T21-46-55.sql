INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nonnys-bakery-cafe-masiphumelele', 'Nonny''s Bakery & Cafe',
  (SELECT id FROM suburbs WHERE slug = 'masiphumelele'),
  'Main Road, Masiphumelele, Cape Town, 7975', '071 998 6495', NULL, NULL,
  'Nonny''s Bakery & Cafe is a small bakery and cafe on Main Road at the entrance to Masiphumelele, serving cakes, muffins, pies, stews and toasted sandwiches from a garden seating area.',
  NULL, NULL,
  '["https://www.capepointroute.co.za/blog/attraction/nonnys-bakery-and-cafe-in-masi/", "https://masicorp.wordpress.com/2013/04/10/nonnys-bakery-and-cafe-one-of-masiphumeleles-newest-small-businesses/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nonnys-bakery-cafe-masiphumelele'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);
