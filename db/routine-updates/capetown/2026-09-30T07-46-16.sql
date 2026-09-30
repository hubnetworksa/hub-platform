INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'instruments-south-africa-paarden-eiland', 'Instruments South Africa',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '20 Section Street, Paarden Eiland, Cape Town, 7420', '021 510 2575', 'http://isafrica.za.net', NULL,
  'Instruments South Africa is a supplier and service provider of marine and industrial instrumentation, including ballast water treatment systems, gas detection equipment and fire safety instruments, in Paarden Eiland.',
  NULL, NULL,
  '["http://isafrica.za.net/valves/", "https://www.yellosa.co.za/company/948174/instruments-south-africaptyltd"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'instruments-south-africa-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ice-cape-town-paarden-eiland', 'Ice Cape Town',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  'Unit 11B Marine Industrial Park, 8 Service Road, Paarden Eiland, Cape Town, 7405', '021 511 4257', 'https://www.icecape.co.za', NULL,
  'Ice Cape Town is a factory shop and ice supplier in Paarden Eiland, selling tube, crushed and block ice, dry ice, cooler boxes and ice packs on a card-only basis.',
  NULL, NULL,
  '["https://www.icecape.co.za/find-us", "https://www.hqicecape.co.za/about"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ice-cape-town-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
