-- Jobs 1-2: somerset-west (checkpoint 1 of 2 -- 10-record cap)

-- New shopping centre: Fountain Square
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'fountain-square-somerset-west', 'Fountain Square',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  '136 Main Road, Cnr Caledon St & Drama St, Somerset West, 7130', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/fountain-square---somerset-west.html", "https://za.africabz.com/western-cape/party-time-somerset-west-224518"]',
  'mall'
);

-- New shopping centre: The Sanctuary Shopping Centre
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'the-sanctuary-shopping-centre-somerset-west', 'The Sanctuary Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  'Corner De Beers Avenue & Broadway Boulevard, Somerset West, 7130', NULL, NULL,
  '["https://thesanctuary.co.za/", "https://www.bizcommunity.com/Article/196/757/152818.html"]',
  'mall'
);

-- New business: Party Time Somerset West (tenant of Fountain Square)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'party-time-somerset-west-somerset-west', 'Party Time Somerset West',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  (SELECT id FROM shopping_centers WHERE slug = 'fountain-square-somerset-west'),
  'Unit 8, Fountain Square, 136 Main Road, Cnr Caledon St & Drama St, Somerset West, 7130', '021 851 0622', NULL, NULL,
  'Party Time Somerset West is a party supply and equipment hire shop in Fountain Square, Somerset West.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/party-time-somerset-west-224518", "https://bormandumazitha.co.za/party-time-14471519603638278806/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'party-time-somerset-west-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'party-event-hire'),
  1
);

-- New business: iStore Somerset West (tenant of Somerset Mall)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'istore-somerset-west-somerset-west', 'iStore Somerset West',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  (SELECT id FROM shopping_centers WHERE slug = 'somerset-mall-somerset-west'),
  'Shop G232, 233 and 235, Somerset Mall, Somerset West, 7130', '087 057 5500', NULL, NULL,
  'iStore Somerset West is an Apple Premium Reseller inside Somerset Mall, Somerset West.',
  NULL, NULL,
  '["https://www.istore.co.za/storelocator/somerset", "https://za.africabz.com/western-cape/istore-somerset-west-38422"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'istore-somerset-west-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);

-- New business: Mr Tekkie Somerset West (standalone, Value Centre)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-tekkie-somerset-west-somerset-west', 'Mr Tekkie Somerset West',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  'Somerset West Value Centre, Intersection of N2 & R44, Somerset West, 7130', '087 898 0708', NULL, NULL,
  'Mr Tekkie Somerset West is a shoe store at the Somerset West Value Centre.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/mr-tekkie-somerset-west-285651", "https://www.mrtekkie.co.za/find-a-store/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-tekkie-somerset-west-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);

-- New business: Engel & Völkers Somerset West (standalone)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'engel-volkers-somerset-west-somerset-west', 'Engel & Völkers Somerset West',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  '171 Main Road, Somerset West, 7130', '021 840 1290', NULL, NULL,
  'Engel & Völkers Somerset West is an estate agency serving Somerset West, Strand and Gordons Bay.',
  NULL, NULL,
  '["https://www.engelvoelkers.com/za/en/shops/somerset-west", "https://property.mg.co.za/estate-agency/engel-volkers-somerset-west/35113"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'engel-volkers-somerset-west-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'estate-agents'),
  1
);

-- New business: Eagle Lighting Somerset West (standalone, Somerset Decor Centre)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eagle-lighting-somerset-west-somerset-west', 'Eagle Lighting Somerset West',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  'Somerset Decor Centre, Jigger Avenue, Somerset West', '021 852 0807', NULL, NULL,
  'Eagle Lighting Somerset West is a lighting and decor store at Somerset Decor Centre on Jigger Avenue.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/eagle-lighting-somerset-west-114702", "https://www.eaglelighting.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eagle-lighting-somerset-west-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

-- New business: CP&B Cape Plumbing & Bathroom Supplies Somerset West (standalone, Gants Plaza)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cpb-cape-plumbing-bathroom-supplies-somerset-west-somerset-west', 'CP&B Cape Plumbing & Bathroom Supplies Somerset West',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  '44 Clarendon Road, Gants Plaza, Somerset West, 7140', '021 853 7886', NULL, NULL,
  'CP&B Cape Plumbing & Bathroom Supplies Somerset West is a plumbing and bathroom supplies retailer at Gants Plaza.',
  NULL, NULL,
  '["https://www.cpandb.co.za/store/somerset.west", "https://za.africabz.com/western-cape/cpb-cape-plumbing-bathroom-supplies-somerset-west-134191"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cpb-cape-plumbing-bathroom-supplies-somerset-west-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
