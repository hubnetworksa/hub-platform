-- Muizenberg: 3 new businesses

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tortuga-loca-muizenberg', 'Tortuga Loca',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '141 Main Road, Muizenberg, Cape Town', '087 095 5733', NULL, NULL,
  'Tortuga Loca is a Mexican and Latin American-inspired restaurant on Main Road, Muizenberg.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/tortuga-loca-336033", "https://www.tripadvisor.co.za/Restaurant_Review-g1509162-d23865039-Reviews-Tortuga_Loca-Muizenberg_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tortuga-loca-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bang-k-muizenberg', 'Bang K',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '2 York Road, Muizenberg, Cape Town', '082 373 5045', NULL, NULL,
  'Bang K is a Thai-inspired restaurant on York Road, Muizenberg.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/bang-k/", "https://www.eatout.co.za/venue/bang-k/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bang-k-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rustenburg-pharmacy-muizenberg', 'Rustenburg Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '48 Beach Road, Muizenberg, Cape Town', '021 788 8028', 'https://www.alphapharmacies.co.za/department/rustenburg-pharmacy/', 'speak-to-us@alphapharm.co.za',
  'Rustenburg Pharmacy is a pharmacy on Beach Road, Muizenberg.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/rustenburg-pharmacy-144329", "https://www.brabys.com/za/western-cape/cape-town/muizenberg/pharmacies/rustenburg-pharmacy-muizenberg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rustenburg-pharmacy-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
