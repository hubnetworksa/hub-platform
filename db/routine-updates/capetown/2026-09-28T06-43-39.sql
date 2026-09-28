INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capitec-bank-the-junxion-mall-philippi', 'Capitec Bank', (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 42, The Junxion Mall, Cnr Govan Mbeki & New Eisleben Roads, Philippi, Cape Town, 7785', '021 371 0678', NULL, NULL,
  'Capitec Bank is a retail bank branch, in The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/Banks/Capitec_Bank_Philippi/4923", "https://jamii.co.za/6429-philippi-banking-forex-capitec-bank-junxion-mall"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capitec-bank-the-junxion-mall-philippi'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nedbank-the-junxion-mall-philippi', 'Nedbank', (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 59, The Junxion Mall, Cnr Govan Mbeki and New Eisleben Roads, Philippi, Cape Town, 7785', '021 370 3060', NULL, NULL,
  'Nedbank is a retail bank branch, in The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://www.jamii.co.za/6431-philippi-banking-forex-nedbank-philippi-junxion-mall", "https://nedbank.banklocationmaps.com/en/branch/956857-nedbank-branch-shop-59-the-junxion-mall-cnr-govan-mbeki-and-eisleben-roads"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nedbank-the-junxion-mall-philippi'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dunns-philippi-shopping-centre-philippi', 'Dunns', (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'philippi-shopping-centre-philippi'),
  'Shop 14, Philippi Shopping Centre, Cnr Eisleben & Lansdowne Rd, Philippi, Cape Town, 7750', '021 372 5568', 'http://www.dunns.co.za/', NULL,
  'Dunns is a fashion retailer selling ladies wear, menswear, footwear, accessories and cellular products, in Philippi Shopping Centre, Philippi.',
  NULL, NULL,
  '["https://finderafrica.com/listing/dunns-philippi-shopping-centre/", "https://www.facebook.com/DunnsPhilippi/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dunns-philippi-shopping-centre-philippi'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
