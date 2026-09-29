INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ohana-cafe-kalk-bay', 'Ohana Cafe',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  '23 Main Road, Kalk Bay, Cape Town, 7946', '021 054 6340', NULL, NULL,
  'Ohana Cafe is a beachfront cafe in Kalk Bay serving breakfast and lunch in a family-friendly, dog-friendly setting.',
  NULL, NULL,
  '["https://www.capetown.travel/listing/ohana-cafe/", "https://www.facebook.com/ohana.kalkbay"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ohana-cafe-kalk-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'live-bait-kalk-bay', 'Live Bait',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  'Kalk Bay Harbour, Kalk Bay, Cape Town', '021 788 5755', NULL, NULL,
  'Live Bait is a seafood and sushi restaurant on the water''s edge at Kalk Bay Harbour, open since 1999.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/live-bait-restaurant", "https://www.eatout.co.za/venue/live-bait-kalk-bay/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'live-bait-kalk-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kalk-bay-gallery-kalk-bay', 'Kalk Bay Gallery',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  '62 Main Road, Kalk Bay, Cape Town, 7975', '021 788 1674', NULL, NULL,
  'Kalk Bay Gallery is a contemporary South African art gallery in Kalk Bay, housed in the distinctive Orange Building since 1995.',
  NULL, NULL,
  '["https://www.oriberg.co.za/listing/the-kalk-bay-gallery/", "https://time.com/archive/6937976/ten-good-reasons-to-visit-kalk-bay/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kalk-bay-gallery-kalk-bay'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
