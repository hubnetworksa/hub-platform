INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'r-and-g-meat-supplier-dalmada', 'R and G Meat Supplier',
  (SELECT id FROM suburbs WHERE slug = 'dalmada'),
  'Plot 37 Dalmada, R71 Road, next to Dalmada Filling Station, Dalmada, Polokwane, 0699', '015 001 0862', NULL, NULL,
  'R and G Meat Supplier is a meat supplier trading from Plot 37 Dalmada, next to the Dalmada Filling Station on the R71, in Dalmada.',
  NULL, NULL,
  '["https://www.facebook.com/randgmeatsupply/", "https://vymaps.com/ZA/R-and-G-Meat-Supplier-113777366899829/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'r-and-g-meat-supplier-dalmada'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ingwe-waste-management-dalmada', 'Ingwe Waste Management',
  (SELECT id FROM suburbs WHERE slug = 'dalmada'),
  'Plot 6 Geluk, Dalmada, Polokwane, 0699', '015 297 3512', 'https://www.ingwewaste.co.za/', NULL,
  'Ingwe Waste Management is a Black-owned waste management company based in Dalmada, providing waste collection and disposal solutions for households, businesses and industry across the region.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/ingwe-waste-management", "https://www.thinklocal.co.za/biz/ingwe-waste-management-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ingwe-waste-management-dalmada'),
  (SELECT id FROM categories WHERE slug = 'rubbish-rubble-removal'),
  1
);
