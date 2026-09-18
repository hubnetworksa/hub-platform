INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'the-promenade-camps-bay', 'The Promenade',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  '87 Victoria Road, Camps Bay, Cape Town, 8040', NULL, NULL,
  '["http://www.promenadecampsbay.com/", "https://www.anvilproperty.co.za/commercial-property/retail/to-rent/camps-bay/the-promenade-87-victoria-road-2125"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bilboa-camps-bay', 'Bilboa',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  'Shop 120, First Floor, The Promenade, 87 Victoria Road, Camps Bay, Cape Town', '021 286 5155', NULL, 'info@bilboa.co.za',
  'Bilboa is a seafood-focused Mediterranean restaurant inside The Promenade shopping centre on Victoria Road, Camps Bay.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/bilboa/", "https://www.dining-out.co.za/md/Bilboa/9786"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bilboa-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zenzero-camps-bay', 'Zenzero',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  'Shop 2A, The Promenade, Victoria Road, Camps Bay, Cape Town, 8040', '021 438 0007', 'https://zenzerorestaurant.co.za', 'managers@zenzerorestaurant.co.za',
  'Zenzero is an Italian restaurant inside The Promenade shopping centre on Victoria Road, Camps Bay.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/zenzero/", "https://wetu.com/iBrochure/en/Information/20762/zenzero_restaurant_camps_bay/Contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zenzero-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'paranga-camps-bay', 'Paranga',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  'Shop 1, The Promenade, Victoria Road, Camps Bay, Cape Town, 8040', '021 438 0404', NULL, NULL,
  'Paranga is a beachfront restaurant inside The Promenade shopping centre on Victoria Road, Camps Bay.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312658-d1051395-Reviews-Paranga-Camps_Bay_Western_Cape.html", "https://www.dining-out.co.za/md/Paranga/2742"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'paranga-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-raj-camps-bay', 'The Raj',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  'Shop 4, The Promenade, Victoria Road, Camps Bay, Cape Town', '021 438 4555', NULL, 'capetown@theraj.co.za',
  'The Raj is an Indian restaurant inside The Promenade shopping centre on Victoria Road, Camps Bay.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/the-raj-camps-bay/", "https://www.tripadvisor.com/Restaurant_Review-g312658-d2400415-Reviews-The_Raj-Camps_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-raj-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hard-rock-cafe-cape-town-camps-bay', 'Hard Rock Cafe Cape Town',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  'Shop 105, The Promenade, 85 Victoria Road, Camps Bay, Cape Town', '021 007 4461', NULL, 'info@hrccapetown.com',
  'Hard Rock Cafe Cape Town is a branch of the global Hard Rock Cafe chain, a music-themed restaurant and bar inside The Promenade shopping centre on Victoria Road, Camps Bay.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d12865556-Reviews-Hard_Rock_Cafe_Camps_Bay-Cape_Town_Central_Western_Cape.html", "https://www.capetownetc.com/dine/rocking-hard-camps-bay/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hard-rock-cafe-cape-town-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-41-camps-bay', 'The 41',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  '41 Victoria Road, Camps Bay, Cape Town', '021 437 0558', NULL, NULL,
  'The 41 is a contemporary Mediterranean restaurant on Victoria Road in Camps Bay.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g312658-d11892943-Reviews-or45-The_41-Camps_Bay_Western_Cape.html", "https://www.eatout.co.za/venue/the-41-restaurant-and-bar/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-41-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tigers-milk-camps-bay', 'Tiger''s Milk',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  '33 Victoria Road, Camps Bay, Cape Town, 8005', '021 137 1850', 'https://tigersmilk.co.za', 'campsbay@tigersmilk.co.za',
  'Tiger''s Milk is a bar and grill restaurant chain branch on Victoria Road in Camps Bay.',
  NULL, NULL,
  '["https://www.dineplan.com/restaurants/tigers-milk-camps-bay", "https://www.tigersmilk.co.za/location/camps-bay/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tigers-milk-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kauai-camps-bay', 'Kauai',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  'Shop 2, Isaacs Corner, 55-61 Victoria Road, Camps Bay, Cape Town', '021 438 4607', 'https://www.kauai.co.za', NULL,
  'Kauai is a health-focused quick-service restaurant chain branch at Isaacs Corner on Victoria Road in Camps Bay.',
  NULL, NULL,
  '["https://www.kauai.co.za/content/camps-bay", "https://www.waze.com/live-map/directions/kauai-victoria-rd-(m6)-61-camps-bay,-cape-town?to=place.w.12060084.120469773.907198"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kauai-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
