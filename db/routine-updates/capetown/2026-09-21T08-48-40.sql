INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'macassar-primary-school-macassar', 'Macassar Primary School',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  'Krymekaar Street, Macassar, Somerset West, 7130', '021 857 2400', NULL, NULL,
  'Macassar Primary School is a public primary school in Macassar, Somerset West.',
  NULL, NULL,
  '["https://macassarps.org.za/", "https://www.brabys.com/za/western-cape/somerset-west/macassar/primary-school/macassar-primary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'macassar-primary-school-macassar'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'macassar-secondary-school-macassar', 'Macassar Secondary School',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  'Ring Avenue, Macassar, Cape Town, 7130', '021 857 1090', NULL, NULL,
  'Macassar Secondary School is a public secondary school in Macassar, Cape Town.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/macassar-sek/", "https://skools.co.za/listings/macassar-secondary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'macassar-secondary-school-macassar'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'marvin-park-primary-school-macassar', 'Marvin Park Primary School',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  '1 Basestraat, Macassar, 7134', '021 857 2257', NULL, NULL,
  'Marvin Park Primary School is a public primary school in Macassar.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/marvin-park-primary-school/", "https://www.brabys.com/za/western-cape/somerset-west/macassar/primary-school/marvin-park-primary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'marvin-park-primary-school-macassar'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'oklahoma-street-primary-school-macassar', 'Oklahoma Street Primary School',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  'Oklahoma Street, Macassar, 7130', '021 857 1610', NULL, NULL,
  'Oklahoma Street Primary School is a public primary school in Macassar.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/666151/oklahoma-street-primary-school", "https://skools.co.za/listings/oklahomastraat-primary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'oklahoma-street-primary-school-macassar'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'macassar-community-health-clinic-macassar', 'Macassar Community Health Clinic',
  (SELECT id FROM suburbs WHERE slug = 'macassar'),
  'Cnr Hospital & Musica Avenue, Macassar, Somerset West, 7130', '021 875 2251', NULL, NULL,
  'Macassar Community Health Clinic is a public health clinic in Macassar, Somerset West.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/facility/macassar-community-health-clinic", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=94772"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'macassar-community-health-clinic-macassar'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
