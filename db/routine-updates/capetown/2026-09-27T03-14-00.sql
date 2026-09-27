-- Job 1/2: walmer-estate suburb research
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'garden-court-nelson-mandela-boulevard-walmer-estate', 'Garden Court Nelson Mandela Boulevard',
  (SELECT id FROM suburbs WHERE slug = 'walmer-estate'),
  'Cnr Melbourne and Coronation Road, Walmer Estate, Cape Town, 8001', '+27 21 448 4123', 'https://www.southernsun.com/garden-court-nelson-mandela-boulevard', NULL,
  'Garden Court Nelson Mandela Boulevard is a 292-room hotel in Walmer Estate, part of the Southern Sun group, offering an outdoor pool, fitness centre and conference facilities close to the Cape Town city bowl.',
  NULL, NULL,
  '["https://www.booking.com/hotel/za/garden-court-nelson-mandela-boulevard.html", "https://www.southernsun.com/garden-court-nelson-mandela-boulevard"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'garden-court-nelson-mandela-boulevard-walmer-estate'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);
