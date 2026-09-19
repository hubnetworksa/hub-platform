INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'akiya-sushi-century-city', 'Akiya Sushi',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  'Shop No.5, Axis Building, 9 Bridgeway, Century City, Cape Town, 7441', '021 110 5747', NULL, NULL,
  'Akiya Sushi is a Japanese sushi restaurant in the Bridgeways Precinct of Century City.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g4464136-d17417604-Reviews-Akiya_Sushi-Century_City_Western_Cape.html", "https://www.akiyasushi.co.za/new-shop"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'akiya-sushi-century-city'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'punjab-wok-century-city', 'Punjab Wok',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  'Shop C, Apex Building, 8 Kinetic Way, Bridgeway Precinct, Century City, Cape Town, 7441', '021 110 5190', NULL, NULL,
  'Punjab Wok is an Indian and Asian-fusion restaurant in the Bridgeways Precinct of Century City.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g4464136-d10496650-Reviews-Punjab_Wok-Century_City_Western_Cape.html", "https://www.facebook.com/PunjabWok/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'punjab-wok-century-city'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'panarottis-century-city', 'Panarottis Century City',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  (SELECT id FROM shopping_centers WHERE slug = 'canal-walk-century-city'),
  'Shop 487, Canal Walk Shopping Centre, Century Boulevard, Century City, Cape Town, 7441', '021 555 1724', NULL, NULL,
  'Panarottis Century City is a pizza and pasta restaurant inside Canal Walk Shopping Centre.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/panarottis-century-city/", "https://www.yep.co.za/biz/store/panarottis-pizza-pasta/630923"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'panarottis-century-city'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'colcacchio-canal-walk-century-city', 'Col''Cacchio Canal Walk',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  (SELECT id FROM shopping_centers WHERE slug = 'canal-walk-century-city'),
  'Shop 167, Canal Walk Shopping Centre, Century City, Cape Town, 7441', '021 551 1658', NULL, NULL,
  'Col''Cacchio Canal Walk is a halaal-certified pizzeria inside Canal Walk Shopping Centre.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/colcacchio-canal-walk/", "https://www.colcacchio.co.za/restaurants"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'colcacchio-canal-walk-century-city'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'cape-town-fish-market-century-city', 'Cape Town Fish Market',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  (SELECT id FROM shopping_centers WHERE slug = 'canal-walk-century-city'),
  'Shop 485, Canal Walk Shopping Centre, Century Boulevard, Century City, Cape Town, 7441', '021 555 1950', NULL, NULL,
  'Cape Town Fish Market is a seafood restaurant and sushi bar inside Canal Walk Shopping Centre.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d3371780-Reviews-Cape_Town_Fish_Market-Cape_Town_Central_Western_Cape.html", "https://canalwalk.co.za/shop/cape-town-fish-market"]',
  'published', 'agent_research', 'Mon-Sun 11:00-23:00'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-town-fish-market-century-city'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
