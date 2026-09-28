INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-turfloop-plaza-mankweng', 'Mr Price Mankweng Turfloop Plaza',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  (SELECT id FROM shopping_centers WHERE slug = 'turfloop-plaza-mankweng'),
  'Shop 03, Turfloop Plaza, University Road, Mankweng, 0727', '0800 212 535', 'https://www.mrp.com/en_za/store/mr-price-mankweng-turfloop-plaza', NULL,
  'Mr Price Mankweng Turfloop Plaza is a fashion and clothing retailer inside Turfloop Plaza, Mankweng.',
  NULL, NULL,
  '["https://www.mrp.com/en_za/store/mr-price-mankweng-turfloop-plaza", "https://mapcarta.com/N2165101213"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-price-turfloop-plaza-mankweng'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
