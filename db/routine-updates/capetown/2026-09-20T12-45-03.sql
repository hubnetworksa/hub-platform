INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'steenberg-centre-steenberg', 'Steenberg Centre',
  (SELECT id FROM suburbs WHERE slug = 'steenberg'),
  'Military Road, Steenberg, Cape Town', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/steenberg-centre.html", "https://www.anvilproperty.co.za/commercial-property/retail/to-rent/steenberg/shoprite-centre-steenberg-26672"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-steenberg-steenberg', 'Shoprite Steenberg',
  (SELECT id FROM suburbs WHERE slug = 'steenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'steenberg-centre-steenberg'),
  'Shop 7, Steenberg Centre, Military Road, Steenberg, Cape Town', '021 702 8260', NULL, NULL,
  'Shoprite Steenberg is a supermarket, the anchor tenant of Steenberg Centre on Military Road.',
  NULL, NULL,
  '["https://sabusinesslistings.co.za/listings/shoprite-steenberg/", "https://www.cybo.com/ZA-biz/shoprite-steenberg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-steenberg-steenberg'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
