INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bidvest-waltons-brackenfell', 'Bidvest Waltons Brackenfell Corner',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-corner-brackenfell'),
  'Shop 20, Brackenfell Corner, Corner Frans Conradie Drive & Paradys Road, Brackenfell, Cape Town, 7560', '021 013 4995', NULL, NULL,
  'Bidvest Waltons Brackenfell Corner is a stationery and office supplies store, in Brackenfell Corner, Brackenfell.',
  NULL, NULL,
  '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://www.waltons.co.za/store-locator"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bidvest-waltons-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bok-lounge-and-grill-brackenfell', 'Bok Lounge & Grill',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-corner-brackenfell'),
  'Brackenfell Corner Shopping Centre, Corner Frans Conradie Drive & Paradys Street, Brackenfell, Cape Town, 7560', '021 983 2260', NULL, NULL,
  'Bok Lounge & Grill is a restaurant and grill serving pizzas, burgers and ribs with a bar, in Brackenfell Corner, Brackenfell.',
  NULL, NULL,
  '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://www.mrdfood.com/food-delivery/restaurant/bok-lounge-and-grill-brackenfell-corner-brackenfell/26785"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bok-lounge-and-grill-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bootlegger-coffee-company-brackenfell', 'Bootlegger Coffee Company',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-corner-brackenfell'),
  'Shop 12A, Brackenfell Corner Centre, Corner Frans Conradie Drive & Paradys Street, Brackenfell, Cape Town, 7560', '021 203 5176', NULL, NULL,
  'Bootlegger Coffee Company is a grab-and-go coffee shop, in Brackenfell Corner, Brackenfell.',
  NULL, NULL,
  '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://ourcafes.bootlegger.coffee/FoodDrink-CapeTown-BootleggerXSBrackenfellCorner"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bootlegger-coffee-company-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'crazy-pets-brackenfell', 'Crazy Pets Brackenfell Corner',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-corner-brackenfell'),
  'Shop 21, Brackenfell Corner Shopping Centre, 506 Frans Conradie Avenue, Brackenfell, Cape Town, 7560', '010 021 0166', NULL, NULL,
  'Crazy Pets Brackenfell Corner is a pet supplies store, in Brackenfell Corner, Brackenfell.',
  NULL, NULL,
  '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://crazypets.co.za/crazy-pets-brackenfell/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'crazy-pets-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'crown-national-brackenfell', 'Crown National Factory Mart Brackenfell Corner',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-corner-brackenfell'),
  'Shop 4, Brackenfell Corner Shopping Centre, Corner Frans Conradie Drive & Paradys Street, Brackenfell, Cape Town, 7560', '021 271 0697', NULL, NULL,
  'Crown National Factory Mart Brackenfell Corner is a menswear and formalwear clothing store, in Brackenfell Corner, Brackenfell.',
  NULL, NULL,
  '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://www.crownnational.co.za/branches"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'crown-national-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pizza-perfect-brackenfell', 'Pizza Perfect Brackenfell Corner',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-corner-brackenfell'),
  'Brackenfell Corner Shopping Centre, Frans Conradie Drive, Brackenfell, Cape Town, 7560', '021 300 6284', NULL, NULL,
  'Pizza Perfect Brackenfell Corner is a pizza restaurant and takeaway, in Brackenfell Corner, Brackenfell.',
  NULL, NULL,
  '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://app.pizzaperfect.co.za/restaurant/8579/pizza-perfect-brackenfell-corner"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pizza-perfect-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'smart-laser-skin-and-body-aesthetics-brackenfell', 'Smart Laser Skin & Body Aesthetics',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'brackenfell-corner-brackenfell'),
  'Brackenfell Corner Shopping Centre, Paradys Street, Brackenfell, Cape Town, 7560', '071 370 3879', NULL, NULL,
  'Smart Laser Skin & Body Aesthetics is a skin and body aesthetics clinic offering laser treatments, in Brackenfell Corner, Brackenfell.',
  NULL, NULL,
  '["https://brackenfellcorner.co.za/brackenfell-corner---stores.html", "https://www.facebook.com/smartlaserskinandbody/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'smart-laser-skin-and-body-aesthetics-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
