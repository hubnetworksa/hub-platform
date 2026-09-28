INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'crossroads-cdc-crossroads', 'Crossroads CDC',
  (SELECT id FROM suburbs WHERE slug = 'crossroads'),
  'Cwayi Street, Crossroads, Cape Town, 7750', '021 386 1119', NULL, NULL,
  'Crossroads CDC is a public health clinic providing primary healthcare services, in Crossroads.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/health-wellness/facility/crossroads-cdc", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=94628"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'crossroads-cdc-crossroads'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
