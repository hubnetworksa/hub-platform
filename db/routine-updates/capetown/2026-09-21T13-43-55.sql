-- Jobs 1-2: bo-kaap suburb checkpoint

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rose-corner-cafe-bo-kaap', 'Rose Corner Cafe',
  (SELECT id FROM suburbs WHERE slug = 'bo-kaap'),
  '100 Wale Street, Bo-Kaap, Cape Town', '021 424 2660', NULL, NULL,
  'Rose Corner Cafe is a family-run corner cafe in Bo-Kaap, known for its koesisters, samoosas and homemade atchar.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/rose-corner-cafe-in-cape-town", "https://za.placedigger.com/rose-corner-cafe132296155.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rose-corner-cafe-bo-kaap'),
  (SELECT id FROM categories WHERE slug = 'convenience-stores'),
  1
);
