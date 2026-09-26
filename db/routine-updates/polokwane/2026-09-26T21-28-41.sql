INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mayfair-gearbox-annadale', 'Mayfair Gearbox Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'annadale'),
  '12 Witklip Street, Annadale, Polokwane', '015 293 1440', NULL, NULL,
  'Mayfair Gearbox Polokwane is the local branch of a national gearbox and differential repair franchise in Annadale, servicing manual and automatic transmissions for passenger vehicles, 4x4s, trucks and heavy commercial vehicles.',
  NULL, NULL,
  '["https://members.rmi.org.za/listing/mayfair-gearbox-polokwane/", "https://www.motors24.co.za/portfolio/mayfair-gearbox/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mayfair-gearbox-annadale'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);
