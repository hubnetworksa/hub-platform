INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'agrimark-philippi', 'Agrimark Philippi',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  '10 Olieboom Road, Philippi, Cape Town, 7785', '021 703 1121', 'https://www.agrimark.co.za/store/agrimark-philippi', NULL,
  'Agrimark Philippi is an agricultural and farming supplies store on Olieboom Road, serving the local farming community and businesses with diesel, building materials, gardening supplies and other essentials.',
  NULL, NULL,
  '["https://www.agrimark.co.za/store/agrimark-philippi", "https://www.cybo.com/ZA-biz/agrimark-philippi"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'agrimark-philippi'),
  (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'philippi-kitchen-and-hardware-philippi', 'Philippi Kitchen and Hardware',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'philippi-shopping-centre-philippi'),
  'Cnr Eisleben Road & Lansdowne Road, Philippi, Cape Town, 7785', '021 371 2917', NULL, NULL,
  'Philippi Kitchen and Hardware is a hardware store on the corner of Eisleben and Lansdowne Roads in Philippi.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/529535/philippi-kitchenhardware", "https://www.callupcontact.com/b/business/Philippi_Kitchen_And_Hardware/148449"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'philippi-kitchen-and-hardware-philippi'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-the-junction-mall-philippi', 'KFC The Junction Mall',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 00, The Junxion Mall, Cnr Govan Mbeki & New Eisleben Roads, Philippi, Cape Town, 7750', '021 372 0190', NULL, NULL,
  'KFC The Junction Mall is a branch of the KFC fast-food chain, inside The Junxion Mall in Philippi.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/kfc-philippi-junction-mall-287022", "https://order.kfc.co.za/restaurants/kfc-phillipi-junction-mall/7750"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-the-junction-mall-philippi'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sheet-street-the-junction-mall-philippi', 'Sheet Street The Junction Mall',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 9, The Junxion Mall, Cnr Eisleben & Govan Mbeki Roads, Philippi, Cape Town, 7750', '087 754 5294', 'https://www.sheetstreet.com/sheet-street-philippi-the-junction-30558', NULL,
  'Sheet Street The Junction Mall is a branch of the Sheet Street homeware and clothing chain, inside The Junxion Mall in Philippi.',
  NULL, NULL,
  '["https://www.sheetstreet.com/sheet-street-philippi-the-junction-30558", "https://www.tiendeo.co.za/stores/cape-town/sheet-street-shop-the-junction-mall-bounded-by-eisleben-and-govan-mbeki-roads-philippi/65901"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sheet-street-the-junction-mall-philippi'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
