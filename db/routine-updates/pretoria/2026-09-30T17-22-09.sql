INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'sunnypark-shopping-centre-sunnyside', 'Sunnypark Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'sunnyside'),
  'Robert Sobukwe Street, Sunnyside, Pretoria', NULL, NULL,
  '["https://sunnyparkcentre.co.za/", "https://clicks.co.za/store/Sunnyside/305"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'edge-fitness-sunnyside', 'Edge Fitness',
  (SELECT id FROM suburbs WHERE slug = 'sunnyside'),
  (SELECT id FROM shopping_centers WHERE slug = 'sunnypark-shopping-centre-sunnyside'),
  'Level 3-15, Sunnypark Shopping Centre, Robert Sobukwe Street, Sunnyside, Pretoria', '012 055 7008', 'https://edgefitness.co.za', NULL,
  'Edge Fitness operates a gym on Level 3 of Sunnypark Shopping Centre on Robert Sobukwe Street in Sunnyside, offering a training space for members of all fitness levels. Open Mon-Thu 05:00-20:30, Fri 05:00-19:30, Sat 07:00-16:00, Sun 08:00-13:00.',
  NULL, NULL,
  '["https://sunnyparkcentre.co.za/shops/edge-fitness/", "https://edgefitness.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'edge-fitness-sunnyside'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-sunnyside-sunnyside', 'Clicks Sunnyside',
  (SELECT id FROM suburbs WHERE slug = 'sunnyside'),
  (SELECT id FROM shopping_centers WHERE slug = 'sunnypark-shopping-centre-sunnyside'),
  'Sunnypark Shopping Centre, Greef St, Trevenna, Pretoria, 0002', '012 440 2389', 'https://clicks.co.za', NULL,
  'Clicks Sunnyside is a health, beauty and pharmacy branch, store number 305, inside Sunnypark Shopping Centre in Sunnyside, Pretoria, offering a dispensary alongside personal-care and everyday retail. Open Mon-Fri 09:00-18:00, Sat 09:00-17:00, Sun 09:00-14:00.',
  NULL, NULL,
  '["https://clicks.co.za/store/Sunnyside/305", "https://sunnyparkcentre.co.za/shops/clicks/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-sunnyside-sunnyside'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'interchange-sunnyside', 'Interchange',
  (SELECT id FROM suburbs WHERE slug = 'sunnyside'),
  (SELECT id FROM shopping_centers WHERE slug = 'sunnypark-shopping-centre-sunnyside'),
  'Shop L4-21, Sunnypark Shopping Centre, Cnr Steve Biko & Robert Sobukwe Street, Sunnyside, Pretoria', '012 341 8349', 'https://interchangefx.com', 'info.rsa@interchangefx.com',
  'Interchange runs a bureau de change branch inside Sunnypark Shopping Centre in Sunnyside, Pretoria, offering currency exchange and MoneyGram and Western Union money transfers. Open Mon-Fri 09:00-17:00, Sat 09:00-14:00, closed Sundays.',
  NULL, NULL,
  '["https://interchangefx.com/za/branches/sunnypark", "https://sunnyparkcentre.co.za/shops/interchange/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'interchange-sunnyside'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);
