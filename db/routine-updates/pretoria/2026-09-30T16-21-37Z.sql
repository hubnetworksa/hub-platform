INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'boitekanelo-private-health-care-soshanguve', 'Boitekanelo Private Health Care',
  (SELECT id FROM suburbs WHERE slug = 'soshanguve'),
  '7960 Extension 11, Soshanguve East, Soshanguve, Pretoria, 0152', '012 793 3041',
  'https://boitekanelohealth.co.za', NULL,
  'Boitekanelo Private Health Care is a primary healthcare facility in Soshanguve offering medical, dental, laboratory, allied health, and mother-and-child care services, established in 2019.',
  NULL, NULL,
  '["https://www.health.gov.za/ccmdd-pick-up-points/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1891413", "https://boitekanelohealth.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'boitekanelo-private-health-care-soshanguve'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
