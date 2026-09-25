INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sonstraal-superspar-kenridge', 'Sonstraal Superspar',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'ipic-shopping-centre-kenridge-kenridge'),
  'Shop 8, IPIC Shopping Centre, Doordekraal Road, Kenridge, Durbanville, Cape Town, 7550', '021 975 0602', NULL, NULL,
  'Sonstraal Superspar is a Spar supermarket in IPIC Shopping Centre, Kenridge, Durbanville.',
  NULL, NULL,
  '["https://www.sayellow.com/superspar-sonstraal-durbanville", "https://za.africabz.com/western-cape/sonstraal-spar-tops-liquor-4830"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sonstraal-superspar-kenridge'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'snuffel-and-snuif-kenridge', 'Snuffel & Snuif',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'ipic-shopping-centre-kenridge-kenridge'),
  'Shop 04A, IPIC Shopping Centre, Doordekraal Road, Kenridge, Durbanville, Cape Town, 7550', '021 914 1202', NULL, NULL,
  'Snuffel & Snuif is a home-industry bakery in IPIC Shopping Centre, Kenridge, Durbanville, selling home-baked biscuits, cakes and other sweet treats.',
  NULL, NULL,
  '["https://brabys.com/za/western-cape/durbanville/kenridge/bakers-confectioners/snuffel-snuif", "https://www.africanadvice.com/1340728/Bakery_Pastry_Shops/Western_Cape/Snuffel_And_Snuif/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'snuffel-and-snuif-kenridge'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);
