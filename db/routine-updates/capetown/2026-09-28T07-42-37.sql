INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'az-berman-primary-school-beacon-valley', 'A.Z. Berman Primary School',
  (SELECT id FROM suburbs WHERE slug = 'beacon-valley'),
  'Cnr AZ Berman Avenue & Kerrem Avenue, Beacon Valley, Mitchells Plain, Cape Town, 7798', '021 376 7802', NULL, 'admin@azberman.wcap.school.za',
  'A.Z. Berman Primary School is a public primary school in Beacon Valley, Mitchells Plain.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/a-z-berman-primary-school/", "https://www.callupcontact.com/b/business/A_Z_Berman_Primary_School/74522", "https://www.brabys.com/za/western-cape/mitchells-plain/beacon-valley/primary-school/a-z-berman-primary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'az-berman-primary-school-beacon-valley'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'beacon-view-primary-school-beacon-valley', 'Beacon View Primary School',
  (SELECT id FROM suburbs WHERE slug = 'beacon-valley'),
  'Wanderers Crescent, Beacon Valley, Mitchells Plain, Cape Town, 7785', '021 376 1079', NULL, NULL,
  'Beacon View Primary School is a public, no-fee primary school in Beacon Valley, Mitchells Plain.',
  NULL, NULL,
  '["https://schoolseek.co.za/school/beacon-view-primary-school-106490539/", "https://schoolsdigest.co.za/listings/beacon-view-primary-school/", "http://pathfinda.com/en/mitchells-plain/beacon-valley/shops-services/beacon-view-primary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'beacon-view-primary-school-beacon-valley'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'alpine-primary-school-beacon-valley', 'Alpine Primary School',
  (SELECT id FROM suburbs WHERE slug = 'beacon-valley'),
  'Cnr Alpine & Glider Street, Beacon Valley, Mitchells Plain, Cape Town, 7785', '021 376 1321', NULL, 'admin@alpineps.wcape.school.za',
  'Alpine Primary School is a public primary school in Beacon Valley, Mitchells Plain.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/alpine-primary-school/", "https://www.callupcontact.com/b/business/Alpine_Primary_School/132043", "https://www.brabys.com/za/western-cape/mitchells-plain/beacon-valley/primary-school/alpine-primary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'alpine-primary-school-beacon-valley'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ieglaasi-nieyah-primary-school-beacon-valley', 'Ieglaasi Nieyah Primary School',
  (SELECT id FROM suburbs WHERE slug = 'beacon-valley'),
  '6 Kyalami Street, Beacon Valley, Mitchells Plain, Cape Town, 7785', '021 376 7614', NULL, NULL,
  'Ieglaasi Nieyah Primary School is an independent primary school in Beacon Valley, Mitchells Plain.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/ieglaasi-nieyah-school/", "https://www.brabys.com/za/western-cape/mitchells-plain/beacon-valley/islamic-school/ieglaasi-nieyah-primary-school", "https://educationsouthafrica.com/schools/western-cape/city-of-cape-town/ieglaasi-nieyah-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ieglaasi-nieyah-primary-school-beacon-valley'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
