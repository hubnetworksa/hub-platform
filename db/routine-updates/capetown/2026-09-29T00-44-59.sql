INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'namaste-noordhoek', 'Namaste',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Noordhoek Farm Village, Cnr Noordhoek Main Road & Village Lane, Noordhoek, Cape Town, 7979', '021 789 1396', NULL, NULL,
  'Namaste is a curio, craft and gift shop in Noordhoek Farm Village, Noordhoek.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/namaste", "https://www.facebook.com/noordhoekfarmvillage/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'namaste-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'equibox-noordhoek', 'Equibox',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Village Lane, Noordhoek Farm Village, Noordhoek, Cape Town, 7979', '021 180 3561', NULL, NULL,
  'Equibox is an equestrian retailer in Noordhoek Farm Village, Noordhoek.',
  NULL, NULL,
  '["https://pethub.co.za/listing/equibox-noordhoek", "http://www.findglocal.com/ZA/Cape-Town/194032367439841/Equibox"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'equibox-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'carolines-health-and-beauty-noordhoek', 'Caroline''s Health & Beauty',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Noordhoek Farm Village, Cnr Noordhoek Main Road & Village Lane, Noordhoek, Cape Town, 7979', '021 789 1900', NULL, NULL,
  'Caroline''s Health & Beauty is a spa and beauty salon in Noordhoek Farm Village, Noordhoek.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/carolines-health-beauty", "https://thefarmvillage.co.za/carolines-health-beauty/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'carolines-health-and-beauty-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'metro-organics-noordhoek', 'Metro Organics',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Outside The Foodbarn Deli, Noordhoek Farm Village, Cnr Noordhoek Main Road & Village Lane, Noordhoek, Cape Town, 7979', '064 627 9886', NULL, NULL,
  'Metro Organics is an organic grocery shop in Noordhoek Farm Village, Noordhoek.',
  NULL, NULL,
  '["https://nrpa.org.za/metro-organics/", "https://thefarmvillage.co.za/metro-organics/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'metro-organics-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'greeff-christies-international-real-estate-noordhoek', 'Greeff Christie''s International Real Estate',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Shop 3 The Milking Shed, Noordhoek Farm Village, Noordhoek, Cape Town, 7979', '021 753 0348', NULL, NULL,
  'Greeff Christie''s International Real Estate is an estate agency office in Noordhoek Farm Village, Noordhoek.',
  NULL, NULL,
  '["https://www.greeff.co.za/news/greeff-christies-international-real-estate-opens-brand-new-office-at-noordhoek-farm-village/", "https://thefarmvillage.co.za/greef/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'greeff-christies-international-real-estate-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'estate-agents'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'faithjuice-noordhoek', 'FaithJuice',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Village Lane, Noordhoek Farm Village, Noordhoek, Cape Town, 7979', '071 471 1226', NULL, NULL,
  'FaithJuice is a raw juice and smoothie bar in Noordhoek Farm Village, Noordhoek.',
  NULL, NULL,
  '["https://faithjuice.co.za/contact/", "https://thefarmvillage.co.za/faithjuice/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'faithjuice-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'foschini-noordhoek', 'Foschini',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Shop G19, Longbeach Mall, Cnr Buller Louw Boulevard & Sunnydale Road, Noordhoek, Cape Town, 7975', '021 784 1400', NULL, NULL,
  'Foschini is a fashion and lifestyle clothing store at Longbeach Mall, Noordhoek.',
  NULL, NULL,
  '["https://bash.com/store/foschini-longbeach-mall-western-cape-7979/000160", "https://longbeachmall.co.za/stores/foschini/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'foschini-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-noordhoek', 'Ackermans',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Shop G66, Longbeach Mall, Cnr Buller Louw Boulevard & Sunnydale Road, Noordhoek, Cape Town, 7975', '021 785 4581', NULL, NULL,
  'Ackermans is a fashion retailer for women, kids and babies at Longbeach Mall, Noordhoek.',
  NULL, NULL,
  '["https://www.ackermans.co.za/store-directory/south-africa/western-cape/noordhoek/noordhoek", "https://www.ayoba.com/business/AckermansLongbeachMall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wimpy-longbeach-mall-noordhoek', 'Wimpy Longbeach Mall',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Shop G14b, Longbeach Mall, Cnr Buller Louw Boulevard & Sunnydale Road, Noordhoek, Cape Town, 7975', '021 785 3242', NULL, NULL,
  'Wimpy Longbeach Mall is a family restaurant chain outlet at Longbeach Mall, Noordhoek.',
  NULL, NULL,
  '["https://locations.wimpy.co.za/restaurants-LongbeachMall-WimpyLongbeach", "https://longbeachmall.co.za/stores/wimpy/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wimpy-longbeach-mall-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-longbeach-mall-noordhoek', 'Clicks Longbeach Mall',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Shop G15, Longbeach Mall, Cnr Buller Louw Drive & Sunnydale Road, Milkwood Park, Noordhoek, Cape Town, 7975', '021 785 4115', NULL, NULL,
  'Clicks Longbeach Mall is a pharmacy and health, beauty and homeware retailer at Longbeach Mall, Noordhoek.',
  NULL, NULL,
  '["https://longbeachmall.co.za/stores/clicks/", "https://clicks.co.za/store/Long-Beach-Mall/148"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-longbeach-mall-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
