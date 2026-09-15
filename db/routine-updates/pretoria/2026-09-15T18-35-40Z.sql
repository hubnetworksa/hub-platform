-- Equestria: new shopping centre "Lynnwood Lane Retail Centre" + its verified tenants
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'lynnwood-lane-retail-centre-equestria', 'Lynnwood Lane Retail Centre',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  '285 The Highway St, Equestria, Pretoria, 0184', NULL, NULL,
  '["https://www.lynnwoodlane.co.za/", "https://pretoria.co.za/place/lynnwood-lane-retail-centre", "https://www.waze.com/live-map/directions/lynnwood-lane-retail-centre-the-highway-st-285-equestria,-pretoria"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'food-lovers-market-lynnwood-lane-equestria', 'Food Lover''s Market Lynnwood Lane',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-lane-retail-centre-equestria'),
  'Lynnwood Lane Retail Centre, The Hwy St, Equestria, Pretoria, 0184', '012 111 1999', NULL, NULL,
  'Food Lover''s Market Lynnwood Lane is a fresh produce and grocery supermarket, in Lynnwood Lane Retail Centre, Equestria.',
  NULL, NULL,
  '["https://foodloversmarket.co.za/stores/gauteng/food-lovers-market-lynnwood-lane/", "https://www.africabizinfo.com/ZA/food-lovers-market-lynnwood-lane-012-111-1999"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'food-lovers-market-lynnwood-lane-equestria'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vaperite-lynnwood-lane-equestria', 'Vaperite Lynnwood Lane',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-lane-retail-centre-equestria'),
  'Shop 105, Lynnwood Lane Retail Centre, Cnr Lynnwood Lane & Equestria Road, Equestria, Pretoria, 0184', '010 023 2414', NULL, NULL,
  'Vaperite Lynnwood Lane is a vape and e-cigarette retail store, in Lynnwood Lane Retail Centre, Equestria.',
  NULL, NULL,
  '["https://vaperite.co.za/stores/vaperite-lynnwood-lane-retail-centre-pretoria/", "https://www.mrd.com/delivery/store/vaperite-lynnwood-lane-over-18-only-equestria/31790"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vaperite-lynnwood-lane-equestria'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-pharmacy-lynnwood-lane-equestria', 'Dis-Chem Pharmacy Lynnwood Lane',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-lane-retail-centre-equestria'),
  'Shop S101, Lynnwood Lane Retail Centre, Cnr Lynnwood & Equestria Road, Equestria Ext 206, Pretoria, 0184', '012 574 0054', NULL, NULL,
  'Dis-Chem Pharmacy Lynnwood Lane is a pharmacy and health/beauty retailer, in Lynnwood Lane Retail Centre, Equestria.',
  NULL, NULL,
  '["https://www.dischem.co.za/lynnwood-lane-pretoria-east", "https://www.cylex.net.za/company/dis-chem-pharmacy-lynnwood-lane-23698483.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-pharmacy-lynnwood-lane-equestria'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'petzone-lynnwood-lane-equestria', 'Petzone Lynnwood Lane',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-lane-retail-centre-equestria'),
  'Lynnwood Lane Retail Centre, Cnr Lynnwood & Highway Rd, Equestria, Pretoria, 0184', '010 055 0016', NULL, NULL,
  'Petzone Lynnwood Lane is a pet supplies and accessories store, in Lynnwood Lane Retail Centre, Equestria.',
  NULL, NULL,
  '["https://www.petzone.co.za/stores/petzone-equestria-lynnwood-lane/", "https://www.blog.petzone.co.za/stores/petzone-equestria-lynnwood-lane/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'petzone-lynnwood-lane-equestria'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'car-care-workshop-lynnwood-lane-equestria', 'Car Care Workshop Lynnwood Lane',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-lane-retail-centre-equestria'),
  'Shop 007, Lynnwood Lane Retail Centre, Equestria, Pretoria', '079 743 2689', NULL, NULL,
  'Car Care Workshop Lynnwood Lane is a vehicle repair and maintenance workshop, in Lynnwood Lane Retail Centre, Equestria.',
  NULL, NULL,
  '["https://www.carcareworkshop.co.za/", "https://www.facebook.com/CarCareWorkshopLynnwoodLane/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'car-care-workshop-lynnwood-lane-equestria'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'big-joes-real-pies-lynnwood-lane-equestria', 'Big Joe''s Real Pies Lynnwood Lane',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-lane-retail-centre-equestria'),
  'Lynnwood Lane Retail Centre, Cnr Lynnwood & Equestria Rd, Equestria, Pretoria', '010 822 7390', NULL, NULL,
  'Big Joe''s Real Pies Lynnwood Lane is a handmade pie bakery and takeaway, in Lynnwood Lane Retail Centre, Equestria.',
  NULL, NULL,
  '["https://www.facebook.com/BigJoesPiesLynnwoodLane/", "https://www.mrdfood.com/food-delivery/restaurant/big-joes-lynwood-lane-equestria/17366"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'big-joes-real-pies-lynnwood-lane-equestria'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nandos-lynnwood-lane-equestria', 'Nando''s Lynnwood Lane',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-lane-retail-centre-equestria'),
  'Shop 111, Lynnwood Lane Retail Centre, Lynnwood Rd, Equestria, Pretoria, 0184', '012 574 0399', NULL, NULL,
  'Nando''s Lynnwood Lane is a flame-grilled peri-peri chicken restaurant, in Lynnwood Lane Retail Centre, Equestria.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/nandos-lynnwood-lane/", "https://southafricafirm.com/gauteng/nandos-lynnwood-lane-49307"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nandos-lynnwood-lane-equestria'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'andiccio24-lynnwood-lane-equestria', 'Andiccio24 Lynnwood Lane',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-lane-retail-centre-equestria'),
  'Lynnwood Lane Retail Centre, Equestria, Pretoria, 0184', '012 816 5080', NULL, NULL,
  'Andiccio24 Lynnwood Lane is a pizza and coffee restaurant, in Lynnwood Lane Retail Centre, Equestria.',
  NULL, NULL,
  '["https://andiccio24.co.za/contact/lynnwood-lane/", "https://restaurantguru.com/Andiccio24-Lynnwood-Pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'andiccio24-lynnwood-lane-equestria'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'west-pack-express-lynnwood-lane-equestria', 'West Pack Express Lynnwood Lane',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-lane-retail-centre-equestria'),
  'Lynnwood Lane Retail Centre, The Hwy St, Equestria, Pretoria, 0184', '010 040 7807', NULL, NULL,
  'West Pack Express Lynnwood Lane is a storage, packaging and party supplies retailer, in Lynnwood Lane Retail Centre, Equestria.',
  NULL, NULL,
  '["https://southafricafirm.com/gauteng/west-pack-express-lynnwood-lane-33906", "https://za.africabz.com/gauteng/west-pack-express-lynnwood-lane-249988"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'west-pack-express-lynnwood-lane-equestria'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'healthworx-medical-dental-centre-lynnwood-equestria', 'HEALth-WorX Medical & Dental Centre Lynnwood',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-lane-retail-centre-equestria'),
  'Shop S201, Lynnwood Lane Retail Centre, Cnr Lynnwood Dr & Equestria Rd, Equestria, Pretoria, 0184', '012 010 3650', NULL, NULL,
  'HEALth-WorX Medical & Dental Centre Lynnwood is a general practice and dental clinic, in Lynnwood Lane Retail Centre, Equestria.',
  NULL, NULL,
  '["https://health-worx.co.za/lynnwood/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=412071"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'healthworx-medical-dental-centre-lynnwood-equestria'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lynx-real-estate-lynnwood-lane-equestria', 'Lynx Real Estate',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-lane-retail-centre-equestria'),
  'Office 204, 1st Floor, Lynnwood Lane Retail Centre, 285 The Hwy Str, Equestria, Pretoria, 0184', '012 807 2113', NULL, NULL,
  'Lynx Real Estate is a property development and management company, based in Lynnwood Lane Retail Centre, Equestria.',
  NULL, NULL,
  '["https://www.lynx-re.co.za/lynx-real-estate-contact", "https://www.lynx-re.co.za/buildings/lynnwood-lane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lynx-real-estate-lynnwood-lane-equestria'),
  (SELECT id FROM categories WHERE slug = 'estate-agents'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'skin-truth-sa-lynnwood-lane-equestria', 'Skin Truth SA Lynnwood Lane',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-lane-retail-centre-equestria'),
  '1st Floor, Lynnwood Lane Retail Centre, Lynnwood Rd, Equestria, Pretoria, 0184', '079 675 6927', NULL, NULL,
  'Skin Truth SA Lynnwood Lane is a skincare and medical aesthetics clinic, in Lynnwood Lane Retail Centre, Equestria.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/skin-truth-sa-skincare-medical-aesthetics-clinic-pretoria-n65Yk9", "https://myappointment.co.za/skin-truth-lynnwood"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'skin-truth-sa-lynnwood-lane-equestria'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vision-works-lynnwood-lane-equestria', 'Vision Works Lynnwood Lane',
  (SELECT id FROM suburbs WHERE slug = 'equestria'),
  (SELECT id FROM shopping_centers WHERE slug = 'lynnwood-lane-retail-centre-equestria'),
  'Lynnwood Lane Retail Centre, Cnr Lynnwood & Equestria Road, Equestria, Pretoria, 0184', '012 880 2979', NULL, NULL,
  'Vision Works Lynnwood Lane is an optometry practice offering eye tests and eyewear, in Lynnwood Lane Retail Centre, Equestria.',
  NULL, NULL,
  '["https://www.vision-works.co.za/lynnwood-lane/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=202934"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vision-works-lynnwood-lane-equestria'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);
