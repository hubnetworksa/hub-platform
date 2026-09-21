INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-hussar-grill-rondebosch', 'The Hussar Grill (Rondebosch)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  '10 Main Road, Rondebosch, Cape Town, 7700', '021 689 9516', NULL, NULL,
  'The Hussar Grill in Rondebosch is a premium steakhouse, established in 1964 as one of the oldest grillrooms in the country.',
  NULL, NULL,
  '["https://hussargrill.co.za/locations/rondebosch", "https://www.seeff.com/news/the-hussar-grill-rondebosch/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-hussar-grill-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rocomamas-riverside-mall-rondebosch', 'RocoMamas (Riverside Mall)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverside-mall-rondebosch'),
  'Shop 37, Riverside Mall, Main Road, Rondebosch, Cape Town, 7700', '021 207 7222', NULL, NULL,
  'RocoMamas is a burger restaurant in Riverside Mall, Rondebosch, known for its build-your-own burgers, waffles and milkshakes.',
  NULL, NULL,
  '["https://rocomamas.com/za/restaurants/western-cape/rocomamas-rondebosch", "https://riversiderondebosch.co.za/store/rocomamas/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rocomamas-riverside-mall-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'social-bean-cafe-riverside-mall-rondebosch', 'Social Bean Cafe (Riverside Mall)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverside-mall-rondebosch'),
  'Shop 32 & 33, Riverside Mall, Main Road, Rondebosch, Cape Town, 7700', '021 686 4180', NULL, NULL,
  'Social Bean Cafe is a coffee shop in Riverside Mall, Rondebosch, serving coffee, light meals and catering platters.',
  NULL, NULL,
  '["https://socialbeancafe.co.za/", "https://vymaps.com/ZA/Social-Bean-Cafe-154755/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'social-bean-cafe-riverside-mall-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mcdonalds-rondebosch-main-centre-rondebosch', 'McDonald''s (Rondebosch Main Centre)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'rondebosch-main-centre-rondebosch'),
  'Shop 21 & 22, Rondebosch Main Centre, 89 Main Road, Rondebosch, Cape Town, 7700', '021 685 2022', NULL, NULL,
  'McDonald''s in Rondebosch Main Centre is a branch of the fast food chain serving burgers and fries.',
  NULL, NULL,
  '["https://www.mcdonalds.co.za/location/mcdonalds-rondebosch", "https://www.tiendeo.co.za/stores/rondebosch/mcdonald-s-main-road/33617"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mcdonalds-rondebosch-main-centre-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kauai-rondebosch-main-centre-rondebosch', 'Kauai (Rondebosch Main Centre)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'rondebosch-main-centre-rondebosch'),
  'Shop 1B, Rondebosch Main Centre, Main Road, Rondebosch, Cape Town, 7700', '021 689 1237', NULL, NULL,
  'Kauai in Rondebosch Main Centre is a branch of the health food chain serving juices, smoothies and wraps.',
  NULL, NULL,
  '["https://locations.kauai.co.za/HealthyFood-CapeTown-KAUAIRondebosch", "https://rondeboschmain.co.za/divi_overlay/kauai/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kauai-rondebosch-main-centre-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
