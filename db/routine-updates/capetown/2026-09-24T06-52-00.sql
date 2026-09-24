INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mango-ginger-observatory', 'Mango Ginger',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '27 Lower Main Road, Observatory, Cape Town', '072 987 3214', 'http://mangoginger.co.za', NULL,
  'Mango Ginger is a coffee shop and bakery on Lower Main Road in Observatory, offering wholesome, nutritious food.',
  NULL, NULL,
  '["https://www.mangoginger.co.za/contact", "https://2pos.co.za/2/6814/mango-ginger"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mango-ginger-observatory'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'a-touch-of-madness-observatory', 'A Touch of Madness',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '12 Nuttall Road, Observatory, Cape Town', '021 448 2266', NULL, NULL,
  'A Touch of Madness is a restaurant and bar in a Victorian house in the heart of Observatory.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/a-touch-of-madness/", "https://za.africabz.com/western-cape/a-touch-of-madness-restaurant-231447"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'a-touch-of-madness-observatory'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hello-sailor-observatory', 'Hello Sailor',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '86 Lower Main Road, Observatory, Cape Town', '071 233 1264', 'http://www.hellosailorbistro.co.za', 'info@hellosailorbistro.co.za',
  'Hello Sailor is a bistro on Lower Main Road in Observatory.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/hello-sailor", "https://www.safarinow.com/destinations/observatory/restaurants/hello-sailor-bistro.aspx"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hello-sailor-observatory'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ganesh-observatory', 'Ganesh',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '38 Trill Road, Observatory, Cape Town', '062 585 9854', NULL, NULL,
  'Ganesh is a restaurant and bar on Trill Road in Observatory, with a Thai street food kitchen and weekly live music events.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/cafe-ganesh-restaurant-bar/", "https://www.yep.co.za/business/10697196_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ganesh-observatory'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'two4one-kitchen-bar-observatory', 'Two4One Kitchen & Bar',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '90 Lower Main Road, Observatory, Cape Town', '067 371 1162', 'https://www.two4one.co.za', 'info@two4one.co.za',
  'Two4One Kitchen & Bar is a restaurant on Lower Main Road in Observatory serving all meals two-for-the-price-of-one, all day, every day.',
  NULL, NULL,
  '["https://www.two4one.co.za/", "https://www.capetownetc.com/things-to-do-cape-town/restaurants/satisfy-your-hunger-with-unique-cuisines-at-two4one-kitchen-bar/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'two4one-kitchen-bar-observatory'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dolce-bakery-observatory', 'Dolce Bakery',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '38 Lower Rochester Road, Observatory, Cape Town', '021 447 2532', 'http://dolcebakery.co.za', 'sales@tndolcebakery.co.za',
  'Dolce Bakery is a family-run bakery and cafe in Observatory offering baked goods, pastries, pizzas and coffee.',
  NULL, NULL,
  '["http://dolcebakery.co.za/contact-us/", "https://za.africabz.com/western-cape/dolce-bakery-19877"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dolce-bakery-observatory'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'never-new-observatory', 'Never New',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '15b Lower Main Road, Observatory, Cape Town', '079 845 6926', NULL, NULL,
  'Never New is a vintage clothing store on Lower Main Road in Observatory, specialising in retro/vintage and locally made festival wear.',
  NULL, NULL,
  '["https://www.facebook.com/nevernewstore/", "https://www.vinylworld.org/record-shop/nevernew/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'never-new-observatory'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bangbang-vintage-observatory', 'BangBang Vintage',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '65 Lower Main Road, Observatory, Cape Town', '072 264 1246', 'https://bangbangvintagestores.com', NULL,
  'BangBang Vintage is a multi-trader vintage clothing store on Lower Main Road in Observatory, featuring a dozen different traders.',
  NULL, NULL,
  '["https://bormandumazitha.co.za/bangbang-vintage-market-17862447572003950035/", "http://www.findglocal.com/ZA/Cape-Town/1508314939472283/BangBang-Vintage-Market"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bangbang-vintage-observatory'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
