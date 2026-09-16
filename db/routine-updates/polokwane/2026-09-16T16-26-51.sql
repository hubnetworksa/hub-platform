INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dorothy-langa-primary-school-seshego', 'Dorothy Langa Primary School',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  'No 3818, Zone 2, Seshego, Polokwane, 0742', '015 223 5289', NULL, NULL,
  'Dorothy Langa Primary School is a public, no-fee primary school in Zone 2, Seshego, Polokwane.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/dorothy-langa/", "https://www.school-register.co.za/school/dorothy-langa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dorothy-langa-primary-school-seshego'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'millennium-combined-school-seshego', 'Millennium Combined School',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  '26 Madiba St, Seshego-9E Ext 4, Polokwane, 0742', '015 223 4909', NULL, NULL,
  'Millennium Combined School is a public combined school serving primary and secondary learners in Seshego, Polokwane.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/millennium-college/", "https://www.school-register.co.za/school/millennium-college/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'millennium-combined-school-seshego'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
