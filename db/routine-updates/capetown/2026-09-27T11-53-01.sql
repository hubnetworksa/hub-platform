-- Job 1/2: bergvliet suburb research -- 1 new standalone business

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crafters-den-bergvliet', 'The Crafters Den',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  '37 Bergvliet Road, Bergvliet, Cape Town, 7945', '078 832 3451', NULL, NULL,
  'The Crafters Den is a craft and wool supplies shop on Bergvliet Road, Bergvliet.',
  NULL, NULL,
  '["https://www.thecraftersdencape.com/contact-us", "https://www.youtube.com/watch?v=N-lQvzfvVbY"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-crafters-den-bergvliet'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
