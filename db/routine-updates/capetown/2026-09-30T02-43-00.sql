INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'de-ville-centre-durbanville', 'De Ville Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  '36 Main Road, Durbanville, 7551', NULL, NULL,
  '["https://www.devillecentre.co.za/categories.htm?category=Clothing", "https://www.findmy.co.za/services/business/de-ville-shopping-centre/44730"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'boa-beauty-bar-durbanville', 'BOA Beauty Bar',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'de-ville-centre-durbanville'),
  'Shop 35, De Ville Shopping Centre, Wellington Road, Durbanville, 7550', '021 330 5505', NULL, NULL,
  'BOA Beauty Bar is a nail and beauty salon in De Ville Shopping Centre, Durbanville.',
  NULL, NULL,
  '["https://www.fresha.com/a/boa-beauty-bar-durbanville-cape-town-de-ville-centre-wellington-road-k3va3bse", "https://www.devillecentre.co.za/categories.htm?category=Clothing"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'boa-beauty-bar-durbanville'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'anysberg-biltong-and-deli-durbanville', 'Anysberg Biltong & Deli',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'de-ville-centre-durbanville'),
  'Shop 17, De Ville Shopping Centre, Corner of Wellington Street and Main Road, Durbanville, 7551', '021 975 0499', NULL, NULL,
  'Anysberg Biltong & Deli is a biltong and deli shop in De Ville Shopping Centre, Durbanville.',
  NULL, NULL,
  '["https://www.jamii.co.za/6325-cape-town-biltong-retailer-anysberg-biltong-deli", "https://www.snupit.co.za/durbanville/morningstar/anysberg-biltong-_and_-deli/220321"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'anysberg-biltong-and-deli-durbanville'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'body-20-studio-durbanville', 'Body 20 Studio',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'de-ville-centre-durbanville'),
  'Shop 34, De Ville Shopping Centre, Corner Wellington and Main Street, Durbanville, 7551', '021 976 3288', 'https://body20.co.za/studio-durbanville.php', 'durbanville@body20.co.za',
  'Body 20 Studio is an EMS (electrical muscle stimulation) personal training studio in De Ville Shopping Centre, Durbanville.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=383069", "https://body20.co.za/studio-durbanville.php"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'body-20-studio-durbanville'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bootlegger-coffee-company-durbanville', 'Bootlegger Coffee Company',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-village-square-durbanville'),
  'Shop 13 & 14, The Village Square, Corner of Oxford & Queen Street, Durbanville, 7550', '021 206 6356', NULL, NULL,
  'Bootlegger Coffee Company is a specialty coffee shop and cafe in The Village Square, Durbanville.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/bootlegger-coffee-company-255626", "https://restaurants-in-cape-town.co.za/restaurants/bootlegger-village-square/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bootlegger-coffee-company-durbanville'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vizi-hair-durbanville', 'Vizi Hair',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  '22 Oxford Street, Durbanville, Cape Town, 7551', '021 979 5021', NULL, NULL,
  'Vizi Hair is a hair salon on Oxford Street, in Durbanville.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/vizi-hair-oxford-street-cape-town-Ly91WA", "https://foursquare.com/v/vizi-hair/4f0ad6b0e4b0e8ed39ee789c"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vizi-hair-durbanville'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-hollow-tree-on-oxford-durbanville', 'The Hollow Tree on Oxford',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  '20 Oxford Street, Durbanville, Cape Town, 7551', '021 976 3522', NULL, NULL,
  'The Hollow Tree on Oxford is a restaurant and bar on Oxford Street, in Durbanville.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/hollow-tree-on-oxford/", "https://www.tripadvisor.co.za/Restaurant_Review-g1057715-d8262172-Reviews-The_Hollow_Tree-Durbanville_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-hollow-tree-on-oxford-durbanville'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
