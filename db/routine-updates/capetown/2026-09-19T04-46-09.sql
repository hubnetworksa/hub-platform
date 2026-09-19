-- Jobs 1-2: new businesses discovered in Rondebosch East, Rosebank, Mowbray (this run's suburb rotation)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rondebosch-east-pharmacy-rondebosch-east', 'Rondebosch East Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch-east'),
  '88 Kromboom Road, Rondebosch East, Cape Town, 7780', '021 696 8571', NULL, 'pharmacy@willowmead.co.za',
  'Rondebosch East Pharmacy is a community retail pharmacy at Willowmead Medical Centre in Rondebosch East, supplying prescription and over-the-counter medication.',
  NULL, NULL,
  '["https://www.willowmead.co.za/pharmacy/", "https://www.yellosa.co.za/company/876975/rondebosch-east-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rondebosch-east-pharmacy-rondebosch-east'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-alma-cafe-rosebank', 'The Alma Cafe',
  (SELECT id FROM suburbs WHERE slug = 'rosebank'),
  '20 Alma Road, Rosebank, Cape Town', '021 685 7377', 'https://www.almacafe.co.za', 'bookings@almacafe.co.za',
  'The Alma Cafe is a home-style restaurant and live music venue on Alma Road in Rosebank.',
  NULL, NULL,
  '["https://www.almacafe.co.za/contact/", "https://za.africabz.com/western-cape/the-alma-cafe-64478"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-alma-cafe-rosebank'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'delightful-patience-hair-studio-mowbray', 'Delightful Patience Hair Studio',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  'Shop 50, 76 Main Road, Mowbray, Cape Town, 7700', '073 769 7303', NULL, NULL,
  'Delightful Patience Hair Studio is a hair salon on Main Road in Mowbray, next to Capitec Bank.',
  NULL, NULL,
  '["https://www.facebook.com/Delightfulpatiencehairstudio/", "https://www.fresha.com/lvp/delightful-patience-hair-studio-main-road-cape-town-6QGPeA"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'delightful-patience-hair-studio-mowbray'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'chicken-licken-mowbray-mowbray', 'Chicken Licken Mowbray',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '9 Main Road, Mowbray, Cape Town', '021 685 1985', 'https://www.chickenlicken.co.za', NULL,
  'Chicken Licken Mowbray is a branch of the South African fried chicken and fast food chain on Main Road.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/chicken-licken-mowbray-295766", "https://www.mrd.com/delivery/restaurant/chicken-licken-mowbray-mowbray/15698"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'chicken-licken-mowbray-mowbray'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
