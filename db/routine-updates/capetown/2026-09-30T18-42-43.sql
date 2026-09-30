INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bradlows-the-junxion-mall-philippi', 'Bradlows',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 96, The Junxion Mall, Cnr Govan Mbeki & New Eisleben Roads, Philippi East, Cape Town, 7785', '021 133 0125', NULL, NULL,
  'Bradlows is a furniture and homeware store, in The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://www.jamii.co.za/6977-philippi-furniture-store-bradlows-philippi-junxion-mall", "https://rsa.worldorgs.com/catalog/cape-town/furniture-store/bradlows-philippi-junction"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bradlows-the-junxion-mall-philippi'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clothing-junction-the-junxion-mall-philippi', 'Clothing Junction',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 04, The Junxion Mall, Cnr Govan Mbeki & New Eisleben Roads, Philippi East, Cape Town, 7785', '063 331 3566', NULL, NULL,
  'Clothing Junction is a fashion and clothing store, in The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://www.jamii.co.za/clothing-junction-philippi-junxion-mall-philippi-east", "https://clothingjunction.co.za/pages/store-locator-1"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clothing-junction-the-junxion-mall-philippi'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tekkie-town-the-junxion-mall-philippi', 'Tekkie Town',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 08, The Junxion Mall, Cnr Govan Mbeki & New Eisleben Roads, Philippi East, Cape Town, 7785', '087 150 5334', NULL, NULL,
  'Tekkie Town is a footwear store, in The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://www.jamii.co.za/7047-philippi-footwear-tekkie-town-phillipi-junxion-mall", "https://tekkietown.co.za/pages/store-locator"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tekkie-town-the-junxion-mall-philippi'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);
