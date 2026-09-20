-- Philippi Horticultural Area
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  '74-on-9th-philippi-horticultural', '74 on 9th',
  (SELECT id FROM suburbs WHERE slug = 'philippi-horticultural'),
  '74 9th Avenue, Schaapkraal, Philippi Horticultural Area, Cape Town, 8000', '084 072 1509', NULL, NULL,
  '74 on 9th is an events and function venue in Schaapkraal, Philippi Horticultural Area, with a swimming pool, fully halaal with no alcohol served.',
  NULL, NULL,
  '["https://www.facebook.com/74on9thavenue/", "https://opening-hours.co.za/03961768/74_on_9th_Schaapkraal"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '74-on-9th-philippi-horticultural'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

-- Portland: new shopping centre
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'quicktrip-shopping-centre-portland', 'Quicktrip Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'portland'),
  'Cnr Merrydale Avenue & Silversands Road, Portlands, Mitchells Plain, Cape Town, 7785', NULL, NULL,
  '["https://cape-town-south-africa.bizfax.co.za/quicktrip-bakery.html", "https://www.yellosa.co.za/company/560946/quick-trip-bakery"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'quicktrip-bakery-portland', 'Quicktrip Bakery',
  (SELECT id FROM suburbs WHERE slug = 'portland'),
  (SELECT id FROM shopping_centers WHERE slug = 'quicktrip-shopping-centre-portland'),
  'Shop 8, Quicktrip Shopping Centre, Merrydale Avenue, Portlands, Mitchells Plain, Cape Town, 7785', '021 371 3444', 'https://quicktripbakery.co.za/', NULL,
  'Quicktrip Bakery is a bakery and cafe inside Quicktrip Shopping Centre in Portland, Mitchells Plain.',
  NULL, NULL,
  '["https://quicktripbakery.co.za/", "https://cape-town-south-africa.bizfax.co.za/quicktrip-bakery.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'quicktrip-bakery-portland'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hair-connection-portland', 'Hair Connection',
  (SELECT id FROM suburbs WHERE slug = 'portland'),
  (SELECT id FROM shopping_centers WHERE slug = 'quicktrip-shopping-centre-portland'),
  'Shop 132, Quicktrip Centre, Portlands, Mitchells Plain, Cape Town, 7785', '021 371 6406', NULL, NULL,
  'Hair Connection is a hair salon inside Quicktrip Shopping Centre in Portland, Mitchells Plain, trading since 2010.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/mitchells-plain/portland/unisex-hairdressers/hair-connection", "https://www.hellopeter.com/hair-connection/reviews/hair-connection-quicktrip-portlands-mitchells-plain-6133307"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hair-connection-portland'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

-- Portland: general suburb businesses
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-party-shop-portland', 'The Party Shop',
  (SELECT id FROM suburbs WHERE slug = 'portland'),
  '60 Cambridge Street, Portlands, Cape Town, 7785', '073 517 2177', NULL, NULL,
  'The Party Shop is a party supplies and decor retailer in Portland, Mitchells Plain, that also bakes cakes for special occasions.',
  NULL, NULL,
  '["https://www.facebook.com/p/The-Party-Shop-Mitchells-Plain-100063703713393/", "https://www.callupcontact.com/b/businessprofile/The_Party_Shop/6673444"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-party-shop-portland'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'portlands-indoor-sport-centre-portland', 'Portlands Indoor Sport Centre',
  (SELECT id FROM suburbs WHERE slug = 'portland'),
  'Cnr Merrydale & Hazeldene Road, Portlands, Mitchells Plain, Cape Town, 7785', '021 372 2929', NULL, NULL,
  'Portlands Indoor Sport Centre is an indoor sports facility in Portland, Mitchells Plain.',
  NULL, NULL,
  '["https://d7.westerncape.gov.za/facility/portlands-indoor-sport-centre", "https://www.thinklocal.co.za/biz/portlands-indoor-sports-centre-mitchells-plain"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'portlands-indoor-sport-centre-portland'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
