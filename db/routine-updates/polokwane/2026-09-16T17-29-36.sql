INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mankweng-midas-mankweng', 'Mankweng Midas',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  (SELECT id FROM shopping_centers WHERE slug = 'paledi-mall-mankweng'),
  'Shop 39, Paledi Mall, R71, Mankweng, Polokwane, 0727', '015 267 7557', NULL, NULL,
  'Mankweng Midas is a Midas-branded automotive spares and accessories retailer inside Paledi Mall, Mankweng.',
  NULL, NULL,
  '["https://sabusinesslistings.co.za/listings/mankweng-midas-2/", "https://www.brabys.com/za/limpopo/sovenga/mankweng/motor-spares-accessories/mankweng-midas"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mankweng-midas-mankweng'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-fix-paledi-mall-mankweng', 'The Fix Paledi Mall',
  (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  (SELECT id FROM shopping_centers WHERE slug = 'paledi-mall-mankweng'),
  'Shop 69, Paledi Mall, R71, Mankweng, Polokwane, 0727', '015 286 0509', NULL, NULL,
  'The Fix is a Foschini Group fashion and clothing retailer inside Paledi Mall, Mankweng.',
  NULL, NULL,
  '["https://south-africa.searchinafrica.com/business/6121125/south-africa/limpopo/sovenga/mankweng/r71/clothing-retailers/the-fix", "https://saypro.online/saypro-the-fix-shop-69-paledi-mall-1-r71-mankweng-sovenga-%C2%B7-015-286-0509/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-fix-paledi-mall-mankweng'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
