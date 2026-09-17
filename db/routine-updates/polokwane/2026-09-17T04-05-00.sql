INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tops-at-spar-paledi-mankweng', 'TOPS at SPAR Paledi',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  (SELECT id FROM shopping_centers WHERE slug = 'paledi-mall-mankweng'),
  'Shop 30, Paledi Mall, R71, Ga Thoka, Mankweng, Polokwane, 0727', '015 590 0641', NULL, NULL,
  'TOPS at SPAR Paledi is a liquor store attached to SuperSpar Paledi, stocking beer, wine and spirits, in Paledi Mall, Mankweng.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/tops-at-spar-paledi-23858436.html", "https://hombaze.co.za/tops-at-spar-paledi-17560542497239592485/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tops-at-spar-paledi-mankweng'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);
