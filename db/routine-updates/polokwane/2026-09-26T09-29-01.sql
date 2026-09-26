INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fnb-atm-cycad-centre-bendor-park', 'FNB ATM Cycad Centre',
  (SELECT id FROM suburbs WHERE slug = 'bendor-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'cycad-centre-bendor-park'),
  'Outspan Drive, Cycad Centre, Bendor Ext 59, Polokwane, 0699', '087 575 9404', NULL, NULL,
  'A standalone FNB ATM inside Cycad Centre, Bendor Park.',
  NULL, NULL,
  '["https://za.near-place.com/fnb-atm-cycad-outspan-drive-bendor-ext-59-polokwane", "https://www.waze.com/live-map/directions/za/lp/polokwane/fnb-atm-@-cycad"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fnb-atm-cycad-centre-bendor-park'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);
