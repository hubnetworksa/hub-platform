INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-westlake', 'Checkers',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  (SELECT id FROM shopping_centers WHERE slug = 'westlake-shopping-centre-westlake'),
  'Shop 1, Westlake Lifestyle Centre, Westlake Drive, Westlake, Cape Town, 7945', '021 784 0100', NULL, NULL,
  'Checkers is a supermarket anchor tenant of Westlake Shopping Centre, Westlake.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/checkers-shop-westlake-lifestyle-centre-westlake-drive/49412", "https://my-catalogue.co.za/stores/cape-town/checkers/shop-1-westlake-lifestyle-centre-westlake"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-westlake'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'virgin-active-steenberg-steenberg', 'Virgin Active Steenberg',
  (SELECT id FROM suburbs WHERE slug = 'steenberg'),
  'Otto Close, Westlake Business Park, Steenberg, Cape Town, 7945', '021 702 0268', 'https://www.virginactive.co.za/gyms/steenberg', NULL,
  'Virgin Active Steenberg is a health and fitness gym in Westlake Business Park, Steenberg.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/virgin-active-steenberg-26206", "https://za.gymcity.info/virgin-active-steenberg-1544438"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'virgin-active-steenberg-steenberg'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
