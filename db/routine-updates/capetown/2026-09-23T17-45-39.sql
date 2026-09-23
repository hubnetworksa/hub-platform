INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wharfside-grill-hout-bay', 'Wharfside Grill',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  '1 Hout Bay Harbour Road, Hout Bay, Cape Town, 7806', '021 790 1100', 'https://www.marinerswharf.co.za/wharfside-grill-restaurant/', NULL,
  'Wharfside Grill is the upstairs seafood restaurant at Mariner''s Wharf in Hout Bay harbour, seating diners with views over the working harbour.',
  NULL, NULL,
  '["https://www.marinerswharf.co.za/wharfside-grill-restaurant/", "https://www.tripadvisor.com/Restaurant_Review-g469392-d2364521-Reviews-The_Wharfside_Grill-Hout_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wharfside-grill-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cheynes-hout-bay', 'Cheyne''s',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  '1 Main Road, Hout Bay, Cape Town, 7806', '021 790 3462', NULL, NULL,
  'Cheyne''s on Main Road in Hout Bay serves contemporary Asian fusion cuisine alongside cocktails and a curated wine list.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/cheynes1/", "https://www.sluurpy.co.za/hout-bay/restaurant/5030250/cheyne-s"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cheynes-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-indian-oven-hout-bay', 'The Indian Oven',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  'Shop 8, Red Sails Building, Hout Bay, Cape Town, 7806', '010 035 2201', 'https://www.indianoven.co.za/', NULL,
  'The Indian Oven is a North Indian restaurant in the Red Sails Building in Hout Bay, serving traditional tandoor and curry dishes.',
  NULL, NULL,
  '["https://www.indianoven.co.za/contact", "https://discoverhoutbay.co.za/listing/the-indian-oven/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-indian-oven-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wheelers-pharmacy-medical-depot-hout-bay', 'Wheeler''s Pharmacy & Medical Depot',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  'The Passageway, Main Road, Hout Bay, Cape Town, 7806', '021 790 3136', 'https://www.wheelerspharmacy.com/', NULL,
  'Wheeler''s Pharmacy & Medical Depot on Main Road in Hout Bay offers dispensing, a health shop and medical supplies.',
  NULL, NULL,
  '["https://www.wheelerspharmacy.com/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=88571"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wheelers-pharmacy-medical-depot-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hout-bay-dental-studio-hout-bay', 'Hout Bay Dental Studio',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  'Joslyn Place, 34 Victoria Avenue, Hout Bay, Cape Town, 7806', '021 790 2910', 'https://www.hbds.co.za/', NULL,
  'Hout Bay Dental Studio, founded in 1983, provides general and cosmetic dental care from Joslyn Place on Victoria Avenue.',
  NULL, NULL,
  '["https://www.hbds.co.za/contact", "https://www.capetownmagazine.com/hout-bay-dental-studio"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hout-bay-dental-studio-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hout-bay-family-medical-centre-hout-bay', 'Hout Bay Family Medical Centre',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  '19 Brighton Street, corner Brighton Street & Albert Road, Hout Bay, Cape Town, 7806', '021 790 3120', 'https://houtbaymedical.co.za/', NULL,
  'Hout Bay Family Medical Centre is a general practice on the corner of Brighton Street and Albert Road, offering family-oriented medical care.',
  NULL, NULL,
  '["https://houtbaymedical.co.za/contact-us/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=289623"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hout-bay-family-medical-centre-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'african-experience-noordhoek', 'African Experience',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Noordhoek Farm Village, Cnr Noordhoek Main Road & Village Lane, Noordhoek, Cape Town, 7979', '021 789 0900', NULL, NULL,
  'African Experience is a craft shop in Noordhoek Farm Village, selling hand-made contemporary African crafts.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/african-experience", "https://thefarmvillage.co.za/shops-and-services/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'african-experience-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ndoro-noordhoek', 'Ndoro',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Noordhoek Farm Village, Cnr Noordhoek Main Road & Village Lane, Noordhoek, Cape Town, 7979', '021 789 0900', NULL, NULL,
  'Ndoro is a craft shop in Noordhoek Farm Village, selling arts and crafts from Zimbabwe and elsewhere in Africa.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/ndoro", "https://thefarmvillage.co.za/shops-and-services/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ndoro-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'compass-bakery-kommetjie', 'Compass Bakery',
  (SELECT id FROM suburbs WHERE slug = 'kommetjie'),
  'Heron Park, Kommetjie Road, Kommetjie, Cape Town, 7975', '021 783 4102', 'http://www.compassbakery.co.za', NULL,
  'Compass Bakery on Kommetjie Road bakes bread, pastries and cakes for the Kommetjie community from its Heron Park premises.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/compass-bakery-kommetjie", "https://www.yellosa.co.za/company/503131/compass-bakery-pty-ltd"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'compass-bakery-kommetjie'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);
