INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-delft', 'Shoprite',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Delft Mall, Corner Hindle & Delft Main Road, Delft, Cape Town, 7100', '021 955 9160', NULL, NULL,
  'Shoprite Delft is a supermarket inside Delft Mall, Delft.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Shoprite-Delft/store-details/34817", "https://southafricafirm.com/western-cape/shoprite-delft-37679"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-delft'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mcdonalds-delft', 'McDonald''s Delft',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Delft Mall, Cnr Hindle Rd and Delft Main Rd, Delft, Cape Town, 7100', '021 954 7097', NULL, NULL,
  'McDonald''s Delft is a fast-food restaurant with a drive-thru inside Delft Mall, Delft.',
  NULL, NULL,
  '["https://www.mcdonalds.co.za/location/mcdonalds-delft", "https://restaurantguru.com/McDonalds-Delft-Cape-Town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mcdonalds-delft'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'freshstop-delft', 'FreshStop Delft',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  'Cnr Main Road & Vuurlelie Crescent, Roosendal, Delft, Cape Town, 7100', '021 956 4437', NULL, NULL,
  'FreshStop Delft is a convenience store at the Caltex service station on the corner of Main Road and Vuurlelie Crescent, Delft.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/freshstop-at-caltex-delft-353121", "https://www.waze.com/live-map/directions/za/wc/cape-town/freshstop-delft"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'freshstop-delft'),
  (SELECT id FROM categories WHERE slug = 'convenience-stores'),
  1
);
