INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'ipic-shopping-centre-kenridge-kenridge', 'IPIC Shopping Centre Kenridge',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  'Doordekraal Road, Kenridge, Durbanville, Cape Town, 7550', NULL, NULL,
  '["https://www.ipicgroup.com/kenridge", "https://www.rennieproperty.co.za/buildings/ipic-shopping-centre-kenridge.html"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kenridge-pharmacy-kenridge', 'Kenridge Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'ipic-shopping-centre-kenridge-kenridge'),
  'Shop 13, IPIC Shopping Centre Kenridge, Doordekraal Road, Kenridge, Durbanville', '021 914 1120', NULL, NULL,
  'Kenridge Pharmacy is a pharmacy in IPIC Shopping Centre Kenridge, in Kenridge.',
  NULL, NULL,
  '["https://brabys.com/south-africa/durbanville/verified-business/kenridge-pharmacy", "https://za.africabz.com/western-cape/kenridge-pharmacy-153934"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kenridge-pharmacy-kenridge'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'petes-pizzas-kenridge', 'Pete''s Pizzas',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'ipic-shopping-centre-kenridge-kenridge'),
  'Shop 9, IPIC Shopping Centre Kenridge, Door De Kraal Avenue, Kenridge, Durbanville', '021 914 3413', 'https://www.petespizzas.co.za', NULL,
  'Pete''s Pizzas is a wood-fired pizza and ribs takeaway in IPIC Shopping Centre Kenridge, in Kenridge.',
  NULL, NULL,
  '["https://www.petespizzas.co.za/", "https://www.thinklocal.co.za/biz/petes-pizzas-durbanville"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'petes-pizzas-kenridge'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ho-ho-takeaways-kenridge', 'Ho Ho Takeaways',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'ipic-shopping-centre-kenridge-kenridge'),
  'Shop 10, IPIC Shopping Centre Kenridge, Door De Kraal Avenue, Kenridge, Durbanville', '021 914 0985', NULL, NULL,
  'Ho Ho Takeaways is a Chinese takeaway in IPIC Shopping Centre Kenridge, in Kenridge.',
  NULL, NULL,
  '["https://www.hohotakeaways.co.za/", "https://za.africabz.com/western-cape/ho-62609"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ho-ho-takeaways-kenridge'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'absolute-pets-kenridge', 'Absolute Pets',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'ipic-shopping-centre-kenridge-kenridge'),
  'Shop 8, IPIC Shopping Centre Kenridge, Door De Kraal Avenue, Kenridge, Durbanville', '021 914 0852', NULL, NULL,
  'Absolute Pets is a pet supplies store in IPIC Shopping Centre Kenridge, in Kenridge.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/absolute-pets-kenridge-190941", "https://2pos.co.za/2/11382"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'absolute-pets-kenridge'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-local-kenridge-kenridge', 'Pick n Pay Local Kenridge',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'ipic-shopping-centre-kenridge-kenridge'),
  'IPIC Shopping Centre Kenridge, Door De Kraal Avenue, Kenridge, Durbanville, 7550', '021 914 1237', NULL, NULL,
  'Pick n Pay Local Kenridge is the anchor supermarket of IPIC Shopping Centre Kenridge, in Kenridge.',
  NULL, NULL,
  '["https://www.pukkapure.co.za/outlets/pick-n-pay-local-kenridge/", "https://www.yep.co.za/biz/store/iyp/17258594_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-local-kenridge-kenridge'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pixel-place-copy-and-print-kenridge', 'Pixel Place Copy and Print',
  (SELECT id FROM suburbs WHERE slug = 'kenridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'ipic-shopping-centre-kenridge-kenridge'),
  'Shop 7, IPIC Shopping Centre Kenridge, Door De Kraal Avenue, Kenridge, Durbanville', '021 914 4111', NULL, NULL,
  'Pixel Place Copy and Print is a printing and copying shop in IPIC Shopping Centre Kenridge, in Kenridge.',
  NULL, NULL,
  '["https://yellow.place/en/pixel-place-copy-and-print-kenridge-durbanville-southafrica", "https://www.madvix.com/ZA/Durbanville/682173568537010/Pixel-Place-Copy-and-Print---Kenridge"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pixel-place-copy-and-print-kenridge'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);
