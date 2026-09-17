INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'trinityhouse-heritage-hill-heritage-hill-estate', 'Trinityhouse Heritage Hill',
  (SELECT id FROM suburbs WHERE slug = 'heritage-hill-estate'),
  '1 Pudding Stone St, Louwlardia, Centurion', '+27 12 003 1395', NULL, NULL,
  'Trinityhouse Heritage Hill is a private school in the Heritage Hill Estate area of Centurion.',
  NULL, NULL,
  '["https://saprivateschools.co.za/listing/trinityhouse-heritage-hill-primary-school/", "https://www.schoolguide.co.za/schools/private-schools/trinityhouse-high-school-heritage-hill.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'trinityhouse-heritage-hill-heritage-hill-estate'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
