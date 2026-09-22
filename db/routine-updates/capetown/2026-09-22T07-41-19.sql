INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-parow-centre-parow', 'Dis-Chem Parow Centre Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  (SELECT id FROM shopping_centers WHERE slug = 'parow-centre-parow'),
  'F1-F9, Corner De La Rey & Voortrekker Road, Parow Centre, Parow, Cape Town, 7501', '021 541 0160', NULL, NULL,
  'Dis-Chem Parow Centre Pharmacy is a pharmacy and health-and-beauty store, part of the national Dis-Chem chain, in Parow Centre, Parow.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/dis-chem-parow-centre-pharmacy-23758464.html", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=412178"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-parow-centre-parow'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'salon-jean-paul-parow', 'Salon Jean Paul',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  '192 Voortrekker Road, Parow East, Cape Town, 7500', '021 939 6969', NULL, NULL,
  'Salon Jean Paul is a hairdressing and beauty salon on Voortrekker Road in Parow East.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/salon-jean-paul-parow-east-parow", "https://www.yellosa.co.za/company/227786/salon-jean-paul-parow"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'salon-jean-paul-parow'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'parow-family-pharmacy-parow', 'Parow Family Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  'Cnr Jan van Riebeeck & Voortrekker Road, Parow, Cape Town, 7500', '021 939 9000', 'https://www.parowpharmacy.co.za', NULL,
  'Parow Family Pharmacy is an independent pharmacy on the corner of Jan van Riebeeck and Voortrekker Roads in Parow, next to the Pick n Pay store.',
  NULL, NULL,
  '["https://www.parowpharmacy.co.za/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=184497"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'parow-family-pharmacy-parow'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
