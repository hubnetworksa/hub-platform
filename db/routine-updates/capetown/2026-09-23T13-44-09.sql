INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'parklands-lifestyle-centre-parklands', 'Parklands Lifestyle Centre',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  'Cnr Links & Parklands Main Road, Parklands, Cape Town, 7441', NULL, NULL,
  '["https://www.guzzle.co.za/malls/754/", "https://www.anvilproperty.co.za/commercial-property/office-space/to-rent/parklands/parklands-lifestyle-centre-cape-town-1912"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rocomamas-parklands-lifestyle-centre-parklands', 'RocoMamas Parklands Lifestyle Centre',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'parklands-lifestyle-centre-parklands'),
  'Shop 1, Parklands Lifestyle Centre, Parklands Main Road, Parklands, Cape Town, 7441', '021 300 6475', NULL, NULL,
  'RocoMamas is a gourmet burger and ribs restaurant chain, with a branch in Parklands Lifestyle Centre, Parklands.',
  NULL, NULL,
  '["https://rocomamas.com/za/restaurants/western-cape/rocomamas-tableview", "https://www.abillion.com/reviews/61103a675c2f6300920ed133"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rocomamas-parklands-lifestyle-centre-parklands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-parklands-lifestyle-centre-parklands', 'PostNet Parklands Lifestyle Centre',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'parklands-lifestyle-centre-parklands'),
  'Shop 3, Parklands Lifestyle Centre, Parklands Main Rd, Parklands, Cape Town, 7441', '021 556 1457', NULL, NULL,
  'PostNet is a courier, printing and stationery services store, with a branch in Parklands Lifestyle Centre, Parklands.',
  NULL, NULL,
  '["https://homeappliancerepairs.co.za/2910089088634898216/", "https://www.africabizinfo.com/ZA/postnet-tableview-parklands-021-556-1457"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-parklands-lifestyle-centre-parklands'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'puma-factory-outlet-parklands-lifestyle-centre-parklands', 'Puma Factory Outlet Parklands Lifestyle Centre',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'parklands-lifestyle-centre-parklands'),
  'Shop 13, Parklands Lifestyle Centre, Parklands Main Rd, Parklands, Cape Town, 7441', '087 057 9355', NULL, NULL,
  'Puma Factory Outlet is a sportswear and footwear outlet store, located in Parklands Lifestyle Centre, Parklands.',
  NULL, NULL,
  '["https://wheeyo.com/puma-parklands-lifestyle-centre-outlet-parklands-main-rd-shop-13-parklands-lifestyle-centre-27-87-057-9355/", "https://za.africabz.com/western-cape/puma-parklands-lifestyle-centre-outlet-290409"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'puma-factory-outlet-parklands-lifestyle-centre-parklands'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dukes-coffee-roastery-parklands', 'Duke''s Coffee & Roastery',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'parklands-lifestyle-centre-parklands'),
  'Parklands Lifestyle Centre, Parklands Main Road, Parklands, Cape Town, 7441', '021 205 1730', NULL, NULL,
  'Duke''s Coffee & Roastery is a coffee shop and roastery in Parklands Lifestyle Centre, Parklands.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g2427200-d16713831-Reviews-Dukes_Coffee_Roastery-Table_View_Western_Cape.html", "https://www.sluurpy.co.za/table-view/restaurant/5031826/dukes-coffee-and-roastery"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dukes-coffee-roastery-parklands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'table-view-butchery-parklands', 'Table View Butchery Parklands',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'parklands-lifestyle-centre-parklands'),
  'Shop 5, Parklands Lifestyle Centre, Parklands Main Road, Parklands, Cape Town, 7441', '021 557 7765', NULL, NULL,
  'Table View Butchery is a butchery with a branch in Parklands Lifestyle Centre, Parklands.',
  NULL, NULL,
  '["https://www.facebook.com/TableViewButchery/photos/parklands-branch-shop-5-parklands-lifestyle-centre-same-centre-as-planet-fitness/792041464190530/", "https://za.africabz.com/western-cape/table-view-butchery-18960"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'table-view-butchery-parklands'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'planet-fitness-parklands', 'Planet Fitness Parklands',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'parklands-lifestyle-centre-parklands'),
  'Parklands Lifestyle Centre, Cnr Links & Parklands Main Road, Parklands, Cape Town, 7441', '021 556 5595', NULL, NULL,
  'Planet Fitness is a gym chain, with a branch in Parklands Lifestyle Centre, Parklands.',
  NULL, NULL,
  '["https://www.planetfitness.co.za/gyms/parklands/", "https://www.cybo.com/ZA-biz/planet-fitness-parklands"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'planet-fitness-parklands'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
