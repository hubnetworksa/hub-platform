-- Jobs 1-2: Bonteheuwel new businesses
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kc-thebarbershop-bonteheuwel', 'KC TheBarberShop',
  (SELECT id FROM suburbs WHERE slug = 'bonteheuwel'),
  '52 Bonteheuwel Avenue, Bonteheuwel, Cape Town, 7764', '066 452 1005', NULL, NULL,
  'KC TheBarberShop is a barbershop offering haircuts and grooming services, in Bonteheuwel.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/kc-thebarbershop-pty-ltd-bonteheuwel-avenue-cape-town-Wq8bVL", "https://kcthebarbershop.setmore.com/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kc-thebarbershop-bonteheuwel'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'gentspride-barbershop-bonteheuwel', 'Gentspride Barbershop',
  (SELECT id FROM suburbs WHERE slug = 'bonteheuwel'),
  '31 Bluegum Street, Bonteheuwel, Cape Town, 7764', '061 441 8244', 'https://gentspride.co.za/', NULL,
  'Gentspride Barbershop is a barbershop offering standard and modern cuts and fades, in Bonteheuwel.',
  NULL, NULL,
  '["https://gentspride.co.za/", "https://magicpin.com/south-africa/Cape-Town/Epping-Industria/Beauty/Gentspride-Barbershop/store/23780b9"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gentspride-barbershop-bonteheuwel'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-v-h-davids-bonteheuwel', 'Dr V H Davids',
  (SELECT id FROM suburbs WHERE slug = 'bonteheuwel'),
  'Shop 6, Bonteheuwel Town Centre, Kiaat Road, Bonteheuwel, Cape Town, 7764', '021 694 6735', NULL, NULL,
  'Dr V H Davids is a dental practice in Bonteheuwel Town Centre, Bonteheuwel.',
  NULL, NULL,
  '["https://www.recomed.co.za/dentist/gatesville/vh-davids/4348/4131/", "https://www.medpages.info/sf/index.php?page=person&personcode=12986", "https://www.yep.co.za/biz/store/iyp/2850988_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-v-h-davids-bonteheuwel'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
