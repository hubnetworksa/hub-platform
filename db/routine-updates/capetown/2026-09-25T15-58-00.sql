INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vitacare-pharmacy-crawford', 'Vitacare Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  'Kromboom Medi-Centre, Cnr Kromboom & Sunnyside Roads, Crawford, Cape Town, 7764', '021 696 7880', NULL, NULL,
  'Vitacare Pharmacy (Kromboom) is a retail pharmacy in the Kromboom Medi-Centre at the corner of Kromboom and Sunnyside Roads in Crawford, part of the Vitacare pharmacy group.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=89334", "https://www.cybo.com/ZA-biz/vitacare-pharmacy_5Z", "https://www.yep.co.za/biz/store/iyp/3544605_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vitacare-pharmacy-crawford'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hood-road-medical-centre-crawford', 'Hood Road Medical Centre',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  '1 Hood Road, Crawford, Cape Town, 7764', '021 836 9455', 'https://hoodmed.co.za/', NULL,
  'Hood Road Medical Centre is a multi-practice medical centre on Hood Road in Crawford, offering doctor, dentist and allied-health services to the surrounding Southern Suburbs.',
  NULL, NULL,
  '["https://hoodmed.co.za/", "https://www.fresha.com/lvp/hood-road-medical-centre-hood-road-cape-town-15ZoPE"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hood-road-medical-centre-crawford'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
