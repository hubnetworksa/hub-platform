INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'boxer-superstores-the-junxion-mall-philippi', 'Boxer Superstores',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 13, The Junxion Mall, Cnr Govan Mbeki & New Eisleben Roads, Philippi, Cape Town, 7785', '087 153 2240', NULL, NULL,
  'Boxer Superstores is a discount supermarket offering groceries, household goods and everyday essentials, in The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://www.facebook.com/p/Boxer-Superstores-Philippi-Branch-335-Junxion-Mall-Cape-Town-61556933084596/", "https://www.jamii.co.za/6435-philippi-supermakets-retailers-boxer-superstores"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'boxer-superstores-the-junxion-mall-philippi'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ok-furniture-the-junxion-mall-philippi', 'OK Furniture',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 20, The Junxion Mall, Cnr Govan Mbeki & New Eisleben Roads, Philippi, Cape Town, 7785', '021 370 2240', NULL, NULL,
  'OK Furniture is a furniture and homeware retailer offering household furniture, appliances and electronics on credit, in The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://www.okfurniture.co.za/philippi", "https://www.jamii.co.za/6928-philippi-furniture-homeware-decor-ok-furniture-philippi-junxion-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ok-furniture-the-junxion-mall-philippi'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-cell-the-junxion-mall-philippi', 'PEP Cell',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 6, The Junxion Mall, Cnr Govan Mbeki & New Eisleben Roads, Philippi, Cape Town, 7785', '021 371 6697', NULL, NULL,
  'PEP Cell is a cellphone and accessories retailer offering affordable mobile phones, airtime and tech accessories, in The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-cell-shop-the-junxion-mall-corner-new-eisleben-govan-mbeki-road/71250", "https://www.jamii.co.za/6930-philippi-cellular-sales-services-pep-cell-philippi-junxion-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-cell-the-junxion-mall-philippi'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);
