INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bishop-lavis-secondary-school-bishop-lavis', 'Bishop Lavis Secondary School',
  (SELECT id FROM suburbs WHERE slug = 'bishop-lavis'),
  '57 Helderberg Road, Bishop Lavis, Cape Town, 7490', '021 300 8877', 'bishoplavishigh.co.za', 'admin@blhs.co.za',
  'Bishop Lavis Secondary School is a public high school in Bishop Lavis.',
  NULL, NULL,
  '["https://www.mycomlink.co.za/organisation.php?i=86", "https://bishoplavishigh.co.za/contact/", "https://blhs.edupage.org/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bishop-lavis-secondary-school-bishop-lavis'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bishop-lavis-primary-school-bishop-lavis', 'Bishop Lavis Primary School',
  (SELECT id FROM suburbs WHERE slug = 'bishop-lavis'),
  'Lavis Rylaan, Lavistown, Bishop Lavis, Cape Town, 7490', '021 934 1030', NULL, NULL,
  'Bishop Lavis Primary School is a public, no-fee primary school in Bishop Lavis.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/bishop-lavis-primary-school/", "https://www.westerncape.gov.za/facility/bishop-lavis-primary-school", "https://www.school-register.co.za/school/bishop-lavis-primary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bishop-lavis-primary-school-bishop-lavis'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
