INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'citton-cars-menlyn-menlyn', 'Citton Cars Menlyn',
  (SELECT id FROM suburbs WHERE slug = 'menlyn'),
  '109 Atterbury Road, Menlyn, Pretoria', '012 865 0100', 'https://www.cittoncars.co.za/', NULL,
  'Citton Cars Menlyn is a used-vehicle dealership with over 30 years'' experience buying and selling pre-owned cars; every vehicle undergoes an independent Bosch 160-point inspection and comes with a 2-month/3,000km warranty, and the dealership also offers vehicle financing, trade-in evaluations, car insurance and on-site Bosch Car Service.',
  NULL, NULL,
  '["https://www.cittoncars.co.za/", "https://www.autotrader.co.za/dealer/citton-cars-menlyn/7912"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'citton-cars-menlyn-menlyn'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-capital-menlyn-maine-menlyn', 'The Capital Menlyn Maine',
  (SELECT id FROM suburbs WHERE slug = 'menlyn'),
  '194 Bancor Avenue, Menlyn Maine, Pretoria, 0010', '+27 12 348 4551', 'https://www.thecapital.co.za/menlyn/', NULL,
  'The Capital Menlyn Maine is a 5-star hotel in the Menlyn Maine precinct with 175 accommodations spanning standard and executive rooms, disability-friendly rooms, one-, two- and three-bedroom self-catering apartments, and two-bedroom penthouses, plus an outdoor pool, spa, conference centre and fitness facilities.',
  NULL, NULL,
  '["https://www.thecapital.co.za/menlyn/", "https://www.trabber.de/en/hotels/south-africa-za/pretoria-964137/the-capital-menlyn-maine-382369002"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-capital-menlyn-maine-menlyn'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);
