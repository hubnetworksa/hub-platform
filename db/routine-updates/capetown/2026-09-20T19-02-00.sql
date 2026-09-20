INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'west-coast-personnel-table-view', 'West Coast Personnel',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  '254 Blaauwberg Rd, Table View, Cape Town, 7441', '021 556 2313', NULL, NULL,
  'West Coast Personnel is a recruitment and staffing agency on Blaauwberg Road in Table View.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/west-coast-personnel-38157", "https://www.yep.co.za/biz/store/iyp/6362178_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'west-coast-personnel-table-view'),
  (SELECT id FROM categories WHERE slug = 'recruitment-hr-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-carl-ensil-table-view-dental-studio-table-view', 'Dr Carl Ensil Table View Dental Studio Inc',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  'Unit 1, 145 Blaauwberg Rd, Table View, Cape Town, 7441', '021 556 1303', NULL, NULL,
  'Dr Carl Ensil Table View Dental Studio Inc is a general dental practice on Blaauwberg Road in Table View.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/dr-carl-ensil-table-view-dental-studio-inc-153754", "https://www.cybo.com/ZA-biz/dr-carl-ensil-table-view-dental-studio", "https://www.medpages.info/sf/index.php?page=person&personcode=144004"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-carl-ensil-table-view-dental-studio-table-view'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
