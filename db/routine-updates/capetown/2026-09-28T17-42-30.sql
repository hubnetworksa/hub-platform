INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-h-goolam-strandfontein', 'Dr H Goolam',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  '65B Dennegeur Avenue, Strandfontein, Cape Town', '021 393 3135', NULL, NULL,
  'Dr H Goolam is a general medical practice in Strandfontein.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/2814484_2", "https://za.africabz.com/western-cape/dr-h-goolam-334482"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-h-goolam-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-rb-daya-strandfontein', 'Dr RB Daya',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  '6 Welgelegen Avenue, Strandfontein, Cape Town', '021 393 2133', NULL, NULL,
  'Dr RB Daya is a general medical practice in Strandfontein.',
  NULL, NULL,
  '["https://www.recomed.co.za/general-practitioner/cape-town/rupesh-daya/37926/46661/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=251348"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-rb-daya-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clip-culture-cpt-strandfontein', 'Clip Culture CPT',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  '5 Welgelegen Avenue, Strandfontein, Cape Town, 7798', '061 804 2152', NULL, NULL,
  'Clip Culture CPT is a barbershop in Strandfontein offering haircuts, beard trims and grooming services.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/clip-culture-cpt-welgelegen-avenue-cape-town-PVqnBb", "https://www.instagram.com/clip_culture_cpt/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clip-culture-cpt-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
