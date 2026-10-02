INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'anglo-auto-athlone', 'Anglo Auto',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  '35 Belgravia Road, Athlone, Cape Town, 7764', '021 697 1063', 'https://angloauto.co.za', NULL,
  'Anglo Auto is a second-hand vehicle dealership on Belgravia Road, in Athlone.',
  NULL, NULL,
  '["https://angloauto.co.za/contact-and-find-us/", "https://za.africabz.com/western-cape/anglo-auto-169246"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'anglo-auto-athlone'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'medi-kem-pharmacy-athlone', 'Medi-Kem Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  '77 Belgravia Road, Athlone, Cape Town', '021 696 7126', NULL, NULL,
  'Medi-Kem Pharmacy is a retail pharmacy on Belgravia Road, in Athlone.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=87334", "https://business-service-directory.com/za/listing/medi-kem-pharmacy-46264"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medi-kem-pharmacy-athlone'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
