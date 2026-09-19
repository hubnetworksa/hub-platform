-- Tokai suburb research (jobs 1-2)
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'tokai-on-main-tokai', 'Tokai on Main',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  'Main Road, Tokai, Cape Town', NULL, NULL,
  '["https://my-catalogue.co.za/stores/tokai/food-lovers-market/tokai-on-main-main-road", "https://foodloversmarket.co.za/stores/western-cape/food-lovers-market-tokai/"]',
  'centre'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'food-lovers-market-tokai', 'Food Lover''s Market Tokai',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  (SELECT id FROM shopping_centers WHERE slug = 'tokai-on-main-tokai'),
  'Shop 5, Tokai on Main, Main Rd, Tokai, Cape Town', '021 712 2244', NULL, NULL,
  'Food Lover''s Market Tokai is a fresh-produce and grocery supermarket, in Tokai on Main, Tokai.',
  NULL, NULL,
  '["https://foodloversmarket.co.za/stores/western-cape/food-lovers-market-tokai/", "https://za.africabz.com/western-cape/food-lovers-market-tokai-8446"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'food-lovers-market-tokai'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bootlegger-coffee-company-tokai', 'Bootlegger Coffee Company',
  (SELECT id FROM suburbs WHERE slug = 'tokai'),
  'Shop 9, Forest Glade House, 98 Tokai Rd, Tokai, Cape Town', '021 712 8000', NULL, NULL,
  'Bootlegger Coffee Company is a coffee shop and cafe, in Tokai.',
  NULL, NULL,
  '["https://ourcafes.bootlegger.coffee/FoodDrink-CapeTown-BootleggerTokai", "https://za.africabz.com/western-cape/bootlegger-tokai-799"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bootlegger-coffee-company-tokai'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
