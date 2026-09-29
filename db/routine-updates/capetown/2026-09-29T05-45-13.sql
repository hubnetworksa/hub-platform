INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sun-valley-primary-school-sun-valley', 'Sun Valley Primary School',
  (SELECT id FROM suburbs WHERE slug = 'sun-valley'),
  'Brigantine Avenue, Sun Valley, Cape Town', '021 785 2722', 'https://www.sunvalleyprimary.co.za', NULL,
  'Sun Valley Primary School is a primary school in Sun Valley, Cape Town.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/sun-valley-primary-school-55434", "https://www.sunvalleyprimary.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sun-valley-primary-school-sun-valley'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
