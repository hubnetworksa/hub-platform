INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-seshego-circle-seshego', 'PEP Seshego Circle',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  (SELECT id FROM shopping_centers WHERE slug = 'seshego-circle-seshego'),
  'Shop 8, Seshego Circle Shopping Centre, Ditlou Street, Seshego, Polokwane, 0742', '015 223 5934', NULL, NULL,
  'PEP Seshego Circle is a clothing and homeware discount retailer, in Seshego Circle Shopping Centre, Seshego.',
  NULL, NULL,
  '["https://za.polomap.com/polokwane/2950", "https://dir.alltrack.org/view/398403-2-pep"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-seshego-circle-seshego'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-cell-seshego-circle-seshego', 'PEP Cell Seshego Circle',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  (SELECT id FROM shopping_centers WHERE slug = 'seshego-circle-seshego'),
  'Shop 12, Seshego Circle Shopping Centre, Ditlou Street, Seshego, Polokwane, 0742', '015 223 5937', NULL, NULL,
  'PEP Cell Seshego Circle is a mobile phone and accessories retailer, in Seshego Circle Shopping Centre, Seshego.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/polokwane/pep-cell-shop-seshego-circle-ditlou-street/71273", "https://nearbyza.com/place/pep-cell-147"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-cell-seshego-circle-seshego'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fnb-seshego-circle-seshego', 'FNB Seshego Circle',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  (SELECT id FROM shopping_centers WHERE slug = 'seshego-circle-seshego'),
  'Seshego Circle Shopping Centre, Cnr Nelson Mandela Drive & Polokwane Drive, Seshego, Polokwane, 0742', '087 345 1150', NULL, NULL,
  'FNB Seshego Circle is a First National Bank branch offering everyday banking services, in Seshego Circle Shopping Centre, Seshego.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/bd386d93c06ecbce6b7fc01a2a371df2/fnb-seshego-circle/polokwane/banking-services", "https://www.cylex.net.za/company/fnb-seshego-circle-23842169.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fnb-seshego-circle-seshego'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);
