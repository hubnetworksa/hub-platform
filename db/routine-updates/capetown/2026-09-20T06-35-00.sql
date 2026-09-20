INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'busy-corner-butchery-grassy-park', 'Busy Corner Butchery',
  (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  '1 Victoria Road, Grassy Park, Cape Town, 7945', '021 706 2352', NULL, NULL,
  'Busy Corner Butchery is a butchery at the Busy Corner intersection in Grassy Park, selling fresh meat and related products.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/2584a27893738fc839ddfb16d003e61c/busy-corner-butchery-grassy-park/grassy-park/business-organizations", "https://www.cylex.net.za/company/busy-corner-butchery-grassy-park-23806571.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'busy-corner-butchery-grassy-park'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
