INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ocean-fresh-fisheries-kraaifontein', 'Ocean Fresh Fisheries',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  '1 Stop and Shop Centre, Corner Conroy Street, Kraaifontein, Cape Town, 7570', '069 460 5396', NULL, NULL,
  'Ocean Fresh Fisheries is a fast-food takeaway in Kraaifontein serving gatsbys, steaks and fish and chips.',
  NULL, NULL,
  '["https://restaurantguru.com/Ocean-Fresh-Kraaifontein-Cape-Town", "https://www.xperiencecapetown.com/listing/ocean-fresh-kraaifontein/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ocean-fresh-fisheries-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'alpha-pharm-kraaifontein', 'Alpha Pharm Kraaifontein',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  'Darwin Centre, Corner Darwin & Dan King Road, Kraaifontein, Cape Town, 7570', '087 086 9493', NULL, NULL,
  'Alpha Pharm Kraaifontein is a pharmacy on the corner of Darwin and Dan King Road in Kraaifontein.',
  NULL, NULL,
  '["https://www.alphapharmacies.co.za/department/kraaifontein-pharmacy/", "https://www.tiendeo.co.za/stores/kraaifontein/alpha-pharm-corner-darwin-and-dan-king-roadkraaifontein/68141"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'alpha-pharm-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bloch-kem-pharmacy-kraaifontein', 'Bloch-Kem Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  'Shop 18A, Bloch Shopping Centre, 18 Van Riebeeck Road, Kraaifontein, Cape Town', '021 986 0171', NULL, NULL,
  'Bloch-Kem Pharmacy is a pharmacy on Van Riebeeck Road in Kraaifontein.',
  NULL, NULL,
  '["https://bloch-kem.co.za/", "https://www.brabys.com/za/western-cape/kraaifontein/pharmacies/bloch-kem-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bloch-kem-pharmacy-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
