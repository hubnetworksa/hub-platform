INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'du-noon-community-health-centre-dunoon', 'Du Noon Community Health Centre',
  (SELECT id FROM suburbs WHERE slug = 'dunoon'),
  '236 Potsdam Road, Dunoon, Cape Town, 7441', '021 200 4500', NULL, NULL,
  'Du Noon Community Health Centre is a public health clinic on Potsdam Road serving Dunoon, offering 24-hour emergency healthcare services.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/health-wellness/facility/du-noon-chc", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=361892"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'du-noon-community-health-centre-dunoon'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
