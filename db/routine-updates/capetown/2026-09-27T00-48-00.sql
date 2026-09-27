INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tops-at-spar-woodstock-quarter-woodstock', 'TOPS at SPAR Woodstock Quarter',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  (SELECT id FROM shopping_centers WHERE slug = 'woodstock-quarter-woodstock'),
  'Woodstock Quarter, 187 Sir Lowry Road, Woodstock, Cape Town', '021 206 0835', NULL, NULL,
  'TOPS at SPAR Woodstock Quarter is a liquor store in Woodstock Quarter, Woodstock.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/646141d43cd6ac2678baba316bde6c37/tops-at-spar-woodstock-quarter/cape-town/food-beverages", "https://www.cylex.net.za/company/tops-at-spar-woodstock-quarter-23862003.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tops-at-spar-woodstock-quarter-woodstock'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);
