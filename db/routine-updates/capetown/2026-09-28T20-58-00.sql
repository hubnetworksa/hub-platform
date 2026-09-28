-- Milnerton: 5 new businesses (incl. 2 Paddocks tenants + 1 Centre Point tenant) + 1 Killarney Gardens business found via Milnerton research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-dental-people-milnerton', 'The Dental People',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  (SELECT id FROM shopping_centers WHERE slug = 'centre-point-shopping-centre-milnerton'),
  '1 Loxton Road, Centre Point Shopping Centre, Milnerton, Cape Town, 7441', '081 673 8958', 'https://thedentalpeople.co.za', NULL,
  'The Dental People is a dental practice in Centre Point Shopping Centre, Milnerton.',
  NULL, NULL,
  '["https://thedentalpeople.co.za/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=309650"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-dental-people-milnerton'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'healthfort-clinics-milnerton', 'Healthfort Clinics',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  '9 Racecourse Road, Milnerton, Cape Town, 7441', '086 782 0888', 'https://www.healthfortclinic.com', NULL,
  'Healthfort Clinics is a multidisciplinary medical clinic in Milnerton offering GP, dental and allied health services.',
  NULL, NULL,
  '["https://www.recomed.co.za/private-practice/milnerton/healthfort-clinics-milnerton/51093/", "https://www.healthfortclinic.com/our-locations/gp-milnerton"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'healthfort-clinics-milnerton'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'inn-hair-milnerton', 'Inn-Hair',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  'Shop 4, Loxton Road, Milnerton, Cape Town, 7441', '021 552 3666', NULL, NULL,
  'Inn-Hair is a hairdresser in Milnerton.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/inn-hair-milnerton", "https://www.yep.co.za/biz/store/iyp/3509215_3", "https://www.brabys.com/za/western-cape/milnerton/salons/inn-hair"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'inn-hair-milnerton'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mugg-bean-paddocks-milnerton', 'Mugg & Bean Paddocks',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-paddocks-shopping-centre-milnerton'),
  'Shop 19-20, The Paddocks Shopping Centre, Racecourse Road, Milnerton, Cape Town, 7441', '021 552 9400', NULL, NULL,
  'Mugg & Bean Paddocks is a coffee-shop restaurant in The Paddocks Shopping Centre, Milnerton.',
  NULL, NULL,
  '["https://locations.muggandbean.co.za/restaurants-PaddocksShoppingCentre-MuggBeanPaddocks", "https://www.thinklocal.co.za/biz/mugg-n-bean-paddocks-shopping-centre-milnerton"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mugg-bean-paddocks-milnerton'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wimpy-paddocks-milnerton', 'Wimpy Paddocks',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-paddocks-shopping-centre-milnerton'),
  'Shop 13, The Paddocks Shopping Centre, Racecourse Road, Milnerton, Cape Town, 7441', '021 203 5350', 'https://location.wimpy.co.za/paddocks', NULL,
  'Wimpy Paddocks is a family restaurant in The Paddocks Shopping Centre, Milnerton.',
  NULL, NULL,
  '["https://location.wimpy.co.za/paddocks", "https://www.yellosa.co.za/company/517308/wimpythe-paddock-", "https://www.cylex.net.za/company/wimpy-23692361.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wimpy-paddocks-milnerton'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

-- Found via Milnerton research but actually located in Killarney Gardens (per spire.co.za area profile and business's own listed address) -- tagged to its correct suburb, not Milnerton
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'las-paletas-killarney-gardens', 'Las Paletas',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  'Unit 2, Ebenezer Park, 71 Killarney Avenue, Killarney Gardens, Cape Town, 7441', '071 579 4552', NULL, NULL,
  'Las Paletas is an ice cream and paletas (popsicle) maker in Killarney Gardens offering corporate and wedding catering with deliveries across Cape Town.',
  NULL, NULL,
  '["https://www.bestdirectory.co.za/las-paletas-ice-cream-ice-cream-dairy-food-and-related-products-in-milnerton-cape-town-western-cape.html", "https://2pos.co.za/2/14734"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'las-paletas-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'catering'),
  1
);
