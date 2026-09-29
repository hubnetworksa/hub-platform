-- Jobs 1-2: suburb research -- capri-village, clovelly, dennendal
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'c4-ecosolutions-dennendal', 'C4 EcoSolutions',
  (SELECT id FROM suburbs WHERE slug = 'dennendal'),
  '18 Gerrie Ave, Dennendal, Cape Town, 7945', '021 715 1560', 'http://www.c4es.co.za/', NULL,
  'C4 EcoSolutions is an environmental and sustainability consulting firm, in Dennendal.',
  NULL, NULL,
  '["https://www.ecohubmap.com/company/business/c4-ecosolutions/bb1lmlbouarvm", "https://hombaze.co.za/c4-ecosolutions-8494938831676542641/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'c4-ecosolutions-dennendal'),
  (SELECT id FROM categories WHERE slug = 'business-consulting'),
  1
);
