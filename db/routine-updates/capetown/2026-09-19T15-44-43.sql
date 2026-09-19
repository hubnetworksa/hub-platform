INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'bothasig-square-bothasig', 'Bothasig Square',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  'Corner Vryburger Avenue & Tafelberg Street, Bothasig, Cape Town, 7441', NULL, NULL,
  '["https://propertywheel.co.za/2021/12/bothasig-mall-to-undergo-significant-refurbishment/", "https://www.facebook.com/bothasigsquare.sa/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fancy-franks-bothasig', 'Fancy Frank''s',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Shop 43, Bothasig Square, Cnr Vryburger Avenue & Tafelberg Street, Bothasig, Cape Town, 7441', '021 109 8085', NULL, NULL,
  'Fancy Frank''s is a steakhouse and bar in Bothasig Square, Bothasig.',
  NULL, NULL,
  '["https://fancyfranks.co.za/contact/", "https://www.sluurpy.co.za/bothasig/restaurant/10507950/fancy-frank-s-bothasig"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fancy-franks-bothasig'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wimpy-bothasig', 'Wimpy',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Shop 9, Bothasig Square, Cnr Vryburger Avenue & Tafelberg Street, Bothasig, Cape Town, 7406', '021 558 6342', NULL, NULL,
  'Wimpy is a family restaurant and burger chain outlet in Bothasig Square, Bothasig.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/wimpy-cnr-vryburger-tafelburg-street/43096", "https://locations.wimpy.co.za/restaurants-BothasigSquare-WimpyBothasigMall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wimpy-bothasig'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'utah-spur-bothasig', 'Utah Spur',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Shop 46-48, Bothasig Square, Cnr Vryburger Avenue & Tafelberg Street, Bothasig, Cape Town, 7441', '021 551 5940', NULL, NULL,
  'Utah Spur is a Spur Steak Ranches family restaurant in Bothasig Square, Bothasig.',
  NULL, NULL,
  '["https://www.crave.co.za/establishment.asp?est=18272", "https://www.tripadvisor.com/Restaurant_Review-g1722390-d6698490-Reviews-Utah_Spur_Steak_Ranch-Cape_Town_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'utah-spur-bothasig'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'johnny-foxs-pub-restaurant-bothasig', 'Johnny Fox''s Pub & Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Shop 21, Bothasig Square, Tafelberg Street, Bothasig, Cape Town, 7406', '021 558 0686', NULL, NULL,
  'Johnny Fox''s Pub & Restaurant is a pub and restaurant in Bothasig Square, Bothasig.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/16977514_2", "https://www.dining-out.co.za/md/Johnny-Foxs-Pub-Restaurant/7425"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'johnny-foxs-pub-restaurant-bothasig'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-bothasig', 'KFC',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Bothasig Square, Vryburger Avenue, Bothasig, Cape Town, 7441', '021 559 3052', NULL, NULL,
  'KFC is a fried chicken fast-food restaurant in Bothasig Square, Bothasig.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/kfc-bothasig-23708310.html", "https://www.tripadvisor.co.za/Restaurant_Review-g15292734-d24168646-Reviews-KFC_Bothasig-Bothasig_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-bothasig'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'specsavers-bothasig', 'Specsavers',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Shop 7, Bothasig Square, Cnr Vryburger Avenue & Tafelberg Street, Bothasig, Cape Town', '021 476 0201', NULL, NULL,
  'Specsavers Bothasig is an optometrist and eyewear store in Bothasig Square, Bothasig.',
  NULL, NULL,
  '["https://www.specsavers.co.za/store/bothasig", "https://www.mediwallet.co.za/medicalfinance/specsavers-bothasig-3275"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'specsavers-bothasig'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'food-lovers-market-bothasig', 'Food Lover''s Market',
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  '1 Link Road, Bothasig, Cape Town', '021 203 0303', NULL, NULL,
  'Food Lover''s Market Bothasig is a large fresh-produce and grocery supermarket on Link Road, Bothasig.',
  NULL, NULL,
  '["https://foodloversmarket.co.za/stores/western-cape/food-lovers-market-bothasig/", "https://www.tiendeo.co.za/stores/cape-town/food-lover-s-market-link-rd-bothasig/75533"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'food-lovers-market-bothasig'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
