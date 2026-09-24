INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-hyper-cape-gate-brackenfell', 'Checkers Hyper', (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'capegate-shopping-centre-brackenfell'),
  'Shop LL11, 1 De Bron Road, Cape Gate, Brackenfell, Cape Town, 7562', '021 980 8560', NULL, NULL,
  'Checkers Hyper is a large-format supermarket inside Cape Gate Shopping Centre in Brackenfell.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/Supermarkets/Checkers_Cape_Gate/5333", "https://www.africanadvice.com/1099808/Supermarkets_And_Grocery_Stores/Western_Cape/Checkers_Hyper_-_Brackenfell/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-hyper-cape-gate-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'game-cape-gate-brackenfell', 'Game', (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'capegate-shopping-centre-brackenfell'),
  'Shop L80, Cape Gate Regional Shopping Centre, Cnr Okavango and De Bron Road, Brackenfell, Cape Town, 7562', '0861 426 016', NULL, NULL,
  'Game is a general merchandise and discount department store inside Cape Gate Shopping Centre in Brackenfell.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/brackenfell/game-shop-l-cape-gate-regional-shopping-centre-brackenfell/3458", "https://southafricafirm.com/western-cape/game-cape-gate-32713"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'game-cape-gate-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blasters-family-restaurant-brackenfell', 'Blasters Family Restaurant', (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Shop A1, Cape Gate Decor Centre, Nitida Avenue, Brackenfell, Cape Town, 7560', '021 981 7555', NULL, NULL,
  'Blasters Family Restaurant is a family restaurant in Brackenfell serving breakfast, lunch and dinner with an a la carte menu.',
  NULL, NULL,
  '["https://cape-town-south-africa.bizfax.co.za/blasters-family-restaurant.html", "https://za.polomap.com/cape-town/21450"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'blasters-family-restaurant-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
