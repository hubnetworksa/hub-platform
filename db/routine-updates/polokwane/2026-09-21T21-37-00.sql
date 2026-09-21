INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'barloworld-equipment-ladanna', 'Barloworld Equipment',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '83 Pietersburg Street, Ladanna, Polokwane, 0699', '015 297 3603', NULL, NULL,
  'Barloworld Equipment is an earthmoving and industrial equipment dealership in Ladanna, Polokwane.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/174475/barloworld-equipment-polokwane", "https://vymaps.com/ZA/Barloworld-Equipment--Polokwane-213429/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barloworld-equipment-ladanna'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
