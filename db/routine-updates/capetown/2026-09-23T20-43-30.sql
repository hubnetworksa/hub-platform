INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lakeside-clothing-lakeside', 'Lakeside Clothing',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  '105 Main Road, Lakeside, Cape Town, 7945', '021 788 5617', NULL, NULL,
  'Lakeside Clothing is a second-hand clothing store on Main Road in Lakeside.',
  NULL, NULL,
  '["https://2pos.co.za/2/5338", "https://www.brabys.com/za/western-cape/cape-town/lakeside/clothes-second-hand/lakeside-clothing"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lakeside-clothing-lakeside'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vees-video-lakeside', 'Vee''s Video',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  (SELECT id FROM shopping_centers WHERE slug = 'lakeside-centre-lakeside'),
  'Lakeside Centre, 60 Main Road, Lakeside, Cape Town, 7945', '021 788 9097', NULL, NULL,
  'Vee''s Video is a video and games rental store in Lakeside Centre, Lakeside.',
  NULL, NULL,
  '["https://za.readymap.info/4/59708", "https://www.searchinafrica.com/business/5544968/south-africa/western-cape/cape-town/lakeside/main-rd/video-hire/vees-video"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vees-video-lakeside'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-little-fisherman-lakeside', 'The Little Fisherman',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-old-bakery-lakeside'),
  'The Old Bakery, Cnr Main Road & Lincoln Road, Lakeside, Cape Town, 7945', '021 788 3583', NULL, NULL,
  'The Little Fisherman is a fish shop selling fresh and frozen seafood from sustainable sources, in The Old Bakery, Lakeside.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g2280424-d23201179-Reviews-The_Little_Fisherman-Lakeside_Western_Cape.html", "https://www.foodbevg.com/ZA/Lakeside/124076011005854/The-Little-Fisherman"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-little-fisherman-lakeside'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'old-bakery-market-lakeside', 'Old Bakery Market',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-old-bakery-lakeside'),
  'The Old Bakery, Cnr Main Road & Lincoln Road, Lakeside, Cape Town, 7945', '078 419 6250', NULL, NULL,
  'Old Bakery Market is a coffee shop in The Old Bakery, Lakeside.',
  NULL, NULL,
  '["https://www.oldbakerymarket.com/", "https://www.facebook.com/obmarketlakeside"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'old-bakery-market-lakeside'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
