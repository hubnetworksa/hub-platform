INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'komatsu-southern-africa-ladanna', 'Komatsu Southern Africa',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '38 Yster Street, Ladanna, Polokwane, 0699', '015 293 1121', NULL, NULL,
  'Komatsu Southern Africa is a branch of the equipment supplier and service centre in Ladanna, Polokwane.',
  NULL, NULL,
  '["https://komatsu.co.za/contact/polokwane", "https://www.eeziads.co.za/p/548594/komatsu-southern-africa-pty-ltd"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'komatsu-southern-africa-ladanna'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
