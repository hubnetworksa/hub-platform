-- Jobs 1-2: sea-point suburb research

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'mojo-market-sea-point', 'Mojo Market',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '30 Regent Road, Sea Point, Cape Town', NULL, NULL,
  '["https://mojomarket.co.za/", "https://insideguide.co.za/cape-town/things-to-do/mojo-market/"]',
  'market'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tawa-massage-therapy-sea-point', 'Tawa Massage Therapy',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '74 Regent Road, Sea Point, Cape Town, 8005', '+27 63 553 5065', NULL, NULL,
  'Tawa Massage Therapy is a sports massage and bodywork studio in Sea Point, offering deep tissue massage, sports massage and assisted stretching.',
  NULL, NULL,
  '["https://tawamassage.com/", "https://www.thespaguide.co.za/listing/cape-town/sports-massage/tawa-massage-therapy-sports-massage/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tawa-massage-therapy-sea-point'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'body-mind-wellness-spa-sea-point', 'Body+Mind Wellness Spa',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '11 Kloof Road, Sea Point, Cape Town', '021 447 1655', NULL, NULL,
  'Body+Mind Wellness Spa is a day spa in Sea Point offering massages and spa packages for individuals and couples.',
  NULL, NULL,
  '["https://bodyplusmindwellness.co.za/", "https://www.retreatatlassouthafrica.com/listing/body-mind-wellness-spa-d86803/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'body-mind-wellness-spa-sea-point'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bodytec-sea-point-sea-point', 'BODYTEC Sea Point',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  'Piazza Da Luz, 94 Regent Road, Sea Point, Cape Town', '+27 64 848 0388', NULL, NULL,
  'BODYTEC Sea Point is an EMS (electro muscle stimulation) personal training studio at Piazza Da Luz on Regent Road, Sea Point.',
  NULL, NULL,
  '["https://bodytec.co.za/studio/bodytec-seapoint/", "https://www.symbiont360.co.za/en/ems-studios/bodytec-sea-point"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bodytec-sea-point-sea-point'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'anytime-fitness-sea-point-sea-point', 'Anytime Fitness Sea Point',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  'Marika Court, 142 Main Road, Sea Point, Cape Town', '076 284 3603', NULL, NULL,
  'Anytime Fitness Sea Point is a 24-hour gym at Marika Court on Main Road, Sea Point.',
  NULL, NULL,
  '["https://www.anytimefitness.co.za/gyms/za-0004/cape-town-western-cape-8005/", "https://www.facebook.com/people/Anytime-Fitness-Sea-Point/61579046177815/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'anytime-fitness-sea-point-sea-point'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vagabond-kitchens-sea-point', 'Vagabond Kitchens',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '21 Regent Road, Sea Point, Cape Town', '087 057 5721', NULL, NULL,
  'Vagabond Kitchens is a street food restaurant on Regent Road, Sea Point, serving dishes from a rotating line-up of food trucks and kitchens.',
  NULL, NULL,
  '["https://www.vagabondkitchens.co.za/vagabond-kitchens-sea-point/", "https://www.eatout.co.za/venue/vagabond-kitchens-sea-point/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vagabond-kitchens-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kleinskys-delicatessen-sea-point', 'Kleinsky''s Delicatessen',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '92 Regent Road, Sea Point, Cape Town', '+27 21 433 2871', NULL, NULL,
  'Kleinsky''s Delicatessen is a New York-style deli on Regent Road, Sea Point, known for its bagels and breakfast dishes.',
  NULL, NULL,
  '["https://www.kleinskys.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g15134971-d7691259-Reviews-Kleinsky_s_Delicatessen-Sea_Point_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kleinskys-delicatessen-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mussel-monger-oyster-bar-sea-point', 'The Mussel Monger & Oyster Bar',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  (SELECT id FROM shopping_centers WHERE slug = 'mojo-market-sea-point'),
  'Mojo Market, 30 Regent Road, Sea Point, Cape Town', '+27 65 833 8593', NULL, NULL,
  'The Mussel Monger & Oyster Bar is a seafood stall inside Mojo Market on Regent Road, Sea Point, specialising in mussels and oysters.',
  NULL, NULL,
  '["https://themusselmonger.co.za/contact-us/", "https://mojomarket.co.za/vendors/the-mussel-monger"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mussel-monger-oyster-bar-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'son-of-a-butcher-and-deli-sea-point', 'Son of a Butcher & Deli',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '103 Regent Road, Sea Point, Cape Town', '021 510 1710', NULL, NULL,
  'Son of a Butcher & Deli is a boutique butchery and delicatessen on Regent Road, Sea Point, selling free-range meats and deli products.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/son-of-a-butcher-279674", "https://www.ubereats.com/za/store/son-of-a-butcher-%26-deli-sea-point/bQlKx49bQkOF0XTyRVaq6Q"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'son-of-a-butcher-and-deli-sea-point'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
