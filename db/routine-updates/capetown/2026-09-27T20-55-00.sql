INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-cobble-walk-durbanville', 'Clicks',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'cobble-walk-durbanville'),
  'Shop 55, Cobble Walk Shopping Centre, Cnr Legato Dr & Verdi Blvd, Sonstraal Heights, Durbanville, Cape Town, 7550',
  '021 979 4277', NULL, NULL,
  'Clicks is a health, beauty and pharmacy retailer in Cobble Walk Shopping Centre, Durbanville.',
  NULL, NULL,
  '["https://clicks.co.za/store/Cobble-Walk/1537", "https://www.yellowpages.net.za/amp/phone,27-219794277,Store,Durbanville,ZA31128.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-cobble-walk-durbanville'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-cobble-walk-durbanville', 'Checkers',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'cobble-walk-durbanville'),
  'Cobble Walk Shopping Centre, Corner of Verdi Boulevard & De Villiers Street, Sonstraal Heights, Durbanville, Cape Town',
  '021 970 5540', NULL, NULL,
  'Checkers is a supermarket and anchor tenant of Cobble Walk Shopping Centre, Durbanville.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/durbanville/sonstraal-heights/supermarkets/checkers-cobble-walk", "https://www.tiendeo.co.za/stores/Durbanville/checkers-cobble-walk-shopping-centre-cnr-verdi-boulevard-and-de-villiers-street-durbanville/44048"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-cobble-walk-durbanville'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zone-fitness-cobble-walk-durbanville', 'Zone Fitness',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'cobble-walk-durbanville'),
  'Cobble Walk Shopping Centre, Legato Dr, Sonstraal Heights, Durbanville, Cape Town, 7550',
  '021 975 7275', 'https://zonefitness.co.za/cobble-walk/', NULL,
  'Zone Fitness is a 24-hour gym chain branch inside Cobble Walk Shopping Centre, Durbanville.',
  NULL, NULL,
  '["https://zonefitness.co.za/cobble-walk/", "https://www.thinklocal.co.za/biz/zone-fitness-cobble-walk-durbanville"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zone-fitness-cobble-walk-durbanville'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'caltex-cobble-walk-durbanville', 'Caltex Cobble Walk',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'cobble-walk-durbanville'),
  '66 Legato Drive, Cobble Walk Shopping Centre, Sonstraal Heights, Durbanville, Cape Town',
  '021 979 2261', NULL, NULL,
  'Caltex Cobble Walk is a 24-hour fuel station at Cobble Walk Shopping Centre, Durbanville.',
  NULL, NULL,
  '["https://www.localstore.co.za/map/49740/caltex-service-station/durbanville/", "https://www.cylex.net.za/company/freshstop-at-caltex-cobblewalk-23684406.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'caltex-cobble-walk-durbanville'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-clothing-cobble-walk-durbanville', 'Pick n Pay Clothing',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'cobble-walk-durbanville'),
  'Shop 29, Cobble Walk Shopping Centre, Legato Dr, Durbanville, Cape Town, 7550',
  '021 975 9321', NULL, NULL,
  'Pick n Pay Clothing is a clothing store in Cobble Walk Shopping Centre, Durbanville.',
  NULL, NULL,
  '["https://2pos.co.za/2/13348", "https://za.africabz.com/western-cape/pick-n-pay-clothing-127888"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-clothing-cobble-walk-durbanville'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'richelles-wedding-dresses-eversdal', 'Richelles Wedding Dresses',
  (SELECT id FROM suburbs WHERE slug = 'eversdal'),
  '5 Amelia Street, Amanda Glen, Durbanville, Cape Town',
  '082 871 0470', NULL, NULL,
  'Richelles Wedding Dresses is a custom wedding dress design studio in Amanda Glen, Eversdal.',
  NULL, NULL,
  '["https://richellesweddingdresses.wordpress.com/contact-us/", "https://connecto.co.za/business/RICHELLEDRESS"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'richelles-wedding-dresses-eversdal'),
  (SELECT id FROM categories WHERE slug = 'wedding-services'),
  1
);
