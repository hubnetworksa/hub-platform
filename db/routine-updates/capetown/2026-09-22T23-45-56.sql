INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'cavalier-shopping-centre-belhar', 'Cavalier Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  'Modderdam Road, Belhar, Cape Town', NULL, NULL,
  '["https://locations.debonairspizza.co.za/restaurants-CavalierShoppingCentre-DebonairsPizzaBelhar", "https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-cavalier-retail-centre-modderdam-road-belhar-cape-town-western-cape/69153"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-cavalier-belhar', 'PEP Cavalier Belhar',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'cavalier-shopping-centre-belhar'),
  'Shop 10, Cavalier Shopping Centre, Modderdam Road, Belhar, Cape Town, 7493', '021 934 5126', NULL, NULL,
  'PEP at Cavalier Shopping Centre is a branch of the value clothing, footwear and homeware retail chain, in Belhar.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-cavalier-retail-centre-modderdam-road-belhar-cape-town-western-cape/69153", "https://vymaps.com/ZA/Pep-Stores-Belhar-Cavelier-Retail-Centre-T25702874/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-cavalier-belhar'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-cavalier-belhar', 'Ackermans Cavalier Belhar',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'cavalier-shopping-centre-belhar'),
  'Shop 11 & 12, Cavalier Shopping Centre, Modderdam Road, Belhar, Cape Town, 7493', '021 935 0612', NULL, NULL,
  'Ackermans at Cavalier Shopping Centre is a branch of the value fashion and clothing retail chain, in Belhar.',
  NULL, NULL,
  '["https://tiendeo.co.za/stores/parow/ackermans-belhar-station-modderdam-road/41689", "https://my-catalogue.co.za/stores/cape-town/ackermans/cavalier-centre-belhar-station-modderdam-road-parow-industrial"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-cavalier-belhar'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'debonairs-pizza-cavalier-belhar', 'Debonairs Pizza Cavalier Belhar',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'cavalier-shopping-centre-belhar'),
  'Shop 14, Cavalier Shopping Centre, Modderdam Road, Belhar, Cape Town, 7493', '021 934 2519', NULL, NULL,
  'Debonairs Pizza at Cavalier Shopping Centre is a branch of the pizza delivery and takeaway chain, in Belhar.',
  NULL, NULL,
  '["https://locations.debonairspizza.co.za/restaurants-CavalierShoppingCentre-DebonairsPizzaBelhar", "https://nearbyza.com/place/debonairs-pizza-belhar"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'debonairs-pizza-cavalier-belhar'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'superspar-belhar-belhar', 'SUPERSPAR Belhar',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  (SELECT id FROM shopping_centers WHERE slug = 'cavalier-shopping-centre-belhar'),
  'Cavalier Shopping Centre, Corner Modderdam & Robert Sobukwe Road, Belhar, Cape Town, 7493', '021 935 0651', NULL, NULL,
  'SUPERSPAR Belhar is a supermarket at Cavalier Shopping Centre with bakery, butchery, deli and hot-foods departments.',
  NULL, NULL,
  '["https://www.spar.co.za/home/store-view/superspar-belhar-western-cape", "https://nearbyza.com/place/spar-belhar"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'superspar-belhar-belhar'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bmc-pharmacy-belhar', 'BMC Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  '70 Belhar Drive, Belhar, Cape Town', '021 952 8672', 'https://bmcpharmacy.co.za/', NULL,
  'BMC Pharmacy is a retail pharmacy at Belhar Medical Centre, on Belhar Drive.',
  NULL, NULL,
  '["https://bmcpharmacy.co.za/contacts/", "https://healthandmedical.co.za/view/b-m-c-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bmc-pharmacy-belhar'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
