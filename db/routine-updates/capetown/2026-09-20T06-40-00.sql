INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'akmed-pharmacy-grassy-park', 'Akmed Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  'Shop 2, Aashi Qually Centre, Cnr 4th Avenue & Lake Road, Grassy Park, Cape Town, 7941', '021 705 0927', NULL, NULL,
  'Akmed Pharmacy is a retail pharmacy in Grassy Park, at the corner of 4th Avenue and Lake Road.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=247005", "https://www.brabys.com/za/western-cape/grassy-park/pharmacies/akmed-pharmacy-cc"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'akmed-pharmacy-grassy-park'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
