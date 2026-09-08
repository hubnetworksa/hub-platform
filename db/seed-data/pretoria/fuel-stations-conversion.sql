INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'bp-waterkloof', 'BP Waterkloof', 8,
  NULL, -25.7741495, 28.2667414,
  'BP fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/28322926"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bp-waterkloof'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'bp-waterkloof-2', 'BP Waterkloof', 8,
  NULL, -25.7697, 28.25879,
  'BP fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/279120489"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bp-waterkloof-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'totalenergies-waterkloof', 'TotalEnergies Waterkloof', 8,
  NULL, -25.7497, 28.2312,
  'TotalEnergies fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/279822472"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'totalenergies-waterkloof'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-waterkloof', 'Engen Waterkloof', 8,
  NULL, -25.7429943, 28.2414632,
  'Engen fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/296434703"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-waterkloof'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-1303-pretorius-street', 'Engen 1303 Pretorius Street', 8,
  '1303 Pretorius Street', -25.7444085, 28.2450168,
  'Engen fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/1232270680"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-1303-pretorius-street'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'astron-energy-waterkloof', 'Astron Energy Waterkloof', 8,
  NULL, -25.7421856, 28.2465419,
  'Astron Energy fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/1232271164"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'astron-energy-waterkloof'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'astron-energy-waterkloof-2', 'Astron Energy Waterkloof', 8,
  NULL, -25.8033255, 28.2339659,
  'Astron Energy fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12193969215"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'astron-energy-waterkloof-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'astron-energy-waterkloof-3', 'Astron Energy Waterkloof', 8,
  NULL, -25.7602115, 28.2450193,
  'Astron Energy fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12193969259"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'astron-energy-waterkloof-3'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'sasol-waterkloof', 'Sasol Waterkloof', 8,
  NULL, -25.75395, 28.240696,
  'Sasol fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12196942723"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sasol-waterkloof'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'totalenergies-waterkloof-2', 'TotalEnergies Waterkloof', 8,
  NULL, -25.7951574, 28.269702,
  'TotalEnergies fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12269704140"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'totalenergies-waterkloof-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-158-bourke-street', 'Engen 158 Bourke Street', 8,
  '158 Bourke Street', -25.7586951, 28.2076011,
  'Engen fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12289683535"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-158-bourke-street'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-waterkloof-2', 'Engen Waterkloof', 8,
  NULL, -25.7592636, 28.2436905,
  'Engen fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12289683669"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-waterkloof-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-45-george-storrar-drive', 'Engen 45 George Storrar Drive', 8,
  '45 George Storrar Drive', -25.77182, 28.214824,
  'Engen fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12289683706"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-45-george-storrar-drive'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-burnett-street', 'Engen Burnett Street', 8,
  'Burnett Street', -25.74995, 28.239593,
  'Engen fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12289683766"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-burnett-street'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'bp-waterkloof-3', 'BP Waterkloof', 8,
  NULL, -25.7787576, 28.2568204,
  'BP fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12328470370"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bp-waterkloof-3'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'bp-waterkloof-4', 'BP Waterkloof', 8,
  NULL, -25.7463182, 28.2357714,
  'BP fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12328470424"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bp-waterkloof-4'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'shell-330-esselen-street', 'Shell 330 Esselen Street', 8,
  '330 Esselen Street', -25.753643, 28.208905,
  'Shell fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12343681158"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shell-330-esselen-street'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'shell-256-corner-middel-dey-streets', 'Shell 256 Corner Middel & Dey Streets', 8,
  '256 Corner Middel & Dey Streets', -25.7717434, 28.2309259,
  'Shell fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12343681164"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shell-256-corner-middel-dey-streets'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'shell-waterkloof', 'Shell Waterkloof', 8,
  NULL, -25.750468, 28.232363,
  'Shell fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12343681165"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shell-waterkloof'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'shell-waterkloof-2', 'Shell Waterkloof', 8,
  NULL, -25.761933, 28.25513,
  'Shell fuel station in Waterkloof.', '["https://www.openstreetmap.org/node/12343681168"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shell-waterkloof-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'bp-florence-ribeiro-avenue', 'BP Florence Ribeiro Avenue', 8,
  'Florence Ribeiro Avenue', -25.7712152, 28.2239954,
  'BP fuel station in Waterkloof.', '["https://www.openstreetmap.org/way/683972365"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bp-florence-ribeiro-avenue'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'shell-waterkloof-3', 'Shell Waterkloof', 8,
  NULL, -25.775795, 28.2696484,
  'Shell fuel station in Waterkloof.', '["https://www.openstreetmap.org/way/1001250282"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shell-waterkloof-3'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'sasol-pretoria-central', 'Sasol Pretoria Central', 1,
  NULL, -25.7523324, 28.1857634,
  'Sasol fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/6585727553"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sasol-pretoria-central'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'sasol-pretoria-central-2', 'Sasol Pretoria Central', 1,
  NULL, -25.713664, 28.20368,
  'Sasol fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/12196957924"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sasol-pretoria-central-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'sasol-pretoria-central-3', 'Sasol Pretoria Central', 1,
  NULL, -25.756376, 28.202349,
  'Sasol fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/12196957946"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sasol-pretoria-central-3'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'sasol-pretoria-central-4', 'Sasol Pretoria Central', 1,
  NULL, -25.752298, 28.181657,
  'Sasol fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/12196957979"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sasol-pretoria-central-4'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'sasol-pretoria-central-5', 'Sasol Pretoria Central', 1,
  NULL, -25.7500904, 28.1917187,
  'Sasol fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/12196957991"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sasol-pretoria-central-5'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-158-bourke-street-2', 'Engen 158 Bourke Street', 1,
  '158 Bourke Street', -25.7586951, 28.2076011,
  'Engen fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/12289683535"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-158-bourke-street-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-490-9th-street', 'Engen 490 9th Street', 1,
  '490 9th Street', -25.7400911, 28.1774976,
  'Engen fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/12289683626"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-490-9th-street'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-380-es-kia-mphahlele-dr', 'Engen 380 Es''kia Mphahlele Dr', 1,
  '380 Es''kia Mphahlele Dr', -25.716048, 28.169188,
  'Engen fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/12289683686"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-380-es-kia-mphahlele-dr'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-651-es-kia-mphahlele-dr', 'Engen 651 Es''kia Mphahlele Dr', 1,
  '651 Es''kia Mphahlele Dr', -25.7157343, 28.1701633,
  'Engen fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/12289683687"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-651-es-kia-mphahlele-dr'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-45-george-storrar-drive-2', 'Engen 45 George Storrar Drive', 1,
  '45 George Storrar Drive', -25.77182, 28.214824,
  'Engen fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/12289683706"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-45-george-storrar-drive-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-511-steve-biko-road', 'Engen 511 Steve Biko Road', 1,
  '511 Steve Biko Road', -25.7178559, 28.2021505,
  'Engen fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/12289683787"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-511-steve-biko-road'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-thabo-sehume-street', 'Engen Thabo Sehume Street', 1,
  'Thabo Sehume Street', -25.7597965, 28.192196,
  'Engen fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/12289683862"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-thabo-sehume-street'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'shell-330-esselen-street-2', 'Shell 330 Esselen Street', 1,
  '330 Esselen Street', -25.753643, 28.208905,
  'Shell fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/12343681158"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shell-330-esselen-street-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'astron-energy-pretoria-central', 'Astron Energy Pretoria Central', 1,
  NULL, -25.7244987, 28.1874043,
  'Astron Energy fuel station in Pretoria Central.', '["https://www.openstreetmap.org/node/13912416319"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'astron-energy-pretoria-central'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'shell-paul-kruger-street', 'Shell Paul Kruger Street', 1,
  'Paul Kruger Street', -25.7288843, 28.1893585,
  'Shell fuel station in Pretoria Central.', '["https://www.openstreetmap.org/way/410961023"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shell-paul-kruger-street'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'caltex-van-der-hoff-road', 'Caltex Van Der Hoff Road', 1,
  'Van Der Hoff Road', -25.7233893, 28.1599716,
  'Caltex fuel station in Pretoria Central.', '["https://www.openstreetmap.org/way/616665732"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'caltex-van-der-hoff-road'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'caltex-trans-oranje-road', 'Caltex Trans Oranje Road', 1,
  'Trans Oranje Road', -25.7409263, 28.1722048,
  'Caltex fuel station in Pretoria Central.', '["https://www.openstreetmap.org/way/616722510"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'caltex-trans-oranje-road'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'caltex-steve-biko-street', 'Caltex Steve Biko Street', 1,
  'Steve Biko Street', -25.7291051, 28.2044592,
  'Caltex fuel station in Pretoria Central.', '["https://www.openstreetmap.org/way/617085172"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'caltex-steve-biko-street'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'bp-564-doctor-wf-nkomo-street', 'BP 564 Doctor WF Nkomo Street', 1,
  '564 Doctor WF Nkomo Street', -25.7493335, 28.1492485,
  'BP fuel station in Pretoria Central.', '["https://www.openstreetmap.org/way/617269088"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bp-564-doctor-wf-nkomo-street'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-456-wf-nkomo-street', 'Engen 456 WF Nkomo Street', 1,
  '456 WF Nkomo Street', -25.7490026, 28.1544716,
  'Engen fuel station in Pretoria Central.', '["https://www.openstreetmap.org/way/683601062"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-456-wf-nkomo-street'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'caltex-pretoria-central', 'Caltex Pretoria Central', 1,
  NULL, -25.7462063, 28.148386,
  'Caltex fuel station in Pretoria Central.', '["https://www.openstreetmap.org/way/684544461"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'caltex-pretoria-central'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'totalenergies-soutter-street', 'TotalEnergies Soutter Street', 1,
  'Soutter Street', -25.752574, 28.162188,
  'TotalEnergies fuel station in Pretoria Central.', '["https://www.openstreetmap.org/way/1341574046"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'totalenergies-soutter-street'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-377-oberon-avenue', 'Engen 377 Oberon Avenue', 7,
  '377 Oberon Avenue', -25.7825075, 28.2903246,
  'Engen fuel station in Menlyn.', '["https://www.openstreetmap.org/node/28223330"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-377-oberon-avenue'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-430-selikats-causeway', 'Engen 430 Selikats Causeway', 7,
  '430 Selikats Causeway', -25.7841984, 28.3069886,
  'Engen fuel station in Menlyn.', '["https://www.openstreetmap.org/node/28230532"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-430-selikats-causeway'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'bp-menlyn', 'BP Menlyn', 7,
  NULL, -25.7741495, 28.2667414,
  'BP fuel station in Menlyn.', '["https://www.openstreetmap.org/node/28322926"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bp-menlyn'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'sasol-menlyn', 'Sasol Menlyn', 7,
  NULL, -25.7479793, 28.2741019,
  'Sasol fuel station in Menlyn.', '["https://www.openstreetmap.org/node/28404723"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sasol-menlyn'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'astron-energy-menlyn', 'Astron Energy Menlyn', 7,
  NULL, -25.7993719, 28.2750353,
  'Astron Energy fuel station in Menlyn.', '["https://www.openstreetmap.org/node/255885181"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'astron-energy-menlyn'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'bp-menlyn-2', 'BP Menlyn', 7,
  NULL, -25.7697, 28.25879,
  'BP fuel station in Menlyn.', '["https://www.openstreetmap.org/node/279120489"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bp-menlyn-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'astron-energy-menlyn-2', 'Astron Energy Menlyn', 7,
  NULL, -25.7893192, 28.2891667,
  'Astron Energy fuel station in Menlyn.', '["https://www.openstreetmap.org/node/290718991"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'astron-energy-menlyn-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'totalenergies-menlyn', 'TotalEnergies Menlyn', 7,
  NULL, -25.8031602, 28.2863107,
  'TotalEnergies fuel station in Menlyn.', '["https://www.openstreetmap.org/node/296232031"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'totalenergies-menlyn'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-menlyn', 'Engen Menlyn', 7,
  NULL, -25.7483097, 28.2821956,
  'Engen fuel station in Menlyn.', '["https://www.openstreetmap.org/node/915656958"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-menlyn'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-atterbury-road', 'Engen Atterbury Road', 7,
  'Atterbury Road', -25.7836024, 28.2834659,
  'Engen fuel station in Menlyn.', '["https://www.openstreetmap.org/node/5860780127"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-atterbury-road'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'astron-energy-menlyn-3', 'Astron Energy Menlyn', 7,
  NULL, -25.8143806, 28.2770928,
  'Astron Energy fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12193969158"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'astron-energy-menlyn-3'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'sasol-menlyn-2', 'Sasol Menlyn', 7,
  NULL, -25.7667746, 28.2983581,
  'Sasol fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12196957969"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'sasol-menlyn-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'totalenergies-150-garstfontein-road', 'TotalEnergies 150 Garstfontein Road', 7,
  '150 Garstfontein Road', -25.7892, 28.2759,
  'TotalEnergies fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12269704075"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'totalenergies-150-garstfontein-road'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'totalenergies-menlyn-2', 'TotalEnergies Menlyn', 7,
  NULL, -25.7951574, 28.269702,
  'TotalEnergies fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12269704140"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'totalenergies-menlyn-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-atterbury-road-2', 'Engen Atterbury Road', 7,
  'Atterbury Road', -25.782727, 28.283457,
  'Engen fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12289683545"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-atterbury-road-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-425-rigel-avenue', 'Engen 425 Rigel Avenue', 7,
  '425 Rigel Avenue', -25.808687, 28.254545,
  'Engen fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12289683744"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-425-rigel-avenue'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-406-cliffendale-drive', 'Engen 406 Cliffendale Drive', 7,
  '406 Cliffendale Drive', -25.789035, 28.314675,
  'Engen fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12289683803"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-406-cliffendale-drive'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'engen-menlyn-2', 'Engen Menlyn', 7,
  NULL, -25.81711, 28.269366,
  'Engen fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12289683817"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'engen-menlyn-2'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'bp-atterbury-road', 'BP Atterbury Road', 7,
  'Atterbury Road', -25.7888717, 28.3088584,
  'BP fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12328470267"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bp-atterbury-road'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'bp-menlyn-3', 'BP Menlyn', 7,
  NULL, -25.7787576, 28.2568204,
  'BP fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12328470370"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bp-menlyn-3'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'bp-18-camelia-avenue', 'BP 18 Camelia Avenue', 7,
  '18 Camelia Avenue', -25.7659759, 28.2883997,
  'BP fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12328470372"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bp-18-camelia-avenue'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'bp-menlyn-4', 'BP Menlyn', 7,
  NULL, -25.766664, 28.2813621,
  'BP fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12328470456"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'bp-menlyn-4'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'shell-menlyn', 'Shell Menlyn', 7,
  NULL, -25.761933, 28.25513,
  'Shell fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12343681168"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shell-menlyn'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'shell-74-glenwood-road', 'Shell 74 Glenwood Road', 7,
  '74 Glenwood Road', -25.7778302, 28.2842492,
  'Shell fuel station in Menlyn.', '["https://www.openstreetmap.org/node/12343681171"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shell-74-glenwood-road'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'astron-energy-menlyn-4', 'Astron Energy Menlyn', 7,
  NULL, -25.7828279, 28.3002394,
  'Astron Energy fuel station in Menlyn.', '["https://www.openstreetmap.org/node/13912423603"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'astron-energy-menlyn-4'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'caltex-lynburn-road', 'Caltex Lynburn Road', 7,
  'Lynburn Road', -25.7633227, 28.2803319,
  'Caltex fuel station in Menlyn.', '["https://www.openstreetmap.org/way/590753829"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'caltex-lynburn-road'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'caltex-menlyn', 'Caltex Menlyn', 7,
  NULL, -25.7633368, 28.2802609,
  'Caltex fuel station in Menlyn.', '["https://www.openstreetmap.org/way/590753830"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'caltex-menlyn'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'shell-893-rubenstein-drive', 'Shell 893 Rubenstein Drive', 7,
  '893 Rubenstein Drive', -25.8099646, 28.2973389,
  'Shell fuel station in Menlyn.', '["https://www.openstreetmap.org/way/592690888"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shell-893-rubenstein-drive'), 59, 1);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, lat, lng, description, source_urls, status, origin)
VALUES (
  'shell-menlyn-2', 'Shell Menlyn', 7,
  NULL, -25.775795, 28.2696484,
  'Shell fuel station in Menlyn.', '["https://www.openstreetmap.org/way/1001250282"]', 'published', 'seed_import'
);

INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'shell-menlyn-2'), 59, 1);

UPDATE businesses SET shopping_center_id = NULL WHERE shopping_center_id IN (SELECT id FROM shopping_centers WHERE type = 'fuel_station');

DELETE FROM shopping_centers WHERE type = 'fuel_station';
