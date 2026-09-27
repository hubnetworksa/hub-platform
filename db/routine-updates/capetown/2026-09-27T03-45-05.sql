-- Jobs 1-2: green-point suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'just-skin-aesthetic-clinic-green-point', 'Just Skin Aesthetic Clinic',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '1st Floor, Cnr Main Road and Upper Portswood Road, Green Point, Cape Town, 8005', '071 679 5242', NULL, NULL,
  'Just Skin Aesthetic Clinic is a skin and aesthetics clinic in Green Point specialising in skin rejuvenation and aesthetic treatments.',
  NULL, NULL,
  '["https://justskin.co.za/contact-us/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=264652"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'just-skin-aesthetic-clinic-green-point'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sapphire-spa-green-point', 'Sapphire Spa',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  'Romney Park, Corner Hill Road and Romney Road, Green Point, Cape Town, 8005', '+27 21 439 4555', NULL, NULL,
  'Sapphire Spa is a spa at Romney Park in Green Point offering anti-ageing and restorative spa treatments.',
  NULL, NULL,
  '["https://www.romneypark.co.za/contact", "https://www.myguidecapetown.com/wellness/romney-park-spa"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sapphire-spa-green-point'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hudsons-the-burger-joint-green-point', 'Hudsons - The Burger Joint',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '43 Somerset Road, Corner Portswood and Somerset Road, Green Point, Cape Town, 8001', '+27 21 433 1496', NULL, NULL,
  'Hudsons - The Burger Joint is a gourmet burger restaurant on Somerset Road in Green Point, also serving wood-fired pizzas and craft drinks.',
  NULL, NULL,
  '["https://www.theburgerjoint.co.za/our-stores", "https://www.dining-out.co.za/md/Hudsons-The-Burger-Joint-Green-Point/3357"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hudsons-the-burger-joint-green-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'maggies-cafe-green-point', 'Maggie''s Cafe',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '49 Main Road, Green Point, Cape Town, 8005', '+27 21 433 1442', NULL, NULL,
  'Maggie''s Cafe is a dog-friendly restaurant and bar on Main Road in Green Point serving cafe-style food.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/maggies-cafe", "https://www.eatout.co.za/article/first-taste-maggies-cafe-green-point/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'maggies-cafe-green-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-royale-hotel-green-point', 'Cape Royale Hotel',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '47 Main Road, Green Point, Cape Town, 8005', '+27 21 430 0500', NULL, NULL,
  'Cape Royale Hotel is a luxury hotel and residence on Main Road in Green Point, a short walk from the V&A Waterfront and Green Point Stadium.',
  NULL, NULL,
  '["https://www.caperoyale.co.za/", "https://www.travelweekly.com/Hotels/Green-Point-South-Africa/Cape-Royale-Luxury-Hotel-p9224806"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-royale-hotel-green-point'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shift-espresso-bar-green-point', 'Shift Espresso Bar',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '45 Main Road, Green Point, Cape Town, 8005', '021 433 2450', NULL, NULL,
  'Shift Espresso Bar is a coffee shop on Main Road in Green Point, established in 2014.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/shift-espresso-bar", "https://www.dining-out.co.za/md-menu/Shift-Espresso-Bar-Green-Point/9225"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shift-espresso-bar-green-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
