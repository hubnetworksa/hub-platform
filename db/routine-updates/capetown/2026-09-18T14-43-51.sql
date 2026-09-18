INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'walmer-estate-primary-school-walmer-estate', 'Walmer Estate Primary School',
  (SELECT id FROM suburbs WHERE slug = 'walmer-estate'),
  'Cambridge Street, Walmer Estate, Cape Town', '021 447 6760', NULL, NULL,
  'Walmer Estate Primary School is a public primary school serving the Walmer Estate community.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/walmer-estate-primary-school/", "https://www.school-register.co.za/school/walmer-estate-primary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'walmer-estate-primary-school-walmer-estate'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
