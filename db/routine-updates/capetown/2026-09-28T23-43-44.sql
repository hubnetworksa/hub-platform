-- Jobs 1-2: Fish Hoek -- 2 new businesses, no new shopping centres

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-cutting-room-fish-hoek', 'The Cutting Room',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  '8 Kommetjie Road, Fish Hoek, Cape Town, 7975', '021 782 9904', NULL, NULL,
  'The Cutting Room is a hairdressing salon in Fish Hoek.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/the-cutting-room-230879", "https://www.fresha.com/lvp/the-cutting-room-kommetjie-road-cape-town-q8QZ4q"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-cutting-room-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'de-kock-estates-fish-hoek', 'De Kock Estates',
  (SELECT id FROM suburbs WHERE slug = 'fish-hoek'),
  '1 Central Road, Fish Hoek, Cape Town, 7975', '021 782 6023', 'https://www.dekockestates.co.za/', NULL,
  'De Kock Estates is an estate agency in Fish Hoek.',
  NULL, NULL,
  '["https://www.dekockestates.co.za/", "https://www.yellosa.co.za/company/855865/de-kock-property-group-fish-hoek"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'de-kock-estates-fish-hoek'),
  (SELECT id FROM categories WHERE slug = 'estate-agents'),
  1
);
