INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'station-plaza-mitchells-plain', 'Station Plaza',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  'Seventh Avenue, Mitchells Plain, Cape Town, 7785', NULL, NULL,
  '["https://stationplaza.co.za/shops/", "https://www.tiendeo.co.za/stores/mitchells-plain/lewis-shops-f-f-station-plaza-shopping-th-avenue-town-centre-mitchells-plain/65978"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'beta-kem-pharmacy-mitchells-plain', 'Beta-Kem Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  (SELECT id FROM shopping_centers WHERE slug = 'station-plaza-mitchells-plain'),
  'Station Plaza, Seventh Avenue, Mitchells Plain, Cape Town, 7785', '021 370 0009', NULL, NULL,
  'Beta-Kem Pharmacy is a retail pharmacy in Station Plaza, Mitchells Plain.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=1840499", "https://b2bhint.com/en/company/za/beta-kem-pharmacy--K2020686252"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'beta-kem-pharmacy-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mitchells-plain-oral-health-centre-mitchells-plain', 'Mitchells Plain Oral Health Centre',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  '6th Floor, Melomed Mitchells Plain, Symphony Walk, Mitchells Plain, Cape Town, 7785', '021 370 4400', NULL, NULL,
  'Mitchells Plain Oral Health Centre is a public dental clinic in Mitchells Plain, based at Melomed Mitchells Plain hospital.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/health-wellness/facility/mitchells-plain-oral-health-centre", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=148026"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mitchells-plain-oral-health-centre-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dalmans-discount-hardware-mitchells-plain', 'Dalmans Discount Hardware',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  'Cnr 10th Avenue & Bravo Street, Mitchells Plain, Cape Town, 7785', '021 376 2517', NULL, NULL,
  'Dalmans Discount Hardware is a hardware store in Mitchells Plain.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/dalmans-discount-hardware/187693", "https://www.africanadvice.com/1069813/Hardware_Stores/Western_Cape/Dalman''s_Discount_Hardware/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dalmans-discount-hardware-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
