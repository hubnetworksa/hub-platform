-- Bloubergstrand: jobs 1-2 -- 3 general businesses + 5 Table Bay Mall tenants (opportunistic sweep)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'doodles-beachfront-restaurant-bloubergstrand', 'Doodles Beachfront Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  '110 Beach Blvd, Bloubergstrand, Cape Town, 7441', '021 554 1080', NULL, 'info@doodles.co.za',
  'Doodles Beachfront Restaurant is a beachfront restaurant and function venue in Bloubergstrand.',
  NULL, NULL,
  '["https://doodles.co.za/", "https://www.capetownwithkids.com/places/doodles-beachfront/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'doodles-beachfront-restaurant-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ons-huisie-restaurant-bloubergstrand', 'Ons Huisie Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  '18 Generaal Jansens Road, Bloubergstrand, Cape Town', '021 554 1553', NULL, 'onshuisie@seascapecollection.co.za',
  'Ons Huisie Restaurant is a seafood restaurant on the beachfront in Bloubergstrand.',
  NULL, NULL,
  '["https://onshuisie.co.za/", "https://www.capetownwithkids.com/ons-huisie-restaurant-bloubergstrand/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ons-huisie-restaurant-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-blue-peter-hotel-bloubergstrand', 'The Blue Peter Hotel',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  '8 Popham Street, Bloubergstrand, Cape Town, 7441', '021 554 1956', NULL, 'info@bluepeter.co.za',
  'The Blue Peter Hotel is a hotel and restaurant on Popham Street in Bloubergstrand.',
  NULL, NULL,
  '["https://bluepeter.co.za/enquire-now/", "https://redplanet.travel/hub/The-Blue-Peter-Hotel-8-Popham-St-Bloubergstrand-Cape-Town-7441-South-Africa"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-blue-peter-hotel-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

-- Table Bay Mall tenants (job 2 opportunistic discovery -- mall already known from an earlier run)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'virgin-active-table-bay-mall-bloubergstrand', 'Virgin Active Table Bay Mall',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'table-bay-mall-bloubergstrand'),
  'Table Bay Mall, Cnr R27 West Coast Road & Berkshire Boulevard, Bloubergstrand, Cape Town, 7441', '021 492 5740', 'https://www.virginactive.co.za/gyms/table-bay-mall', NULL,
  'Virgin Active Table Bay Mall is a health and fitness gym inside Table Bay Mall in Bloubergstrand.',
  NULL, NULL,
  '["https://www.virginactive.co.za/gyms/table-bay-mall", "https://www.tablebaymall.co.za/shop/virgin-active"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'virgin-active-table-bay-mall-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-table-bay-mall-bloubergstrand', 'Clicks Table Bay Mall',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'table-bay-mall-bloubergstrand'),
  'Shop G78, Table Bay Mall, West Coast Rd, Bloubergstrand, Cape Town, 7441', '021 521 8509', 'https://clicks.co.za/store/Table-Bay-Mall/1818', NULL,
  'Clicks Table Bay Mall is a pharmacy, health and beauty store inside Table Bay Mall in Bloubergstrand.',
  NULL, NULL,
  '["https://clicks.co.za/store/Table-Bay-Mall/1818", "https://textmap.co.za/3/51192"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-table-bay-mall-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-table-bay-mall-bloubergstrand', 'Dis-Chem Table Bay Mall',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'table-bay-mall-bloubergstrand'),
  'Table Bay Mall, Cnr R27 & Berkshire Boulevard, Bloubergstrand, Cape Town, 7441', '021 612 0172', 'https://www.dischem.co.za/table-bay-mall-pharmacy', 'tablebaydispensary@dischem.co.za',
  'Dis-Chem Table Bay Mall is a pharmacy inside Table Bay Mall in Bloubergstrand.',
  NULL, NULL,
  '["https://www.dischem.co.za/table-bay-mall-pharmacy", "https://rfmcf.co.za/pharmacy_name/dis-chem-table-bay-mall-pharmacy/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-table-bay-mall-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-table-bay-mall-bloubergstrand', 'Woolworths Table Bay Mall',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'table-bay-mall-bloubergstrand'),
  'Table Bay Mall, West Coast Road (R27) & Berkshire Boulevard, Bloubergstrand, Cape Town, 7441', '021 554 8040', 'https://tablebaymall.co.za/stores/woolworths', NULL,
  'Woolworths Table Bay Mall is a branch of the Woolworths retail chain inside Table Bay Mall in Bloubergstrand, selling groceries, fashion and homeware.',
  NULL, NULL,
  '["https://tablebaymall.co.za/stores/woolworths", "https://www.cybo.com/ZA-biz/woolworths-table-bay-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-table-bay-mall-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-table-bay-mall-bloubergstrand', 'Pick n Pay Table Bay Mall',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'table-bay-mall-bloubergstrand'),
  'Store G002, Table Bay Mall, Cnr R27 (West Coast Road) & Berkshire Blvd, Bloubergstrand, Cape Town, 7441', '021 285 0571', 'https://www.tablebaymall.co.za/shop/pick-n-pay', NULL,
  'Pick n Pay Table Bay Mall is a supermarket inside Table Bay Mall in Bloubergstrand.',
  NULL, NULL,
  '["https://www.tablebaymall.co.za/shop/pick-n-pay", "https://za.africabz.com/western-cape/pick-n-pay-117904"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-table-bay-mall-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
