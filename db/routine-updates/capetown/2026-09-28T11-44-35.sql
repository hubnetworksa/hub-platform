INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'heideveld-secondary-school-heideveld', 'Heideveld Secondary School',
  (SELECT id FROM suburbs WHERE slug = 'heideveld'),
  '1 Waterberg Rd, Heideveld, Cape Town, 7764', '021 637 8530', NULL, 'heideveldhigh@gmail.com',
  'Heideveld Secondary School is a public high school on Waterberg Road, Heideveld, serving grades 8 to 12.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/heideveld/secondary-school/heideveld-secondary-school", "https://www.searchinafrica.com/business/4820816/south-africa/western-cape/heideveld/waterberg-rd/secondary-school/schools/heideveld-secondary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'heideveld-secondary-school-heideveld'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
