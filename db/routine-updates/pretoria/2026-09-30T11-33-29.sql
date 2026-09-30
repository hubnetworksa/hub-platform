-- Discovery checkpoint: Roseville, Pretoria
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hillview-high-school-roseville', 'Hillview High School',
  (SELECT id FROM suburbs WHERE slug = 'roseville'),
  '71 Franzina Street, Roseville, Pretoria, 0084', '012 945 1793', NULL, NULL,
  'Hillview High School is a public, English-medium co-educational high school for grades 8 to 12, founded in 1955 and based on its Roseville campus since 1979, with about 1,500 pupils enrolled.',
  NULL, NULL,
  '["https://schoolhive.co.za/listing/hillview-high-school-pretoria-admissions-contact-details/", "https://www.edupstairs.org/teaching-posts/52777/", "https://en.wikipedia.org/wiki/Hillview_High_School"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hillview-high-school-roseville'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
