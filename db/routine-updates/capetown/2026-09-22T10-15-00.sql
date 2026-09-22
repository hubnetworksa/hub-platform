-- Jobs 1-2: Edgemead suburb research
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'edgemead-shopping-centre-edgemead', 'Edgemead Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  'Louis Thibault Street, Edgemead, Cape Town, 7441', NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=214892", "https://dentisthub.co.za/payne-louw-incorporated/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'payne-louw-incorporated-edgemead', 'Payne & Louw Incorporated',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  (SELECT id FROM shopping_centers WHERE slug = 'edgemead-shopping-centre-edgemead'),
  'Shop S2, Edgemead Shopping Centre, Louis Thibault Street, Edgemead, Cape Town, 7441', '021 558 2808', 'https://www.paynelouwdental.co.za/', NULL,
  'Payne & Louw Incorporated is a dental practice in Edgemead Shopping Centre, Edgemead.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=214892", "https://dentisthub.co.za/payne-louw-incorporated/", "https://www.paynelouwdental.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'payne-louw-incorporated-edgemead'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sa-power-edgemead', 'SA Power',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  'Unit B13, Edgemead Business Park, South Dale Road, Edgemead, Cape Town, 7441', '021 559 5339', 'https://sapower.co.za/', NULL,
  'SA Power is a factory and process automation specialist based in Edgemead Business Park, supplying machinery automation systems and equipment.',
  NULL, NULL,
  '["https://www.eeziads.co.za/p/503666/sa-power-service-western-cape", "https://sapower.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sa-power-edgemead'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
