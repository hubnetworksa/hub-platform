INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woodlands-secondary-school-woodlands', 'Woodlands Secondary School',
  (SELECT id FROM suburbs WHERE slug = 'woodlands'),
  'Mitchell Avenue, Woodlands, Mitchells Plain, Cape Town, 7798', '021 371 0610', NULL, NULL,
  'Woodlands Secondary School is a public secondary school on Mitchell Avenue in Woodlands, Mitchells Plain.',
  NULL, NULL,
  '["https://www.school-register.co.za/school/woodlands-secondary-school/", "https://pathfinda.com/en/mitchells-plain/woodlands/shops-services/woodlands-secondary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woodlands-secondary-school-woodlands'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'highlands-primary-school-woodlands', 'Highlands Primary School',
  (SELECT id FROM suburbs WHERE slug = 'woodlands'),
  'Corner Ajax Way & Highlands Drive, Woodlands, Mitchells Plain, Cape Town, 7785', '021 374 1106', NULL, NULL,
  'Highlands Primary School is a public primary school at the corner of Ajax Way and Highlands Drive, Woodlands.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/mitchells-plain/woodlands/primary-school/highlands-primary-school", "https://www.africanadvice.com/1372585/Schools/Western_Cape/Highlands_Primary_School/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'highlands-primary-school-woodlands'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woodville-primary-school-woodlands', 'Woodville Primary School',
  (SELECT id FROM suburbs WHERE slug = 'woodlands'),
  'Juno Street, Woodlands, Mitchells Plain, Cape Town, 7785', '021 371 6510', NULL, NULL,
  'Woodville Primary School is a dual-medium public primary school on Juno Street, Woodlands, specialising in maths, science and technology.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/woodville-primary-school-woodlands", "https://pathfinda.com/en/mitchells-plain/woodlands/shops-services/woodville-primary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woodville-primary-school-woodlands'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
