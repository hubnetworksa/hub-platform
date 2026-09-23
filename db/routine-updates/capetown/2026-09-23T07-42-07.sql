INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'matroosfontein-primary-school-matroosfontein', 'Matroosfontein Primary School',
  (SELECT id FROM suburbs WHERE slug = 'matroosfontein'),
  'Yorkweg, Matroosfontein, Cape Town, 7490', '021 931 3263', NULL, NULL,
  'Matroosfontein Primary School is a public primary school on Yorkweg in Matroosfontein.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/education/facility/matroosfontein-primary-school", "https://schoolsdigest.co.za/listings/matroosfontein-primary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'matroosfontein-primary-school-matroosfontein'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'holy-trinity-rc-primary-school-matroosfontein', 'Holy Trinity RC Primary School',
  (SELECT id FROM suburbs WHERE slug = 'matroosfontein'),
  'St Dominic Street, Matroosfontein, Cape Town, 7490', '021 931 2604', NULL, NULL,
  'Holy Trinity RC Primary School is a Catholic primary school on St Dominic Street in Matroosfontein.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/education/facility/matroosberg-holy-trinity-rc-primary-school", "https://www.callupcontact.com/b/Public_Primary_Elementary_Schools/MATROOS_HOLY_TRINITY_RC_PRIMARY_SCHOOL/7388"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'holy-trinity-rc-primary-school-matroosfontein'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'marian-rc-secondary-school-matroosfontein', 'Marian RC Secondary School',
  (SELECT id FROM suburbs WHERE slug = 'matroosfontein'),
  'St Dominic Street, Matroosfontein, Cape Town, 7490', '071 152 6240', NULL, NULL,
  'Marian RC Secondary School is a Catholic secondary school on St Dominic Street in Matroosfontein.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/education/facility/marian-rc-secondary-school", "https://schoolsdigest.co.za/listings/marian-rc-secondary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'marian-rc-secondary-school-matroosfontein'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'durrheim-post-office-matroosfontein', 'Durrheim Post Office',
  (SELECT id FROM suburbs WHERE slug = 'matroosfontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'charlesville-mall-matroosfontein'),
  'Charlesville Mall, Valhalla Drive, Charlesville, Matroosfontein, Cape Town, 7490', '086 011 1502', NULL, NULL,
  'Durrheim Post Office is a South African Post Office branch inside Charlesville Mall in Matroosfontein.',
  NULL, NULL,
  '["https://pathfinda.com/en/matroosfontein/charlesville/shops-services/durrheim-post-office", "https://www.blaauwberg.net/south-african-post-offices/310/durrheim-post-office"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'durrheim-post-office-matroosfontein'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);
