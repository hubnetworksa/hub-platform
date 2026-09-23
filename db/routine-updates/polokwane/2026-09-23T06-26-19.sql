INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'grace-and-hope-special-school-seshego-zone-1', 'Grace and Hope Special School',
  (SELECT id FROM suburbs WHERE slug = 'seshego-zone-1'),
  '8296 Zone 1, Seshego, Polokwane, 0742', '015 223 1086', NULL, NULL,
  'Grace and Hope Special School is a public special-needs school in Seshego Zone 1, providing education for learners with intellectual disabilities.',
  NULL, NULL,
  '["https://heyschools.co.za/0784704/Grace_and_Hope_Special_School_Seshego", "https://www.school-register.co.za/school/grace-and-hope-special-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'grace-and-hope-special-school-seshego-zone-1'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mponegele-primary-school-seshego-zone-1', 'Mponegele Primary School',
  (SELECT id FROM suburbs WHERE slug = 'seshego-zone-1'),
  '1 Zone 1, Seshego-A, Seshego, Polokwane, 0742', '015 223 5403', NULL, NULL,
  'Mponegele Primary School is a public primary school in Seshego Zone 1, Polokwane.',
  NULL, NULL,
  '["https://www.schools4sa.co.za/school-profile/mponegele-primary/", "https://schoolhive.co.za/listing/mponegele-primary-school-seshego-application-guide/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mponegele-primary-school-seshego-zone-1'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
