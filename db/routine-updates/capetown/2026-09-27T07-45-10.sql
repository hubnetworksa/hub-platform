INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'claremont-dental-claremont', 'Claremont Dental',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  'Shop A1, Ground Floor, Protea Place, 40 Dreyer Street, Claremont, Cape Town', '021 683 1237', NULL, NULL,
  'Claremont Dental is a dental practice in Claremont offering general and family dentistry.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=person&personcode=1917841", "https://www.recomed.co.za/dentist/cape-town/shadley-bruintjies/27498/35309/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'claremont-dental-claremont'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
