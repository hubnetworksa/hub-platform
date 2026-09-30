INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'die-weiveld-slaghuis-kenridge', 'Die Weiveld Slaghuis',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'ipic-shopping-centre-kenridge-kenridge'),
  'Unit K01, Ipic Shopping Centre Kenridge, Door De Kraal Avenue, Kenridge, Cape Town, 7550', '021 300 1115', NULL, NULL,
  'Die Weiveld Slaghuis is a butchery, in Ipic Shopping Centre Kenridge, Kenridge.',
  NULL, NULL,
  '["https://www.weiveldslaghuis.co.za/", "https://www.ipicgroup.com/kenridge"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'die-weiveld-slaghuis-kenridge'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-mb-groenewald-kenridge', 'Dr M.B. Groenewald',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'ipic-shopping-centre-kenridge-kenridge'),
  'Shop 5, Ipic Kenridge Shopping Centre, Door De Kraal Avenue, Kenridge, Cape Town, 7550', '021 914 1180', NULL, NULL,
  'Dr M.B. Groenewald is an orthodontic practice, in Ipic Shopping Centre Kenridge, Kenridge.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=person&personcode=30120", "http://www.netpages.co.za/Durbanville/Groenewald+Thinus+Dr-267533.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-mb-groenewald-kenridge'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rock-thai-sushi-kenridge', 'Rock Thai Sushi',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'ipic-shopping-centre-kenridge-kenridge'),
  'Shop 4, Kenridge Shopping Centre (IPIC), Door De Kraal Avenue, Kenridge, Cape Town, 7550', '061 680 0697', NULL, NULL,
  'Rock Thai Sushi is a Thai and sushi restaurant, in Ipic Shopping Centre Kenridge, Kenridge.',
  NULL, NULL,
  '["https://www.ubereats.com/za/store/rock-thai-sushi-kenridge/x2akyTBpXnCYF4GcoiKN3A", "https://www.dining-out.co.za/md/Rock-Thai-Sushi-Kenridge/10887"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rock-thai-sushi-kenridge'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
