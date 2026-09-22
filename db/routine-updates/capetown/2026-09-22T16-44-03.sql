INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'colosseum-hotel-century-city', 'Colosseum Hotel',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  'Corner of Century Way and Century Boulevard, Century City, Cape Town, 7441', '021 526 4000', 'https://colosseum.co.za', NULL,
  'Colosseum Hotel is a four-star hotel in Century City offering suite-style accommodation with its own Mozambik restaurant, close to Canal Walk Shopping Centre and the Century City Conference Centre.',
  NULL, NULL,
  '["https://colosseum.co.za/contact/", "https://www.capetown.travel/listing/colosseum-hotel/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'colosseum-hotel-century-city'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spaces-century-city', 'Spaces Century City',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  '1 Bridgeway Road, Bridgeways Precinct, Century City, Cape Town, 7441', '021 830 5200', NULL, NULL,
  'Spaces Century City provides serviced coworking offices, private offices and meeting rooms in the Bridgeways Precinct, with an on-site cafe and 24-hour access for members.',
  NULL, NULL,
  '["https://www.regus.com/en-gb/south-africa/cape-town/1-bridgeway-road-4411", "https://www.myspacesworks.com/centre/4411/details"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spaces-century-city'),
  (SELECT id FROM categories WHERE slug = 'commercial-property-office-space'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rossiers-pharmacy-kensington', 'Rossiers Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  'Shop 12, Kensington Shopping Centre, 27 Twelveth Avenue, Kensington, Cape Town, 7405', '021 593 8406', NULL, NULL,
  'Rossiers Pharmacy is a retail pharmacy in Kensington dispensing prescription medicine and everyday health and wellness products.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=86785", "https://www.thinklocal.co.za/biz/rossiers-pharmacy-kensington"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rossiers-pharmacy-kensington'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bkb-boards-and-hardware-kensington', 'BKB Boards & Hardware',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  'Corner 4th Avenue and 2nd Street, Kensington, Cape Town, 7405', '078 554 7411', 'https://bkbboards.com', NULL,
  'BKB Boards & Hardware supplies wood-based board products and hardware in Kensington, offering cutting, edging and drilling services on site.',
  NULL, NULL,
  '["https://bkbboards.com/contact/", "https://za.africabz.com/western-cape/bkb-boards-hardware-256167"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bkb-boards-and-hardware-kensington'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dentist-on-4th-kensington', 'Dentist on 4th',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  '18 4th Avenue, Kensington, Cape Town, 7405', '021 593 0717', NULL, NULL,
  'Dentist on 4th is a general dental practice in Kensington providing routine checkups, fillings and other dental treatment.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/dentist-on-th_1P", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=373668"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dentist-on-4th-kensington'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'beauty-zone-monte-vista', 'Beauty Zone',
  (SELECT id FROM suburbs WHERE slug = 'monte-vista'),
  '42 Plettenberg Street, Monte Vista, Cape Town, 7460', '061 998 5817', 'https://www.beautyzonenaturals.co.za', NULL,
  'Beauty Zone is a body wellness studio in Monte Vista offering slimming, weight-loss and body-contouring treatments.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/beauty-zone-body-wellness-slimming-weightloss-plettenberg-street-cape-town-581Xw7", "https://www.beautyzonenaturals.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'beauty-zone-monte-vista'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-local-monte-vista', 'Pick n Pay Local Monte Vista',
  (SELECT id FROM suburbs WHERE slug = 'monte-vista'),
  '10 Monte Vista Boulevard, Monte Vista, Cape Town, 7460', '021 558 1785', NULL, NULL,
  'Pick n Pay Local Monte Vista is a neighbourhood grocery store on Monte Vista Boulevard, part of the Pick n Pay retail chain.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/17258595_2", "https://za.africabz.com/western-cape/pick-n-pay-local-monte-vista-177889"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-local-monte-vista'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
