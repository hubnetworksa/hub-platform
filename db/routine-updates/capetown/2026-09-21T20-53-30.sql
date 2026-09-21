INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-fat-cactus-cafe-mowbray', 'The Fat Cactus Cafe',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '47 Durban Road, Mowbray, Cape Town, 7700', '021 685 1920', 'https://fatcactus.co.za', NULL,
  'The Fat Cactus Cafe is a Mexican restaurant on Durban Road in Mowbray.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/The-Fat-Cactus-Mowbray/1011", "https://za.africabz.com/western-cape/the-fat-cactus-mowbray-3736"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-fat-cactus-cafe-mowbray'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bruegels-pizza-studio-mowbray', 'Bruegels Pizza Studio',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '99 Durban Road, Little Mowbray, Cape Town, 7700', '021 685 6046', NULL, NULL,
  'Bruegels Pizza Studio is a wood-fired pizzeria on Durban Road in Little Mowbray.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/Bruegels-Pizza-Studio/5815", "https://southafricafirm.com/western-cape/bruegels-65163"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bruegels-pizza-studio-mowbray'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'b74-mowbray', 'B74',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '74 Durban Road, Mowbray, Cape Town, 7700', '073 365 8422', 'https://www.b74ct.com', NULL,
  'B74 is a bar and bistro on Durban Road in Mowbray.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g2427580-d23930776-Reviews-Bistro_74-Mowbray_Western_Cape.html", "https://www.b74ct.com/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'b74-mowbray'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'monks-chinese-mowbray', 'Monks Chinese',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '79 Durban Road, Corner Raapenberg Road, Mowbray, Cape Town, 7700', '021 200 5773', 'https://www.monkschinese.co.za', NULL,
  'Monks Chinese is a Chinese takeaway restaurant on Durban Road in Mowbray.',
  NULL, NULL,
  '["https://readymap.co.za/308/3956", "https://za.africabz.com/western-cape/monks-chinese-28593"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'monks-chinese-mowbray'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'aiyara-thai-restaurant-mowbray', 'Aiyara Thai Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '65 Durban Road, Mowbray, Cape Town, 7700', '021 689 6156', 'https://aiyarathairestaurant.co.za', NULL,
  'Aiyara Thai Restaurant is a Thai restaurant on Durban Road in Mowbray.',
  NULL, NULL,
  '["https://aiyarathairestaurant.co.za/contact-and-bookings/", "https://www.dining-out.co.za/restaurant-index.aspx?MemberID=11684&SiteVersion=desktop"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'aiyara-thai-restaurant-mowbray'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'huang-mei-sushi-chinese-food-mowbray', 'Huang Mei Sushi & Chinese Food',
  (SELECT id FROM suburbs WHERE slug = 'mowbray'),
  '4 Caledonian Road, Mowbray, Cape Town, 7700', '021 685 3985', 'https://www.huangmei.co.za', NULL,
  'Huang Mei Sushi & Chinese Food is a sushi and Chinese restaurant on Caledonian Road in Mowbray.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/huang-mei-sushi-chinese-food-177268", "https://www.africabizinfo.com/ZA/huang-mei-sushi-chinese-food-021-685-3985"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'huang-mei-sushi-chinese-food-mowbray'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
