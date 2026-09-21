INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lwandle-migrant-labour-museum-lwandle', 'Lwandle Migrant Labour Museum',
  (SELECT id FROM suburbs WHERE slug = 'lwandle'),
  'Old Community Hall, Vulindlela Street, Lwandle, 7140', '021 845 6119', NULL, NULL,
  'Lwandle Migrant Labour Museum is a heritage museum in the Old Community Hall on Vulindlela Street, telling the history of migrant labour and hostel life in Lwandle.',
  NULL, NULL,
  '["https://lwandlemuseum.co.za/contact-us/", "https://d7.westerncape.gov.za/facility/lwandle-migrant-labour-museum"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lwandle-migrant-labour-museum-lwandle'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);
