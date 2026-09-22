INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'autozone-lebowakgomo', 'AutoZone Lebowakgomo',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  'Shop No. 6, Cash Build Centre, Corner Jane Furse & Zebediela Roads, Lebowakgomo, 0737', '015 633 7100', NULL, NULL,
  'AutoZone Lebowakgomo is a motor spares and vehicle accessories retailer at the corner of Jane Furse and Zebediela Roads, Lebowakgomo.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/lebowakgomo/autozone-cash-build-centre-shop-no-corner-jane-furse-zebediela-roads/10692", "https://autozone.co.za/autozone-store/lebowakgomo-autozone/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'autozone-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);
