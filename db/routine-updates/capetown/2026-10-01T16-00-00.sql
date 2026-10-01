INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ocean-view-house-bakoven', 'Ocean View House',
  (SELECT id FROM suburbs WHERE slug = 'bakoven'),
  '33 Victoria Road, Bakoven, Cape Town, 8005', '021 438 1982', 'https://oceanview-house.com', NULL,
  'Ocean View House is a family-run guesthouse on the Atlantic coast, in Bakoven.',
  NULL, NULL,
  '["https://oceanview-house.com/contact-us", "https://www.sa-venues.com/visit/oceanviewbakoven/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ocean-view-house-bakoven'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
