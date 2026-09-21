INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ya-rena-construction-ladanna', 'Ya-Rena Construction',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '9 Yster Street, Ladanna, Polokwane, 0699', '015 293 1221', 'https://www.yarena.co.za', NULL,
  'Ya-Rena Construction is a civil engineering and construction company in Ladanna, established in 1995, specialising in reservoirs, dams, bridges, mining infrastructure, water and wastewater treatment plants, and aggregate crushing.',
  NULL, NULL,
  '["https://www.yarena.co.za/", "https://www.procompare.co.za/providers/ya-rena-construction"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ya-rena-construction-ladanna'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);
