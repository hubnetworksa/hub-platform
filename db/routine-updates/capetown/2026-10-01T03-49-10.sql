INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'portland-secondary-school-portland', 'Portland Secondary School',
  (SELECT id FROM suburbs WHERE slug = 'portland'),
  'Cnr Merrydale & Morgenster Road, Portland, Mitchells Plain, Cape Town, 7785', '021 374 4141', NULL, NULL,
  'Portland Secondary School is a public secondary school on the corner of Merrydale and Morgenster Roads, Portland, Mitchells Plain.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/portland-secondary-school/", "https://skools.co.za/listings/portland-secondary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'portland-secondary-school-portland'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hazeldene-primary-school-portland', 'Hazeldene Primary School',
  (SELECT id FROM suburbs WHERE slug = 'portland'),
  'Hazeldene Avenue, Portland, Mitchells Plain, Cape Town, 7785', '021 392 1110', NULL, 'hazeldene.prim@wcgschools.gov.za',
  'Hazeldene Primary School is a public primary school on Hazeldene Avenue, Portland, Mitchells Plain.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/education/facility/hazeldene-primary-school", "https://schoolsdigest.co.za/listings/hazeldene-primary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hazeldene-primary-school-portland'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
