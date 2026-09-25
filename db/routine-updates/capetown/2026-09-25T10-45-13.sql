-- Jobs 1-2: Hanover Park new business
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hanover-park-dental-clinic-hanover-park', 'Hanover Park Dental Clinic',
  (SELECT id FROM suburbs WHERE slug = 'hanover-park'),
  'Cnr Hanlyn Walk & Hanover Park Avenue, Hanover Park, Cape Town, 7780', '021 692 1333', NULL, NULL,
  'Hanover Park Dental Clinic is a dental practice on the corner of Hanlyn Walk and Hanover Park Avenue, in Hanover Park.',
  NULL, NULL,
  '["https://za.readymap.info/4/22040", "https://za.polomap.com/windsor-park/27920"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hanover-park-dental-clinic-hanover-park'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
