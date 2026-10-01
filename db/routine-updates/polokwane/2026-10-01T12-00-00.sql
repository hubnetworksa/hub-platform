INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'f-and-r-frozen-superbia', 'F and R Frozen',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '24 Rupee Avenue, Superbia, Polokwane', '015 292 6838', NULL, NULL,
  'F and R Frozen is a frozen foods supplier, in Superbia.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/superbia/frozen-foods/f-and-r-frozen-pty-ltd", "https://www.dnb.com/business-directory/company-profiles/f-and-r-frozen-(pty)-ltd.21a17424b81dd2d7bbd3e3395ea685fb"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'f-and-r-frozen-superbia'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
