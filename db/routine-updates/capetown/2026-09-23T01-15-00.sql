-- Jobs 1-2: suburb research for delft, philippi, lansdowne

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cashbuild-delft-mall-delft', 'Cashbuild',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop V1, Delft Mall, Delft Main Road, Delft, Cape Town, 7100', '021 271 0197', NULL, NULL,
  'Cashbuild is a building materials and hardware retailer trading from Shop V1 in Delft Mall, Delft.',
  NULL, NULL,
  '["https://locations.cashbuild.co.za/Retail-DelftMall-CashbuildDelft", "https://za.africabz.com/western-cape/cashbuild-368376"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cashbuild-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hungry-lion-delft-mall-delft', 'Hungry Lion',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  (SELECT id FROM shopping_centers WHERE slug = 'delft-mall-delft'),
  'Shop 14, Delft Mall, Hindle Road, Delft, Cape Town, 7100', '021 955 0120', NULL, NULL,
  'Hungry Lion is a fast-food restaurant serving fried chicken from Shop 14 in Delft Mall, Delft.',
  NULL, NULL,
  '["https://www.hungrylion.co.za/delft/", "https://www.tripadvisor.in/Restaurant_Review-g1722390-d23749311-Reviews-Hungry_Lion_Delft-Cape_Town_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hungry-lion-delft-mall-delft'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'truworths-the-junxion-mall-philippi', 'Truworths',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 87, The Junxion Mall, Cnr Govan Mbeki & New Eisleben Roads, Philippi, Cape Town, 7785', '081 171 1446', NULL, NULL,
  'Truworths is a fashion and clothing retailer trading from Shop 87 in The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://jamii.co.za/7002-philippi-clothing-fashion-truworths-philippi-junxion-mall", "http://www.thejunxionmall.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'truworths-the-junxion-mall-philippi'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'totalsports-the-junxion-mall-philippi', 'Totalsports',
  (SELECT id FROM suburbs WHERE slug = 'philippi'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-junxion-mall-philippi'),
  'Shop 57, The Junxion Mall, Cnr Govan Mbeki & New Eisleben Roads, Philippi, Cape Town, 7785', '021 370 5506', NULL, NULL,
  'Totalsports is a sports and lifestyle retailer trading from Shop 57 in The Junxion Mall, Philippi.',
  NULL, NULL,
  '["https://www.jamii.co.za/totalsports-phillipi-junxion-mall-philippi-east", "http://www.thejunxionmall.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'totalsports-the-junxion-mall-philippi'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'big-boy-crockery-lansdowne', 'Big Boy Crockery',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  '355 Imam Haron Road, Lansdowne, Cape Town, 7780', '021 696 8445', NULL, NULL,
  'Big Boy Crockery is a crockery and homeware store on Imam Haron Road in Lansdowne.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/big-boy-crockery-77777", "https://www.facebook.com/bigboycrockery/posts/big_boy_crockery355-imam-haron-rd-lansdowne-%EF%B8%8Ftel-0216968445-dm-for-more-info-wha/444172396192699/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'big-boy-crockery-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
