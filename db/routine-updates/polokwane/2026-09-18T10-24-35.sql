INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'standard-bank-mankweng-service-centre-mankweng', 'Standard Bank Mankweng Service Centre',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  '614 University Road, Tintis Square, Mankweng', '0860 123 000', NULL, NULL,
  'Standard Bank Mankweng Service Centre is a bank branch offering everyday banking services, in Mankweng.',
  NULL, NULL,
  '["https://za.near-place.com/standard-bank-mankweng-service-centre-614-university-road-tintis-square-mankweng", "https://za.polomap.com/polokwane/1420"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'standard-bank-mankweng-service-centre-mankweng'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);
