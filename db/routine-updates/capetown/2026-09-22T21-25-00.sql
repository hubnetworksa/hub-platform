INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'langa-junction-langa', 'Langa Junction',
  (SELECT id FROM suburbs WHERE slug = 'langa'),
  'Brinton Street, Langa, Cape Town, 7455', NULL, NULL,
  '["https://www.shoprite.co.za/store-directory-and-leaflets/store-details/50877", "https://za.africabz.com/western-cape/shoprite-langa-177853"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-langa-junction-langa', 'Shoprite Langa Junction',
  (SELECT id FROM suburbs WHERE slug = 'langa'),
  (SELECT id FROM shopping_centers WHERE slug = 'langa-junction-langa'),
  'Brinton Street, Langa Junction, Langa, Cape Town, 7455', '021 695 8540', NULL, NULL,
  'Shoprite Langa Junction is a branch of the national supermarket chain, in Langa Junction.',
  NULL, NULL,
  '["https://www.shoprite.co.za/store-directory-and-leaflets/store-details/50877", "https://za.africabz.com/western-cape/shoprite-langa-177853"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-langa-junction-langa'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
