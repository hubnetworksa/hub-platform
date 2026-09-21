INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'westlake-shopping-centre-westlake', 'Westlake Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  'Westlake Drive, Westlake, Cape Town, 7945', NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/bysuburb/westlake/category/malls-and-shopping/", "https://www.westlakeshoppingcentre.co.za/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vo2-gear-westlake', 'VO2 Gear',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  (SELECT id FROM shopping_centers WHERE slug = 'westlake-shopping-centre-westlake'),
  'Shop 27, First Floor, Westlake Shopping Centre, Westlake Drive, Westlake, Cape Town, 7945', '087 095 7720', NULL, NULL,
  'VO2 Gear is a sports apparel and gear store in Westlake Shopping Centre, Westlake.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/wc/cape-town/vo2-gear", "https://www.westlakeshoppingcentre.co.za/stores/speciality-stores/vo2-gear"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vo2-gear-westlake'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'boa-beauty-bar-westlake', 'BOA Beauty Bar',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  (SELECT id FROM shopping_centers WHERE slug = 'westlake-shopping-centre-westlake'),
  'Ground Floor, Westlake Shopping Centre, Westlake Drive, Westlake, Cape Town, 7945', '021 330 5505', 'https://boabeautybar.co.za', NULL,
  'BOA Beauty Bar is a beauty bar in Westlake Shopping Centre, Westlake, offering nail and beauty treatments.',
  NULL, NULL,
  '["https://www.fresha.com/a/boa-beauty-bar-westlake-cape-town-westlake-lifestyle-centre-lm9c4vs9", "https://boabeautybar.co.za/pages/find-us"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'boa-beauty-bar-westlake'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'chas-everitt-cape-town-south-westlake', 'Chas Everitt Cape Town South',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  (SELECT id FROM shopping_centers WHERE slug = 'westlake-shopping-centre-westlake'),
  'Shop 33, Westlake Shopping Centre, Corner Bell Crescent & Westlake Drive, Westlake, Cape Town, 7945', '021 712 5029', 'https://capetownsouth.co.za', 'tokai@everitt.co.za',
  'Chas Everitt Cape Town South is an estate agency in Westlake Shopping Centre, Westlake.',
  NULL, NULL,
  '["https://www.chaseveritt.co.za/contact/cape-town-south/1983/", "https://www.westlakeshoppingcentre.co.za/stores/speciality-stores/chas-everitt-cape-town-south"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'chas-everitt-cape-town-south-westlake'),
  (SELECT id FROM categories WHERE slug = 'estate-agents'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'smartphone-er-westlake', 'Smartphone ER',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  (SELECT id FROM shopping_centers WHERE slug = 'westlake-shopping-centre-westlake'),
  'Shop 34D, Westlake Shopping Centre, Westlake Drive, Westlake, Cape Town, 7945', '072 588 3212', 'https://smartphoneer.co.za', 'Info@smartphoneER.co.za',
  'Smartphone ER is a mobile phone repair shop in Westlake Shopping Centre, Westlake, specialising in Samsung, iPhone and Huawei device repairs.',
  NULL, NULL,
  '["https://mybroadband.co.za/news/industrynews/590551-smartphone-er-brings-expert-repairs-to-westlake-shopping-centre.html", "https://smartphoneer.co.za/stores/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'smartphone-er-westlake'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'colcacchio-go-westlake-westlake', 'Col''Cacchio GO Westlake',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  (SELECT id FROM shopping_centers WHERE slug = 'westlake-shopping-centre-westlake'),
  'Unit F43, Westlake Shopping Centre, Westlake Drive, Westlake, Cape Town, 7945', '021 200 5247', 'https://www.colcacchio.co.za/go/westlake', 'westlakego@colcacchio.co.za',
  'Col''Cacchio GO Westlake is a walk-in pizzeria outlet of the Col''Cacchio chain in Westlake Shopping Centre, Westlake.',
  NULL, NULL,
  '["https://www.colcacchio.co.za/go/westlake", "https://www.facebook.com/ColCacchioGOWestlake/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'colcacchio-go-westlake-westlake'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cattle-baron-westlake-westlake', 'Cattle Baron Westlake',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  (SELECT id FROM shopping_centers WHERE slug = 'westlake-shopping-centre-westlake'),
  '1st Floor, Westlake Shopping Centre, Westlake Drive, Westlake, Cape Town, 7945', '060 372 0872', 'https://www.cattlebaron.co.za/cattle-baron-westlake/', 'info@cattlebaronwestlake.co.za',
  'Cattle Baron Westlake is a steakhouse restaurant on the first floor of Westlake Shopping Centre, Westlake.',
  NULL, NULL,
  '["https://www.cattlebaron.co.za/cattle-baron-westlake/", "https://www.facebook.com/CattlebaronWestlake/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cattle-baron-westlake-westlake'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'iv-bar-westlake-westlake', 'IV Bar Westlake',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  (SELECT id FROM shopping_centers WHERE slug = 'westlake-shopping-centre-westlake'),
  'Shop 34, Westlake Shopping Centre, Corner Bell Crescent & Westlake Drive, Westlake, Cape Town, 7945', '021 330 5678', 'https://theivbar.co.za', 'westlake@theivbar.co.za',
  'IV Bar Westlake is an IV vitamin therapy and wellness bar in Westlake Shopping Centre, Westlake.',
  NULL, NULL,
  '["https://theivbar.co.za/store-locator/", "https://myappointment.co.za/the-iv-bar-westlake"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'iv-bar-westlake-westlake'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'azura-health-and-beauty-westlake', 'Azura Health and Beauty',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  (SELECT id FROM shopping_centers WHERE slug = 'westlake-shopping-centre-westlake'),
  'Unit 26, Westlake Shopping Centre, Westlake Drive, Westlake, Cape Town, 7945', '082 675 9142', 'https://azurahealthandbeauty.co.za', 'azurabeautysa@gmail.com',
  'Azura Health and Beauty is a health and beauty salon in Westlake Shopping Centre, Westlake.',
  NULL, NULL,
  '["https://azurahealthandbeauty.co.za/pages/contact", "https://www.fresha.com/a/azura-health-and-beauty-cape-town-westlake-lifestyle-centre-westlake-drive-kfh2gnwn"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'azura-health-and-beauty-westlake'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-westlake', 'Clicks',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  (SELECT id FROM shopping_centers WHERE slug = 'westlake-shopping-centre-westlake'),
  'Shop 15 & 16, Westlake Shopping Centre, 1 Bell Crescent, Westlake, Cape Town, 7945', '021 460 1846', 'https://clicks.co.za', NULL,
  'Clicks is a pharmacy and health-and-beauty retailer in Westlake Shopping Centre, Westlake.',
  NULL, NULL,
  '["https://clicks.co.za/store/Westlake-Lifestyle-Centre/2186", "https://magicpin.com/south-africa/Cape-Town/Tokai/Pharmacy/Clicks-Pharmacy-Westlake-Lifestyle-Centre/store/2366099"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-westlake'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
