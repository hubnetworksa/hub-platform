INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'masiphumelele-high-school-masiphumelele', 'Masiphumelele High School',
  (SELECT id FROM suburbs WHERE slug = 'masiphumelele'),
  'Cnr Chasmay and Guinefowl Road, Masiphumelele, Cape Town, 7975', '021 785 4078', NULL, NULL,
  'Masiphumelele High School is a public secondary school in Masiphumelele offering grades 8 to 12.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/masiphumelele-high-school-fish-hoek", "https://nearbyza.com/place/masiphumelele-high-school", "https://en.wikipedia.org/wiki/Masiphumelele_High_School"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'masiphumelele-high-school-masiphumelele'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ukhanyo-primary-school-masiphumelele', 'Ukhanyo Primary School',
  (SELECT id FROM suburbs WHERE slug = 'masiphumelele'),
  '64 Pokela Road, Masiphumelele, Cape Town, 7975', '021 785 2442', NULL, NULL,
  'Ukhanyo Primary School is a public no-fee primary school in Masiphumelele.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/10689987_3", "https://www.callupcontact.com/b/Public_Primary_Elementary_Schools/UKHANYO_PRIMARY_SCHOOL/7925", "https://www.westerncape.gov.za/education/facility/ukhanyo-primary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ukhanyo-primary-school-masiphumelele'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
