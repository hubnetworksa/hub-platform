INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'anchor-bay-workation-three-anchor-bay', 'Anchor Bay Workation',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '150 High Level Road, Three Anchor Bay, Cape Town, 8050', '021 201 8901', NULL, NULL,
  'Anchor Bay Workation is a guest house with co-working facilities, in Three Anchor Bay.',
  NULL, NULL,
  '["https://anchorbayworkation.co.za/home-page/", "https://www.booking.com/hotel/za/anchor-bay-workation.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'anchor-bay-workation-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bayflowers-guesthouse-three-anchor-bay', 'Bayflowers Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '5 Scholtz Road, Three Anchor Bay, Cape Town, 8005', '021 434 0968', NULL, NULL,
  'Bayflowers Guesthouse is a guest house, in Three Anchor Bay.',
  NULL, NULL,
  '["https://www.bayflowers.co.za/", "https://www.hotelplanner.com/Hotels/299753/Reservations-Bayflowers-Guesthouse-Cape-Town-5-Scholtz-Rd-Three-Anchor-Bay-8005-Cape-Town-Sout-8005"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bayflowers-guesthouse-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
