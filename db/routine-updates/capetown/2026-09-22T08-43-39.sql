INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'okavango-crossing-kraaifontein', 'Okavango Crossing',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  'Corner Okavango & Langeberg Road, Kraaifontein, Cape Town, 7570', NULL, NULL,
  '["https://shopokavango.co.za/", "https://www.facebook.com/okavangocrossing/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'brighton-square-shopping-centre-kraaifontein', 'Brighton Square Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  '125-135 Ascot Street, Kraaifontein, Cape Town, 7570', NULL, NULL,
  '["https://foursquare.com/v/brighton-square-shopping-centre/4e2c026d315185636a094511", "https://www.facebook.com/PEPKraaifonteinBrightonSquare/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-okavango-crossing-kraaifontein', 'Dis-Chem Pharmacy Okavango Crossing',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'okavango-crossing-kraaifontein'),
  'Shop 13, Okavango Crossing, Corner Okavango & Langeberg Road, Kraaifontein, Cape Town, 7570', '021 987 1250', NULL, NULL,
  'Dis-Chem Pharmacy Okavango Crossing is a pharmacy and health retailer inside Okavango Crossing in Kraaifontein.',
  NULL, NULL,
  '["https://www.dischem.co.za/okavango-kraaifontein", "https://www.cylex.net.za/company/dis-chem-pharmacy-okavango---kraaifontein-23816919.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-okavango-crossing-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mcdonalds-okavango-crossing-kraaifontein', 'McDonald''s Okavango Crossing',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'okavango-crossing-kraaifontein'),
  'Shop 428, Okavango Crossing, Langeberg Road, Kraaifontein, Cape Town, 7570', '021 987 1805', NULL, NULL,
  'McDonald''s Okavango Crossing is a fast-food restaurant with a drive-thru inside Okavango Crossing in Kraaifontein.',
  NULL, NULL,
  '["https://www.mcdonalds.co.za/location/mcdonalds-okavango", "https://restaurantguru.com/McDonalds-Cape-Town-69"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mcdonalds-okavango-crossing-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'romans-pizza-okavango-crossing-kraaifontein', 'Roman''s Pizza Okavango Crossing',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'okavango-crossing-kraaifontein'),
  'Corner Langeberg Road & Okavango Road, Okavango Crossing, Kraaifontein, Cape Town, 7570', '021 200 5997', NULL, NULL,
  'Roman''s Pizza Okavango Crossing is a pizza takeaway and delivery outlet inside Okavango Crossing in Kraaifontein.',
  NULL, NULL,
  '["https://romanspizza.co.za/store-locator/7137a1a8-a45d-41fa-adb8-9abd43d70327", "https://za.africabz.com/western-cape/romans-pizza-okavango-73809"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'romans-pizza-okavango-crossing-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rocomamas-okavango-crossing-kraaifontein', 'RocoMamas Okavango Crossing',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'okavango-crossing-kraaifontein'),
  'Shop 18, Okavango Crossing, Okavango Road, Kraaifontein, Cape Town, 7570', '021 300 6477', NULL, NULL,
  'RocoMamas Okavango Crossing is a burger restaurant inside Okavango Crossing in Kraaifontein, offering dine-in, takeaway and delivery.',
  NULL, NULL,
  '["https://rocomamas.com/za/restaurants/western-cape/rocomamas-okavango", "https://www.eatout.co.za/venue/rocomamas-okavango/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rocomamas-okavango-crossing-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-brighton-square-kraaifontein', 'Clicks Brighton Square',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'brighton-square-shopping-centre-kraaifontein'),
  'Kipling Street, Brighton Square Shopping Centre, Kraaifontein, Cape Town, 7570', '021 987 0353', NULL, NULL,
  'Clicks Brighton Square is a pharmacy and health, beauty and homeware retailer inside Brighton Square Shopping Centre in Kraaifontein.',
  NULL, NULL,
  '["https://clicks.co.za/store/Brighton-Square/2051", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=89482"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-brighton-square-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zone-fitness-brighton-square-kraaifontein', 'Zone Fitness Kraaifontein',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'brighton-square-shopping-centre-kraaifontein'),
  'Brighton Square Shopping Centre, Corner Brighton & Kipling Road, Kraaifontein, Cape Town, 7570', '021 987 1651', NULL, NULL,
  'Zone Fitness Kraaifontein is a gym inside Brighton Square Shopping Centre in Kraaifontein.',
  NULL, NULL,
  '["https://zonefitness.co.za/location/zone-fitness-kraaifontein/", "https://za.africabz.com/western-cape/zone-fitness-kraaifontein-124544"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zone-fitness-brighton-square-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-brighton-square-kraaifontein', 'PEP Brighton Square',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  (SELECT id FROM shopping_centers WHERE slug = 'brighton-square-shopping-centre-kraaifontein'),
  'Shop 15-16, Brighton Square Shopping Centre, 125-135 Ascot Street, Kraaifontein, Cape Town, 7570', '021 988 1623', NULL, NULL,
  'PEP Brighton Square is a clothing and homeware retailer inside Brighton Square Shopping Centre in Kraaifontein.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop--brighton-square-shopping-centre--ascot-street-kraaifontein-cape-town-western-cape/69851", "https://www.facebook.com/PEPKraaifonteinBrightonSquare/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-brighton-square-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
