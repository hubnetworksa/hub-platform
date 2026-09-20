INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'honchos-mankweng', 'Honchos', (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  (SELECT id FROM shopping_centers WHERE slug = 'paledi-mall-mankweng'),
  'Shop 79A and B, Paledi Mall, R71, Mankweng, 0727', '+27 71 222 2132', NULL, NULL,
  'Honchos is a halaal flame-grilled chicken and chips restaurant in Paledi Mall, Mankweng.',
  NULL, NULL,
  '["https://honchos.co.za/stores/", "https://sanha.org.za/certified-establishmen/listing/honchos-67/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'honchos-mankweng'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capitec-bank-turfloop-plaza-mankweng', 'Capitec Bank Turfloop Plaza', (SELECT id FROM suburbs WHERE slug = 'mankweng'),
  (SELECT id FROM shopping_centers WHERE slug = 'turfloop-plaza-mankweng'),
  'Shop 7, Turfloop Plaza, University Road, Mankweng, Polokwane, 0727', '0860 102 043', NULL, NULL,
  'Capitec Bank is a bank branch in Turfloop Plaza, Mankweng.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/Banks/Capitec_Bank_Mankweng/5102", "https://vymaps.com/ZA/Capitec-Bank-79858/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capitec-bank-turfloop-plaza-mankweng'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);
