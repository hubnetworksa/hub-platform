INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'african-bank-seshego-circle-seshego', 'African Bank Seshego Circle',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  (SELECT id FROM shopping_centers WHERE slug = 'seshego-circle-seshego'),
  'Shop 13, Seshego Circle Shopping Centre, Ditlou Street, Seshego, Polokwane, 0699', '015 223 5895', NULL, NULL,
  'African Bank Seshego Circle is a bank branch inside Seshego Circle shopping centre, Seshego.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/polokwane/african-bank", "https://polokwane.infoisinfo.co.za/card/african-bank/206761"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'african-bank-seshego-circle-seshego'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);
