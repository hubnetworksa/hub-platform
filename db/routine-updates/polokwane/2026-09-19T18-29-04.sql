INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'motus-select-nelson-mandela-drive-superbia', 'Motus Select Nelson Mandela Drive',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  'Corner of N1 & Nelson Mandela Drive, Superbia, Polokwane', '015 299 9500', NULL, NULL,
  'Motus Select Nelson Mandela Drive is a pre-owned vehicle dealership at the corner of the N1 and Nelson Mandela Drive in Superbia, part of the Motus automotive group.',
  NULL, NULL,
  '["https://www.cars.co.za/groups/Motus/Motus-Select-Polokwane-Nelson-Mandela-Drive/2851/", "https://www.motusselect.co.za/dealerships/motus-select-nelson-mandela-drive-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'motus-select-nelson-mandela-drive-superbia'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);
