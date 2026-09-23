INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'taxila-secondary-school-nirvana', 'Taxila Secondary School',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  '347 Orient Drive, Nirvana, Polokwane, 0699', '015 292 1475', 'https://taxilasecondaryschool.co.za/', NULL,
  'Taxila Secondary School is a public high school in Nirvana known for its academic performance and Matric pass rates, and also serves as a community hub facilitating Home Affairs services for learners.',
  NULL, NULL,
  '["https://taxilasecondaryschool.co.za/", "https://schoolsdigest.co.za/listings/taxila/", "https://www.school-register.co.za/school/taxila/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'taxila-secondary-school-nirvana'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
