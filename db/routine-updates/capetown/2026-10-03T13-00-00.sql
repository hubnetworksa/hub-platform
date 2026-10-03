INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'west-coast-tyres-montague-gardens', 'West Coast Tyres',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  '4 Montague Drive, Montague Gardens, Cape Town, 7441', '021 551 2416', NULL, NULL,
  'West Coast Tyres is a tyre and exhaust fitment centre trading as a Dunlop Zone dealer, in Montague Gardens.',
  NULL, NULL,
  '["https://africa.michelin.com/en/auto/dealer-locator/montague-gardens/west-coast-tyres-1148614078", "https://www.autorepairdirectory.co.za/listing.php?listings_id=3055"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'west-coast-tyres-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);
