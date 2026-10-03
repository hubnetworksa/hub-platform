INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mandy-knaap-physiotherapy-table-view', 'Mandy Knaap Physiotherapy',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  'Blaauwberg Therapy Centre, 103 Blaauwberg Road, Table View, Cape Town, 7441', '021 557 6066', NULL, NULL,
  'Mandy Knaap Physiotherapy is a physiotherapy practice offering initial assessments, treatment and rehabilitation, based at the Blaauwberg Therapy Centre in Table View.',
  NULL, NULL,
  '["https://magicpin.com/south-africa/Cape-Town/Tableview/Healthcare/Mandy-Knaap-Physiotherapy/store/23a6bc8", "https://discover.bookem.com/business/mkphysio"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mandy-knaap-physiotherapy-table-view'),
  (SELECT id FROM categories WHERE slug = 'physiotherapists'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'medicross-table-view-table-view', 'Medicross Table View',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  '97 Blaauwberg Road, Table View, Cape Town', '021 521 1000', NULL, NULL,
  'Medicross Table View is a medical and dental clinic offering general practice and nursing services, on Blaauwberg Road in Table View.',
  NULL, NULL,
  '["https://recomed.co.za/medicross-clinic/table-view/medicross-table-view---gp/7780", "https://magicpin.com/south-africa/Cape-Town/Tableview/Healthcare/Netcare-Medicross-Tableview/store/2335613/reviews"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medicross-table-view-table-view'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
