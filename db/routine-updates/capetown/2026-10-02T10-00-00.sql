INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'african-bank-eerste-river-eerste-river', 'African Bank Eerste River',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  '8 Plein Street, Eerste River, Cape Town, 7100', '021 902 0744', NULL, NULL,
  'African Bank Eerste River is a bank branch on Plein Street, Eerste River.',
  NULL, NULL,
  '["https://www.southafricabusinessdirectory.co.za/company/ca23723e02f916e5e7d3fe6f95db7448/african-bank-eerste-river/cape-town/banking-services", "https://vymaps.com/ZA/African-Bank-153728/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'african-bank-eerste-river-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);
