INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-family-philippi', 'Pick n Pay Family Philippi',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 00, The Junxion Mall, Cnr Govan Mbeki & New Eisleben Roads, Philippi East, Cape Town, 7785', '021 224 0249', NULL, NULL,
  'Pick n Pay Family Philippi is a supermarket inside The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://www.jamii.co.za/pick-n-pay-family-philippi-junxion-mall-philippi-east", "https://www.jamii.co.za/6408-philippi-supermaket-pick-n-pay-family-philippi-junxion-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-family-philippi'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'boxer-philippi', 'Boxer Superstores Philippi',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 13, The Junxion Mall, Cnr Govan Mbeki & New Eisleben Roads, Philippi East, Cape Town, 7785', '087 153 2240', NULL, NULL,
  'Boxer Superstores Philippi is a discount supermarket inside The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://www.facebook.com/p/Boxer-Superstores-Philippi-Branch-335-Junxion-Mall-Cape-Town-61556933084596/", "https://www.jamii.co.za/6435-philippi-supermaket-boxer-superstores-junxion-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'boxer-philippi'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mcdonalds-the-junxion-philippi', 'McDonald''s The Junxion',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Cnr Govan Mbeki & New Eisleben Road, The Junxion Mall, Philippi, Cape Town, 7750', '021 370 0380', NULL, NULL,
  'McDonald''s The Junxion is a fast-food restaurant inside The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://www.mcdonalds.co.za/location/mcdonalds-the-junxion", "https://www.jamii.co.za/6982-philippi-restaurant-mcdonalds-drive-thru"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mcdonalds-the-junxion-philippi'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
