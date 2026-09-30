INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'telecom-installations-stellenberg', 'Telecom Installations CC',
  (SELECT id FROM suburbs WHERE slug = 'stellenberg'),
  '11 Woltemade Street, Stellenberg, Durbanville, Cape Town, 7550', '021 910 1111', 'https://www.mytelecom.co.za', NULL,
  'Telecom Installations CC is a telephone systems and security installer supplying and installing PABX systems, CCTV, public address systems and intercoms, in Stellenberg.',
  NULL, NULL,
  '["http://www.mytelecom.co.za/services.html", "http://www.yellowpages.co.za/business/SA_6419260_BUS"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'telecom-installations-stellenberg'),
  (SELECT id FROM categories WHERE slug = 'fencing-security-installations'),
  1
);
