INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nedbank-paledi-mall-mankweng', 'Nedbank Paledi Mall',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  (SELECT id FROM shopping_centers WHERE slug = 'paledi-mall-mankweng'),
  'Shop 9, Twin City Paledi Shopping Centre, Main Road, Mankweng, 0727', '015 286 0100', NULL, NULL,
  'Nedbank Paledi Mall is a bank branch offering everyday banking services to residents of Mankweng, inside Paledi Mall.',
  NULL, NULL,
  '["https://nedbank.banklocationmaps.com/en/branch/935957-nedbank-branch-shop-9-twin-city-paledi-shopping-centre-main-road", "https://bankcodesfinder.com/south-africa-bank-branch-codes/nedbank_limited/paledi"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nedbank-paledi-mall-mankweng'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);
