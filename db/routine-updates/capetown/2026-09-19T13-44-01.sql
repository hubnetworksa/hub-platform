INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'capegate-shopping-centre-brackenfell', 'CapeGate Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Cnr Okavango Road & De Bron Road, Brackenfell, Cape Town, 7562', NULL, NULL,
  '["https://capegatecentre.co.za/", "https://www.yep.co.za/biz/store/iyp/13148613_3"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-cape-gate-pharmacy-brackenfell', 'Dis-Chem Cape Gate Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'capegate-shopping-centre-brackenfell'),
  'Cape Gate Shopping Precinct Centre, Cnr Okavango & De Bron Road, Brackenfell, Cape Town, 7560', '021 983 1000', NULL, NULL,
  'Dis-Chem Cape Gate Pharmacy is a pharmacy inside CapeGate Shopping Centre, in Brackenfell.',
  NULL, NULL,
  '["https://www.dischem.co.za/cape-gate-pharmacy", "https://rfmcf.co.za/search-medical-provider/pharmacy-clinics/pharmacy-clinics/dis-chem-brackenfell-corner-pharmacy/394/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-cape-gate-pharmacy-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-palms-restaurant-brackenfell', 'The Palms Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Farm 17, Bottelary Road, Brackenfell, Cape Town', '021 988 1724', NULL, NULL,
  'The Palms Restaurant is a pub and grill on Bottelary Road in Brackenfell, serving burgers, pizzas, steaks and seafood.',
  NULL, NULL,
  '["https://www.thepalmsrestaurant.co.za/", "https://www.dining-out.co.za/md/The-Palms-Pub-Grill/5341"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-palms-restaurant-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
