INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'village-walk-hazelwood', 'Village Walk',
  (SELECT id FROM suburbs WHERE slug = 'hazelwood'),
  'Oaktree Avenue, Hazelwood, Pretoria, 0081', NULL, NULL,
  '["https://www.atterbury.co.za/village-walk/", "https://propertywheel.co.za/2023/11/atterbury-unveils-village-walk-in-pretoria-east/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'doppio-zero-hazelwood-hazelwood', 'Doppio Zero Hazelwood',
  (SELECT id FROM suburbs WHERE slug = 'hazelwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'village-walk-hazelwood'),
  '24 Oaktree Avenue, Hazelwood, Pretoria, 0081', '061 516 1253', NULL, NULL,
  'Doppio Zero Hazelwood is a branch of the wood-fired pizza and Italian-inspired restaurant chain, located in Village Walk, Hazelwood.',
  NULL, NULL,
  '["https://doppio.co.za/restaurant/hazelwood/", "https://www.tripadvisor.in/Restaurant_Review-g312583-d34256500-Reviews-Doppio_Zero_Hazelwood-Pretoria_Gauteng.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'doppio-zero-hazelwood-hazelwood'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'firwood-lodge-hazelwood', 'Firwood Lodge',
  (SELECT id FROM suburbs WHERE slug = 'hazelwood'),
  '15 Firwood Avenue, Hazelwood, Pretoria, 0081', '012 346 1526', 'https://firwoodlodge.com', NULL,
  'Firwood Lodge is a 4-star guesthouse in Hazelwood offering air-conditioned rooms with fully equipped kitchens, a swimming pool and secure parking.',
  NULL, NULL,
  '["https://firwoodlodge.com/", "https://www.sa-venues.com/visit/firwoodlodge/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'firwood-lodge-hazelwood'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
