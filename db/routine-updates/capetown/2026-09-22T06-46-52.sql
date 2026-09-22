-- Suburb sweep: Durbanville

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-durbanville-town-centre-durbanville', 'Dis-Chem Durbanville Town Centre',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'durbanville-town-centre-durbanville'),
  'Shop 9A, Durbanville Town Centre, 33 Wellington Road, Durbanville, Cape Town, 7551', '021 541 0038', NULL, NULL,
  'Dis-Chem Durbanville Town Centre is a pharmacy and health and beauty store in Durbanville Town Centre.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/dischem-shop-a-durbanville-town-centre-wellington-road-durbanville/54285", "https://www.kimbino.co.za/stores/dis-chem-shop-9a-durbanville-town-centre-33-wellington-road-durbanville/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-durbanville-town-centre-durbanville'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-home-durbanville-town-centre-durbanville', 'PEP Home Durbanville Town Centre',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'durbanville-town-centre-durbanville'),
  'Shop 6, Durbanville Town Centre, 33 Wellington Street, Durbanville, Cape Town, 7550', '021 975 3463', NULL, NULL,
  'PEP Home Durbanville Town Centre is a home goods and furnishings store in Durbanville Town Centre.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/pep-home-durbanville-town-centre-175998", "https://www.tiendeo.co.za/stores/durbanville/pep-home-durbanville-town-centre-wellington-street/71355"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-home-durbanville-town-centre-durbanville'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'u-turn-thrift-shop-durbanville', 'U-turn Thrift Shop',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  '34 Wellington Road, Durbanville, Cape Town, 7550', '021 674 6119', NULL, NULL,
  'U-turn Thrift Shop is a charity thrift store in Durbanville selling new and second-hand goods, with proceeds supporting U-turn''s homelessness support programmes.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/wc/cape-town/u-turn-thrift-shop-durbanville?to=place.ChIJrXiQqvxXzB0ROCGdw8ebvYg", "https://grapevinesa.co.za/index.php/u-turn-charity-shop-durbanville"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'u-turn-thrift-shop-durbanville'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
