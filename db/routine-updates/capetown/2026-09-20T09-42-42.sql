INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-muizenberg', 'Pick n Pay',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'capricorn-square-muizenberg'),
  'Shop 22, Capricorn Square, Cnr Prince George Drive & Dury Road, Muizenberg, Cape Town', '021 709 0060', NULL, NULL,
  'Pick n Pay is a supermarket, in Capricorn Square, Muizenberg.',
  NULL, NULL,
  '["https://www.capricornsquare.co.za/stores/", "https://www.shopshours.co.za/pick-n-pay/cape-town/c-57f3cac247d677c3b27e5cae"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-muizenberg', 'Clicks',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'capricorn-square-muizenberg'),
  'Capricorn Square, Prince George Drive, Muizenberg, Cape Town', '021 788 4671', NULL, NULL,
  'Clicks is a pharmacy and health, beauty and homeware retailer, in Capricorn Square, Muizenberg.',
  NULL, NULL,
  '["https://www.capricornsquare.co.za/stores/", "https://clicks.co.za/store/Capricorn-Park/1661"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-muizenberg', 'The Crazy Store',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'capricorn-square-muizenberg'),
  'Shop 14, Capricorn Square, Cnr Prince George Drive & Dury Road, Muizenberg, Cape Town', '021 709 0784', NULL, NULL,
  'The Crazy Store is a discount variety and homeware retailer, in Capricorn Square, Muizenberg.',
  NULL, NULL,
  '["https://www.capricornsquare.co.za/stores/", "https://www.cylex.net.za/company/the-crazy-store---muizenberg-23762356.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-crazy-store-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-muizenberg', 'PEP',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'capricorn-square-muizenberg'),
  'Shop 5, Capricorn Square, Cnr Prince George Drive & Dury Road, Muizenberg, Cape Town', '021 709 0514', NULL, NULL,
  'PEP is a discount clothing and homeware retailer, in Capricorn Square, Muizenberg.',
  NULL, NULL,
  '["https://www.capricornsquare.co.za/stores/", "https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-capricorn-park-cnr-prince-george-dury-road-muizenberg-cape-town-western-cape/12434"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'debonairs-pizza-muizenberg', 'Debonairs Pizza',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'capricorn-square-muizenberg'),
  'Shop 29, Capricorn Square, Capricorn Boulevard North, Muizenberg, Cape Town', '021 200 5816', NULL, NULL,
  'Debonairs Pizza is a pizza takeaway and delivery outlet, in Capricorn Square, Muizenberg.',
  NULL, NULL,
  '["https://www.capricornsquare.co.za/stores/", "https://locations.debonairspizza.co.za/restaurants-CapricornSquareShoppingCentre-DebonairsPizzaCapricornSquare"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'debonairs-pizza-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-liquors-muizenberg', 'Pick n Pay Liquors',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'capricorn-square-muizenberg'),
  'Capricorn Square, 7 Capricorn Park, Muizenberg, Cape Town', '021 709 0813', NULL, NULL,
  'Pick n Pay Liquors is a liquor store, in Capricorn Square, Muizenberg.',
  NULL, NULL,
  '["https://www.capricornsquare.co.za/stores/", "https://www.yep.co.za/biz/store/pick-n-pay-liquors-capricorn-park/303539"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-liquors-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fishermans-lane-muizenberg', 'Fisherman''s Lane',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'capricorn-square-muizenberg'),
  'Shop 13, Capricorn Square, Prince George Drive, Muizenberg, Cape Town', '021 569 5471', NULL, NULL,
  'Fisherman''s Lane is a fish and chips takeaway, in Capricorn Square, Muizenberg.',
  NULL, NULL,
  '["https://www.capricornsquare.co.za/stores/", "https://za.africabz.com/western-cape/fishermans-lane-83135"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fishermans-lane-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zone-fitness-muizenberg', 'Zone Fitness',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'capricorn-square-muizenberg'),
  '2nd Floor, Capricorn Square, Prince George Drive, Muizenberg, Cape Town', '021 815 9650', NULL, NULL,
  'Zone Fitness is a gym, in Capricorn Square, Muizenberg.',
  NULL, NULL,
  '["https://www.capricornsquare.co.za/stores/", "https://zonefitness.co.za/muizenberg/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zone-fitness-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-vet-store-muizenberg', 'The Vet Store',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'capricorn-square-muizenberg'),
  'Capricorn Square, Prince George Drive, Muizenberg, Cape Town', '021 709 0064', NULL, NULL,
  'The Vet Store is a pet supplies and veterinary care shop, in Capricorn Square, Muizenberg.',
  NULL, NULL,
  '["https://www.capricornsquare.co.za/stores/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=290669"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-vet-store-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);
