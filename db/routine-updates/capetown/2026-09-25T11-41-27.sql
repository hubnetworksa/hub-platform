INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-delft-mall-delft', 'Shoprite Delft Mall',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Cnr Hindle Rd & Delft Main Road, Delft Mall, Delft, Cape Town, 7100', '021 955 9160', NULL, NULL,
  'Shoprite Delft Mall is a supermarket offering groceries, fresh produce and everyday essentials, in Delft Mall, Delft.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Shoprite-Delft/store-details/34817", "https://southafricafirm.com/western-cape/shoprite-delft-37679"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
