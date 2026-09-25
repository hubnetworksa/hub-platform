INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'kensington-shopping-centre-kensington', 'Kensington Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  '27 12th Avenue, Kensington, Cape Town, 7405', NULL, NULL,
  '["https://www.property24.com/to-rent/kensington/cape-town/western-cape/8010/115498190", "https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-kensington-shopping-centre-avenue-kensington-cape-town-western-cape/21526"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-kensington-shopping-centre-kensington', 'PEP',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  (SELECT id FROM shopping_centers WHERE slug = 'kensington-shopping-centre-kensington'),
  'Shop 1, Kensington Shopping Centre, 27 12th Avenue, Kensington, Cape Town, 7405', '021 593 8261', NULL, NULL,
  'PEP is a value retailer selling clothing, footwear and household goods, in Kensington Shopping Centre, Kensington.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-kensington-shopping-centre-avenue-kensington-cape-town-western-cape/21526", "https://south-africa.searchinafrica.com/business/5980238/south-africa/western-cape/cape-town/kensington/twelveth-ave/clothing-retailers/departmental-stores/pep-stores"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-kensington-shopping-centre-kensington'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-kensington-shopping-centre-kensington', 'SPAR',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  (SELECT id FROM shopping_centers WHERE slug = 'kensington-shopping-centre-kensington'),
  'Shop 18, 27 12th Avenue, Kensington, Cape Town, 7405', '021 203 1786', NULL, NULL,
  'SPAR is a Halaal-certified supermarket in Kensington Shopping Centre, Kensington.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/spar-kensington-61426", "https://za.polomap.com/cape-town/85235"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-kensington-shopping-centre-kensington'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-candle-factory-shop-kensington', 'The Candle Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  'Unit 2, Clover Leaf Industrial Park, 79 8th Avenue, Kensington, Cape Town, 7405', '021 593 6307', NULL, NULL,
  'The Candle Factory Shop is a candle retailer and wholesaler in Kensington.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/the-candle-factory-shop-8th-ave-kensington,-cape-town?to=place.w.12125621.121321744.16078262", "https://za.top10place.com/the-candle-factory-shop-1460360909.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-candle-factory-shop-kensington'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
