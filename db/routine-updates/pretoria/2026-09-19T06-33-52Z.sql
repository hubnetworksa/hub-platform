INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dsv-logistics-kosmosdal', 'DSV Logistics',
  (SELECT id FROM suburbs WHERE slug = 'kosmosdal'),
  'N1 Business Park, 5 Slate Rd, Kosmosdal, Centurion, 1685', '012 673 2000', 'https://www.dsv.com', NULL,
  'DSV Logistics operates a freight and distribution facility in Kosmosdal, Centurion.',
  NULL, NULL,
  '["https://www.dsv.com/en/countries/africa/south-africa/centurion/dsv-logistics-zazay007", "https://www.snupit.co.za/centurion/kosmosdal/dsv-distribution/388316"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dsv-logistics-kosmosdal'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);
