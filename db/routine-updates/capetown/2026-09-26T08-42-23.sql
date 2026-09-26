INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'centre-point-shopping-centre-milnerton', 'Centre Point Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  'Corner Koeberg Road & Loxton Road, Milnerton, Cape Town, 7441', NULL, NULL,
  '["https://centrepointshoppingcentre.co.za/", "https://www.rennieproperty.co.za/buildings/centre-point---milnerton.html", "https://galetti.co.za/western-cape/milnerton-property/242/2832"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-centre-point-milnerton', 'Clicks Centre Point',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  (SELECT id FROM shopping_centers WHERE slug = 'centre-point-shopping-centre-milnerton'),
  'Shop GF11, Centre Point Shopping Centre, Koeberg Rd, Milnerton, Cape Town, 7441', '021 525 6320', NULL, NULL,
  'Clicks Centre Point is a pharmacy and health, beauty and homeware retailer inside Centre Point Shopping Centre in Milnerton, Cape Town.',
  NULL, NULL,
  '["https://clicks.co.za/store/Centre-Point/1875", "https://za.africabz.com/western-cape/clicks-pharmacy-264343", "https://centrepointshoppingcentre.co.za/shops/clicks/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-centre-point-milnerton'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-coffee-co-cafe-milnerton', 'The Coffee Co Cafe',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  '1 Heron Crescent, Milnerton, Cape Town, 7441', '021 551 9189', NULL, NULL,
  'The Coffee Co Cafe is a neighbourhood coffee shop in Milnerton, Cape Town, serving coffee, breakfast and light meals.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g312665-d15865138-Reviews-The_Coffee_Co_Cafe-Milnerton_Western_Cape.html", "https://www.thinklocal.co.za/biz/the-coffee-co-cafe-milnerton"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-coffee-co-cafe-milnerton'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ixia-street-animal-hospital-milnerton', 'Ixia Street Animal Hospital',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  '9 Ixia Street, Milnerton, Cape Town, 7441', '021 555 4040', 'https://www.ixiastreetanimalhospital.co.za/', NULL,
  'Ixia Street Animal Hospital is a veterinary hospital in Milnerton, Cape Town, providing clinical and hospital care for domestic pets.',
  NULL, NULL,
  '["https://www.pooh.co.za/listing/ixia-street-animal-hospital/", "https://za.africabz.com/western-cape/ixia-street-animal-hospital-42006", "https://ixiastreetanimalhospital.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ixia-street-animal-hospital-milnerton'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'baker-mcveigh-equine-hospital-milnerton', 'Baker & McVeigh Equine Hospital',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  'Turf Club Road, off Koeberg Road, Milnerton, Cape Town', '021 552 3450', 'https://www.bakermcveigh.com/', NULL,
  'Baker & McVeigh Equine Hospital is a specialist equine veterinary hospital in Milnerton, Cape Town, offering surgical, dental and reproductive care for horses.',
  NULL, NULL,
  '["https://www.bakermcveigh.com/cape-town-za/baker-mcveigh/equine-hospital/vet", "https://www.pooh.co.za/listing/baker-and-mcveigh-equine-hospital/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=274544"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'baker-mcveigh-equine-hospital-milnerton'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);
