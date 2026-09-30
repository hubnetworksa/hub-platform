INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-blue-downs', 'KFC',
  (SELECT id FROM suburbs WHERE slug = 'blue-downs'),
  (SELECT id FROM shopping_centers WHERE slug = 'blue-downs-shopping-centre-blue-downs'),
  'Cnr Hindle Road & Eersterivier Road, Blue Downs Shopping Centre, Blue Downs, Cape Town, 7100', '021 909 6030', NULL, NULL,
  'KFC is a fast-food restaurant outlet in Blue Downs Shopping Centre, Blue Downs.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/blue-downs/cnr-hindle-&-eersterivier-road", "https://foursquare.com/v/kfc-bluedowns/4d721948ff6ba35d47d8688a"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-blue-downs'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dominos-pizza-blue-downs', "Domino's Pizza",
  (SELECT id FROM suburbs WHERE slug = 'blue-downs'),
  (SELECT id FROM shopping_centers WHERE slug = 'blue-downs-shopping-centre-blue-downs'),
  'Shop 23, Cnr Hindle Road & Eersterivier Way, Blue Downs Shopping Centre, Blue Downs, Cape Town, 7100', '021 909 6406', NULL, NULL,
  "Domino's Pizza is a pizza takeaway and delivery outlet in Blue Downs Shopping Centre, Blue Downs.",
  NULL, NULL,
  '["https://cache.dominos.com/olo/4_2_1/assets/build/market/ZA/_en/pdf/dominos_pizza_list.pdf", "https://nearbyza.com/place/domino-s-pizza-blue-downs-1"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dominos-pizza-blue-downs'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blue-downs-clinic-blue-downs', 'Blue Downs Clinic',
  (SELECT id FROM suburbs WHERE slug = 'blue-downs'),
  'Bentley Street, Blue Downs, Cape Town, 7100', '021 444 8313', NULL, NULL,
  'Blue Downs Clinic is a City of Cape Town public primary healthcare clinic on Bentley Street, Blue Downs.',
  NULL, NULL,
  '["https://clinicfinder.co.za/clinics/western-cape/blue-downs-clinic-western-cape", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=111511"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'blue-downs-clinic-blue-downs'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-blue-downs', 'Clicks',
  (SELECT id FROM suburbs WHERE slug = 'blue-downs'),
  (SELECT id FROM shopping_centers WHERE slug = 'blue-downs-shopping-centre-blue-downs'),
  'Shop 28, Cnr Hindle Road & Eersriv Way, Blue Downs Shopping Centre, Blue Downs, Cape Town, 7100', '021 488 8456', NULL, NULL,
  'Clicks is a pharmacy and health and beauty retailer in Blue Downs Shopping Centre, Blue Downs.',
  NULL, NULL,
  '["https://clicks.co.za/store/Blue-Downs-Shopping-Centre/2334", "https://www.medpages.info/sf/index.php?page=listing&servicecode=471&suburbcode=5048"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-blue-downs'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'medirite-pharmacy-blue-downs', 'Medirite Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'blue-downs'),
  (SELECT id FROM shopping_centers WHERE slug = 'blue-downs-shopping-centre-blue-downs'),
  'Erf 20395, Cnr Hindle Road & Eersriv Way, Blue Downs Shopping Centre, Blue Downs, Cape Town, 7100', '021 909 0054', NULL, NULL,
  'Medirite Pharmacy is a pharmacy in Blue Downs Shopping Centre, Blue Downs.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=251214", "https://www.recomed.co.za/clinic/sunset-glen/medirite---blue-downs/54495/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medirite-pharmacy-blue-downs'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
