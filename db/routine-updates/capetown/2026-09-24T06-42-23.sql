INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-taproom-salt-river', 'The Taproom',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  '95 Durham Avenue, Salt River, Cape Town', '021 200 5818', NULL, 'thetaproom@devilspeakbrewing.co.za',
  'The Taproom is a pub and restaurant at Devil''s Peak Brewing Company in Salt River, showcasing the brewery''s beers.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/taproom-devils-peak-brewery/", "https://www.capetownetc.com/food-and-drink/the-taproom-at-devils-peak-brewing-company/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-taproom-salt-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-happy-uncles-salt-river', 'The Happy Uncles',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  '100 Voortrekker Road, Salt River, Cape Town', '079 929 5322', 'https://www.thehappyuncles.com', 'info@thehappyuncles.com',
  'The Happy Uncles is a Halaal fine dining restaurant on Voortrekker Road in Salt River, offering multi-course tasting menus.',
  NULL, NULL,
  '["https://www.thehappyuncles.com/", "https://www.eatout.co.za/venue/happy-uncles/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-happy-uncles-salt-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'freddie-freeloader-salt-river', 'Freddie Freeloader',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  'Unit 3, 48 Salt River Road, Salt River, Cape Town', '021 447 0467', 'http://www.freddiefreeloader.co.za', NULL,
  'Freddie Freeloader is a coffee shop on Salt River Road serving breakfast, light meals and pizzas to the Salt River/Woodstock area.',
  NULL, NULL,
  '["http://www.freddiefreeloader.co.za/", "https://restaurantguru.com/Freddie-Freeloader-Cape-Town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'freddie-freeloader-salt-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ecco-il-caffe-salt-river', 'Ecco Il Caffe',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  'Devil''s Peak Brewery, Durham Avenue, Salt River, Cape Town', '021 835 4197', 'http://www.eccoilcaffe.co.za', NULL,
  'Ecco Il Caffe is a cafe inside the Devil''s Peak Brewery complex in Salt River, specialising in artisan coffee and gourmet food.',
  NULL, NULL,
  '["https://coffeeshopblues.co.za/ecco-il-cafe-salt-river/", "https://www.eatout.co.za/venue/ecco-il-caffe/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ecco-il-caffe-salt-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'solo-factory-shop-salt-river', 'Solo Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  'Unit 14, 18 Brickfield Road, Salt River, Cape Town', '021 447 3452', NULL, NULL,
  'Solo Factory Shop is a factory outlet on Brickfield Road in Salt River, selling kids'', men''s and ladies'' clothing and footwear.',
  NULL, NULL,
  '["https://www.localpx.com/v/en/solo-factory-shop-salt-river-cape-town.html", "https://businessfindersa.com/business/solo-factory-shop/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'solo-factory-shop-salt-river'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'playtex-factory-shop-salt-river', 'Playtex Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  '6 & 7 Brickfield Park, Brickfield Road, Salt River, Cape Town', '021 447 4930', NULL, NULL,
  'Playtex Factory Shop is a factory outlet on Brickfield Road in Salt River, selling surplus lingerie and underwear from Playtex, Wonderbra and Bear.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/playtex-163220", "https://www.africanadvice.com/1298560/Underwear_Manufacturers/Cape_Town/Playtex/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'playtex-factory-shop-salt-river'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
