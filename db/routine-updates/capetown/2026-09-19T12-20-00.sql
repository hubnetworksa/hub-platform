INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'willowbridge-shopping-centre-bellville', 'Willowbridge Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  '39 Carl Cronje Drive, Tyger Valley, Bellville, 7530', NULL, NULL,
  '["https://www.willowbridge.co.za", "https://www.sa-venues.com/things-to-do/westerncape/willowbridge-shopping-centre/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'tyger-valley-shopping-centre-bellville', 'Tyger Valley Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  'Cnr Bill Bezuidenhout Avenue & Willie van Schoor Avenue, Bellville, 7530', NULL, NULL,
  '["https://www.tygervalley.co.za/", "https://www.sa-venues.com/things-to-do/westerncape/tyger-valley-shopping-centre/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'chaos-computers-bellville', 'Chaos Computers',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  (SELECT id FROM shopping_centers WHERE slug = 'willowbridge-shopping-centre-bellville'),
  'Unit 12, Willowbridge Shopping Centre, 39 Carl Cronje Drive, Tyger Valley, Bellville, 7530', '021 914 7877', NULL, NULL,
  'Chaos Computers is a computer sales and repair business in Willowbridge Shopping Centre, Bellville.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/chaos-computer-systems-willowbridge-bellville", "https://www.brabys.com/za/western-cape/bellville/tygervalley/computer-consultants/chaos-computer-systems"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'chaos-computers-bellville'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'barnyard-theatre-willowbridge-bellville', 'Barnyard Theatre Willowbridge',
  (SELECT id FROM suburbs WHERE slug = 'bellville'),
  (SELECT id FROM shopping_centers WHERE slug = 'willowbridge-shopping-centre-bellville'),
  'Shop F09, 1st Floor, Willowbridge Shopping Centre, 39 Carl Cronje Drive, Tyger Valley, Bellville, 7530', '021 914 8898', NULL, NULL,
  'Barnyard Theatre Willowbridge is a live music and comedy dinner theatre on the 1st floor of Willowbridge Shopping Centre, Bellville.',
  NULL, NULL,
  '["https://www.barnyardtheatre.co.za/tygervalley/", "https://www.tripadvisor.co.nz/Attraction_Review-g312656-d7264238-Reviews-Barnyard_Theatre_Willowbridge-Bellville_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barnyard-theatre-willowbridge-bellville'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);
