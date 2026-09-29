INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'indigo-scuba-gordons-bay', 'Indigo Scuba',
  (SELECT id FROM suburbs WHERE slug = 'gordons-bay'),
  '16 Blue Gum Avenue, Mountainside, Gordon''s Bay, 7140', '083 268 1851', 'https://www.indigoscuba.com', NULL,
  'Indigo Scuba is an owner-run scuba diving centre in Gordon''s Bay offering PADI diving certifications, guided dives, boat charters, dive equipment sales, swimming lessons and aqua aerobics classes, with a dive shop and heated indoor training pool on site.',
  NULL, NULL,
  '["https://www.indigoscuba.com/contact-us/", "https://www.waze.com/live-map/directions/indigo-scuba-diving-centre-bluegum-ave-16-gordons-bay"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'indigo-scuba-gordons-bay'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'just-africa-scuba-gordons-bay', 'Just Africa Scuba',
  (SELECT id FROM suburbs WHERE slug = 'gordons-bay'),
  'Shop 2, Krystal Beach Hotel, 9 Breakwater Lane, Harbour Island, Gordon''s Bay, 7140', '082 598 1884', 'https://www.justscuba.co.za', NULL,
  'Just Africa Scuba is a PADI 5-Star Instructor Development Centre and watersports shop in Gordon''s Bay, offering scuba diving courses, dive trips, snorkelling trips, equipment sales and rental from its shop at the Krystal Beach Hotel.',
  NULL, NULL,
  '["https://www.justscuba.co.za/", "https://www.padi.com/dive-center/south-africa/just-africa-scuba/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'just-africa-scuba-gordons-bay'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
