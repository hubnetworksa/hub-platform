-- Sunnydale: standalone business
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cafe-and-deli-at-harry-goemans-sunnydale', 'The Cafe and Deli at Harry Goemans',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  '4 Kommetjie Road, Sunnydale, Cape Town, 7975', '021 785 1395', 'https://www.harrygoemans.co.za', NULL,
  'The Cafe and Deli at Harry Goemans is a cafe and deli at Harry Goemans Garden Centre, Sunnydale, serving breakfast, lunch and coffee.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/cafe-deli-harry-goemans/", "https://www.tripadvisor.co.za/Restaurant_Review-g14251555-d19087906-Reviews-The_Cafe_and_Deli_at_Harry_Goemans-Sunnydale_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cafe-and-deli-at-harry-goemans-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

-- Longbeach Mall (noordhoek) already exists in shopping_centers but had zero tenants linked
-- and was missing from routine-state.json's tracking -- tenant discovery batch below.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'michigan-spur-noordhoek', 'Michigan Spur',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Shop G34, Longbeach Mall, Buller Louw Blvd, Noordhoek, Cape Town, 7975', '021 785 3532', NULL, NULL,
  'Michigan Spur is a Spur Steak Ranches family restaurant in Longbeach Mall, Noordhoek, serving flame-grilled steaks, burgers and ribs.',
  NULL, NULL,
  '["https://longbeachmall.co.za/stores/michigan-spur/", "https://www.callupcontact.com/b/Restaurants/Michigan_Spur/6449086"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'michigan-spur-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-noordhoek', 'Woolworths',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Shop G25, Longbeach Mall, Buller Louw Blvd, Noordhoek, Cape Town, 7975', '021 784 1460', NULL, NULL,
  'Woolworths is a food and clothing department store in Longbeach Mall, Noordhoek.',
  NULL, NULL,
  '["https://longbeachmall.co.za/stores/woolworths/", "https://za.africabz.com/western-cape/woolworths-longbeach-mall-16059"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spec-savers-noordhoek', 'Spec-Savers',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Shop G57, Longbeach Mall, Cnr Sunnydale Road & Buller Louw Drive, Noordhoek, Cape Town, 7975', '021 785 2181', NULL, NULL,
  'Spec-Savers is an optometrist in Longbeach Mall, Noordhoek, offering eye tests and glasses.',
  NULL, NULL,
  '["https://longbeachmall.co.za/stores/spec-savers/", "https://za.africabz.com/western-cape/spec-savers-longbeach-mall-38853"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spec-savers-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-noordhoek', 'Pick n Pay Hypermarket',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Longbeach Mall, Longboat Road, Noordhoek, Cape Town, 7975', '021 785 4420', NULL, NULL,
  'Pick n Pay Hypermarket is a supermarket in Longbeach Mall, Noordhoek.',
  NULL, NULL,
  '["https://longbeachmall.co.za/stores/pick-n-pay/", "https://za.africabz.com/western-cape/pick-n-pay-longbeach-mall-31880"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'standard-bank-noordhoek', 'Standard Bank',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Longbeach Mall, Buller Louw Drive, Noordhoek, Cape Town, 7975', '0860 101 341', NULL, NULL,
  'Standard Bank is a bank branch in Longbeach Mall, Noordhoek.',
  NULL, NULL,
  '["https://longbeachmall.co.za/stores/standard-bank/", "https://za.textmap.info/3/17700"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'standard-bank-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'value-co-noordhoek', 'Value Co',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Longbeach Mall, Buller Louw Blvd, Noordhoek, Cape Town, 7975', '021 974 9050', NULL, NULL,
  'Value Co is a discount variety and homeware store in Longbeach Mall, Noordhoek.',
  NULL, NULL,
  '["https://longbeachmall.co.za/stores/value-co/", "https://za.africabz.com/western-cape/value-co-longbeach-mall-487009"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'value-co-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'edgars-noordhoek', 'Edgars',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Longbeach Mall, Cnr Buller Louw Drive & Sunnydale Road, Noordhoek, Cape Town, 7975', '021 784 1300', NULL, NULL,
  'Edgars is a fashion and clothing department store in Longbeach Mall, Noordhoek.',
  NULL, NULL,
  '["https://www.ayoba.com/business/EdgarsLongbeachMall", "https://www.sayellow.com/view/south-africa/edgars-long-beach-mall-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'edgars-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'food-lovers-market-noordhoek', "Food Lover's Market",
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Shop G60, Longbeach Mall, Longboat Street, Noordhoek, Cape Town, 7975', '021 785 7060', NULL, NULL,
  "Food Lover's Market is a fresh produce and grocery store in Longbeach Mall, Noordhoek.",
  NULL, NULL,
  '["https://longbeachmall.co.za/stores/food-lovers-market/", "https://za.africabz.com/western-cape/food-lovers-market-longbeach-mall-1474"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'food-lovers-market-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
