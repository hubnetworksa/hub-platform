-- Jobs 1-2: westgate suburb research, 2 new Westgate Mall tenants
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ok-furniture-westgate-mall-westgate', 'OK Furniture Westgate Mall',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Shop 1, Westgate Mall, Cnr Vanguard Drive & Morgenster Street, Mitchells Plain, Cape Town, 7785', '021 370 4720', NULL, NULL,
  'OK Furniture Westgate Mall is a furniture and appliance retailer in Westgate Mall, Mitchells Plain.',
  NULL, NULL,
  '["https://www.okfurniture.co.za/mitchells-plain-westgate-mall", "https://www.tiendeo.co.za/stores/Mitchells-Plain/ok-furniture-shop-westgate-mall-cnr-vanguard-drive-and-morgenster-street/41235"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ok-furniture-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sheet-street-westgate-mall-westgate', 'Sheet Street Westgate Mall',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Shop 47B, Westgate Mall, Cnr Morgenster & Vanguard Road, Mitchells Plain, Cape Town', '087 754 5295', NULL, NULL,
  'Sheet Street Westgate Mall is a home textiles and manchester retailer in Westgate Mall, Mitchells Plain.',
  NULL, NULL,
  '["https://www.sheetstreet.com/sheet-street-mitchells-plein-westgate-30559", "https://www.kimbino.co.za/stores/sheet-street-shop-47b-westgate-mall-cnr-morgenster-vanguard-rd/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sheet-street-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
