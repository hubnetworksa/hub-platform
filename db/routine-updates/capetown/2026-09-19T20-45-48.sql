INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'beacon-sweets-and-chocolates-ndabeni', 'Beacon Sweets and Chocolates',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '5 Inyoni Street, Ndabeni, Cape Town, 7405', '021 531 7416', NULL, NULL,
  'Beacon Sweets and Chocolates is a confectionery manufacturer in Ndabeni, Cape Town.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/beacon-sweets-chocolates-pty-ltd-197123", "https://www.cylex.net.za/company/beacon-sweets-and-chocolates--pty--ltd-15454175.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'beacon-sweets-and-chocolates-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'car-smart-service-centre-ndabeni', 'Car Smart Service Centre',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  'Millside Park, Old Mill Road, Ndabeni, Cape Town, 7405', '021 531 3981', 'https://car-smart.co.za', NULL,
  'Car Smart Service Centre is an independent motor vehicle service centre in Ndabeni, Cape Town, factory approved to carry out warranty services and repairs for certain brands.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/16204768_3", "https://www.snupit.co.za/cape-town/ndabeni/car-smart-service-centre/371304"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'car-smart-service-centre-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'barrs-pharmaceutical-industries-ndabeni', 'Barrs Pharmaceutical Industries',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '10 Inyoni Street, Ndabeni, Cape Town, 7405', '021 531 6374', 'https://barrspharmaceuticals.com', NULL,
  'Barrs Pharmaceutical Industries is a pharmaceutical manufacturer based in Ndabeni, Cape Town.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/6389884_3", "https://barrspharmaceuticals.com/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barrs-pharmaceutical-industries-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sapphire-corporate-solutions-ndabeni', 'Sapphire Corporate Solutions',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '6 Inyoni Street, Ndabeni, Cape Town, 7405', '021 530 1220', 'https://sapplive.co.za', NULL,
  'Sapphire Corporate Solutions supplies corporate clothing, retail and branded merchandise to businesses, based in Ndabeni, Cape Town.',
  NULL, NULL,
  '["https://sapplive.co.za/contact/", "https://brabys.com/south-africa/cape-town/verified-business/sapphire-corporate-solutions"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sapphire-corporate-solutions-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
