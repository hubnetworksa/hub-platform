INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rite-price-supermarket-lavender-hill', 'Rite Price Supermarket',
  (SELECT id FROM suburbs WHERE slug = 'lavender-hill'),
  'Hek Street, Lavender Hill, Steenberg, 7945', '021 701 2897', NULL, NULL,
  'Rite Price Supermarket is a grocery store in Lavender Hill, Cape Town.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/3473961_2", "https://south-africa-streets.openalfa.com/lavender-hill"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rite-price-supermarket-lavender-hill'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
