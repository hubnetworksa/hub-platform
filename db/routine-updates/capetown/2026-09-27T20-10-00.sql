INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-local-boston-boston', 'Pick n Pay Local Boston',
  (SELECT id FROM suburbs WHERE slug = 'boston'),
  '45 Twelfth Avenue, Boston, Bellville, Cape Town, 7530', '021 948 2692', 'https://www.picknpay.co.za', NULL,
  'Pick n Pay Local Boston is a neighbourhood supermarket on Twelfth Avenue in Boston, Bellville.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/bellville/pick-n-pay-local/45-12th-avenue-boston", "https://www.yellosa.co.za/company/484076/pick-n-pay-family-store-boston"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-local-boston-boston'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
