-- Suburb: Westgate (Mitchells Plain) -- job 1/2 research
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-westgate-mall-westgate', 'KFC Westgate Mall',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Vanguard Drive, Corner Morgenster Road, Westgate Mall, Mitchells Plain, Cape Town, 7785', '021 371 2203', NULL, NULL,
  'KFC Westgate Mall is a fried chicken and fast food restaurant inside Westgate Mall in Mitchells Plain.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/mitchells-plain/vanguard-drive-corner-morgenster-road-mitchells-plain-cape-town", "https://order.kfc.co.za/restaurants/kfc-mitchell%60s-plain-westgate/7785"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-westgate-mall-westgate', 'Ackermans Westgate Mall',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Shop 45 & 46, Westgate Mall, Cnr Vanguard Drive & Morgenster Road, Mitchells Plain, Cape Town, 7785', '021 371 1709', NULL, NULL,
  'Ackermans Westgate Mall is a clothing retailer inside Westgate Mall in Mitchells Plain, stocking fashion for women, kids and babies.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/mitchells-plain/ackermans-shop-westgate-mallcn-vanguard-morgenster-road/15262", "https://za.africabz.com/western-cape/ackermans-mitchells-plain-westgate-179305"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
