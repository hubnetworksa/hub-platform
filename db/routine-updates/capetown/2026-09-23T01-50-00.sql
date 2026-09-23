INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blue-moon-barber-shop-crawford', 'Blue Moon Barber Shop',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  '177 Kromboom Road, Crawford, Cape Town, 7764', '021 696 8976', NULL, NULL,
  'Blue Moon Barber Shop is a barbershop offering haircuts and grooming services, in Crawford.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/blue-moon-barber-shop-kromboom-road-cape-town-30Ayx4", "https://www.beautynailhairsalons.com/ZA/Cape-Town/718055204968226/Blue-moon-barbershop"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'blue-moon-barber-shop-crawford'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vitacare-pharmacy-kromboom-crawford', 'Vitacare Pharmacy Kromboom',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  'Kromboom Medi-Centre, Cnr Kromboom & Sunnyside Road, Crawford, Cape Town, 7780', '021 696 7880', NULL, NULL,
  'Vitacare Pharmacy Kromboom is a pharmacy in the Kromboom Medi-Centre, in Crawford.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=89334", "https://www.brabys.com/business/4040733/south-africa/western-cape/cape-town/crawford/kromboom-rd/pharmacies/kromboom-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vitacare-pharmacy-kromboom-crawford'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
