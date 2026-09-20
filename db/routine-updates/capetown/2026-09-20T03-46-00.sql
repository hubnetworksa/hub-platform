INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'airport-shopping-centre-belhar', 'Airport Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  'Cnr Belhar Drive & Stellenbosch Arterial, Belhar, Cape Town, 7493', NULL, NULL,
  '["https://www.waze.com/live-map/directions/airport-shopping-centre-hanover-ave-belhar-16,-cape-town", "https://heyshops.co.za/Cape_Town/Belhar_Airport_Mall/", "https://clicks.co.za/store/Airport-Shopping-Centre,-Belhar/1972"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-airport-shopping-centre-belhar', 'Clicks Airport Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'airport-shopping-centre-belhar'),
  'Airport Shopping Centre, Cnr Belhar Dr & Stellenbosch Arterial, Belhar, Cape Town, 7493', '021 953 6150', NULL, NULL,
  'Clicks Airport Shopping Centre is a pharmacy and health-and-beauty store trading from the Airport Shopping Centre in Belhar.',
  NULL, NULL,
  '["https://clicks.co.za/store/Airport-Shopping-Centre,-Belhar/1972", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=411605"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-airport-shopping-centre-belhar'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-airport-shopping-centre-belhar', 'PEP Airport Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'airport-shopping-centre-belhar'),
  'Shop 4 & 5, Airport Shopping Centre, Belhar Dr, Belhar, Cape Town, 7493', '021 952 6185', NULL, NULL,
  'PEP Airport Shopping Centre is a budget clothing and homeware store trading from the Airport Shopping Centre in Belhar.',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/pep-parow-belhar-airport-mall-021-952-6185", "https://za.africabz.com/western-cape/pep-parow-belhar-airport-mall-100342"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-airport-shopping-centre-belhar'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-crusaders-airport-shopping-centre-belhar', 'Cash Crusaders Belhar',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'airport-shopping-centre-belhar'),
  'Shop 45, Airport Shopping Centre, Cnr Belhar Dr & Stellenbosch Arterial, Belhar, Cape Town, 7493', '021 952 6028', NULL, NULL,
  'Cash Crusaders Belhar buys and sells second-hand goods from the Airport Shopping Centre in Belhar.',
  NULL, NULL,
  '["https://www.facebook.com/BelharCashCrusad/", "https://my-catalogue.co.za/stores/cape-town/cash-crusaders/airport-shopping-centre-corner-of-belhar-drive-and-stellenbosch-arterial-belhar"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-crusaders-airport-shopping-centre-belhar'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-airport-shopping-centre-belhar', 'Shoprite Airport Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'airport-shopping-centre-belhar'),
  'Airport Shopping Centre, Cnr Stellenbosch Arterial & Belhar Drive, Belhar, Cape Town, 7493', '021 953 8300', NULL, NULL,
  'Shoprite Airport Shopping Centre is a supermarket trading from the Airport Shopping Centre in Belhar.',
  NULL, NULL,
  '["https://mydorpie.com/m/?page=chain_shoprite_airport_shopping_mall_belhar", "https://rsa.worldorgs.com/catalog/cape-town/grocery-store/shoprite-belhar"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-airport-shopping-centre-belhar'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'erica-square-belhar', 'Erica Square',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  'Cnr Erica Drive & Kern Crescent, Belhar, Cape Town, 7493', NULL, NULL,
  '["https://www.facebook.com/ericasquareshoppingcentre/", "https://za.africabz.com/western-cape/erica-square-166751", "https://clicks.co.za/store/Erica-Square/1806"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-erica-square-belhar', 'Clicks Erica Square',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'erica-square-belhar'),
  'Shop 7, Erica Square, Erica Dr, Belhar, Cape Town, 7493', '021 953 0420', NULL, NULL,
  'Clicks Erica Square is a pharmacy and health-and-beauty store trading from the Erica Square shopping centre in Belhar.',
  NULL, NULL,
  '["https://clicks.co.za/store/Erica-Square/1806", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=385793"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-erica-square-belhar'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-erica-square-belhar', 'PEP Erica Square',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'erica-square-belhar'),
  'Shop 3, Erica Square, Cnr Erica Drive & Kern Crescent, Belhar, Cape Town, 7493', '021 953 0412', NULL, NULL,
  'PEP Erica Square is a budget clothing and homeware store trading from the Erica Square shopping centre in Belhar.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-erica-square-cnr-erica-drive-kern-crescent-belhar-cape-town-western-cape/69865", "https://za.africabz.com/western-cape/pep-parow-belhar-erica-square-269006"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-erica-square-belhar'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-erica-square-belhar', 'The Crazy Store Erica Square',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'erica-square-belhar'),
  'Shop 22, Erica Square, 2 Erica Dr, Belhar, Cape Town, 7493', '087 138 5137', NULL, NULL,
  'The Crazy Store Erica Square is a variety and gift store trading from the Erica Square shopping centre in Belhar.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/crazy-store-erica-square-shop-erica-dr-belhar-cape-town-south-africa/73300", "https://hombaze.co.za/the-crazy-store-belhar-47208436171662248/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-crazy-store-erica-square-belhar'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-erica-square-belhar', 'SPAR Erica Square',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'erica-square-belhar'),
  'Shop 1, Erica Square, Erica Drive, Belhar, Cape Town, 7493', '021 100 3281', NULL, NULL,
  'SPAR Erica Square is a supermarket trading from the Erica Square shopping centre in Belhar.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/belhar/spar/shop-1-erica-drive", "https://spar-erica.wheree.com/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-erica-square-belhar'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
