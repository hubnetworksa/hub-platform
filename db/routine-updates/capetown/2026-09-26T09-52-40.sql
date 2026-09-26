INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sinenjongo-high-school-joe-slovo-park', 'Sinenjongo High School',
  (SELECT id FROM suburbs WHERE slug = 'joe-slovo-park'),
  '11a Freedom Way, Joe Slovo Park, Milnerton, Cape Town, 7441', '021 204 0590', NULL, NULL,
  'Sinenjongo High School is a public, no-fee secondary school serving Grades 8 to 12 in Joe Slovo Park, Milnerton.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/sinenjongo-high-school/", "https://www.school-register.co.za/school/sinenjongo-high-school/", "https://skools.co.za/listings/sinenjongo-high-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sinenjongo-high-school-joe-slovo-park'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
