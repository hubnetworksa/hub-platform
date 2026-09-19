INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'the-village-square-durbanville', 'The Village Square',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  'Corner Oxford & Queen Streets, Durbanville, Cape Town, 7550', NULL, NULL,
  '["https://durbanvillevillagesquare.co.za/stores/", "https://capetownadvisor.com/village-square-durbanvilles-new-shopping-centre/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hussar-grill-durbanville', 'The Hussar Grill Durbanville',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-village-square-durbanville'),
  'Shop 5, The Village Square, Queen Street, Durbanville, Cape Town, 7550', '087 809 3885', NULL, NULL,
  'The Hussar Grill Durbanville is a steakhouse and grill restaurant, part of a well-known South African chain, in The Village Square, Durbanville.',
  NULL, NULL,
  '["https://www.hussargrill.co.za/find-us/western-cape/durbanville/", "https://www.dineplan.com/restaurants/the-hussar-grill-durbanville"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hussar-grill-durbanville'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lupa-osteria-durbanville', 'Lupa Osteria Durbanville',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-village-square-durbanville'),
  'Shop 7, The Village Square, Queen Street, Durbanville, Cape Town, 7550', '087 822 1655', NULL, NULL,
  'Lupa Osteria Durbanville is an Italian restaurant serving pizza and pasta in The Village Square, Durbanville.',
  NULL, NULL,
  '["https://www.lupa.co.za/hours-locations/", "https://www.dineplan.com/restaurants/lupa-osteria-durbanville"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lupa-osteria-durbanville'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ocean-basket-durbanville', 'Ocean Basket Durbanville',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-village-square-durbanville'),
  'Shop 19, The Village Square, Oxford Street, Durbanville, Cape Town, 7550', '021 002 5004', NULL, NULL,
  'Ocean Basket Durbanville is a seafood restaurant, part of the national Ocean Basket chain, in The Village Square, Durbanville.',
  NULL, NULL,
  '["https://za.oceanbasket.com/store/ocean-basket-durbanville/", "https://www.tripadvisor.com/Restaurant_Review-g1057715-d32980197-Reviews-Ocean_Basket_Durbanville-Durbanville_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ocean-basket-durbanville'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'durbanville-fisheries-durbanville', 'Durbanville Fisheries',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'durbanville-town-centre-durbanville'),
  'Shop 20, Durbanville Town Centre, Wellington Road, Durbanville, Cape Town, 7530', '087 292 3755', NULL, NULL,
  'Durbanville Fisheries is a fish and chips shop and takeaway in Durbanville Town Centre, Durbanville.',
  NULL, NULL,
  '["https://www.durbanvilletowncentre.co.za/stores/durbanville-fisheries/", "https://durbanvillefisheries.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'durbanville-fisheries-durbanville'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
