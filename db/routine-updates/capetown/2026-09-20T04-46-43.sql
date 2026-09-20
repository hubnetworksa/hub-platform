-- Jobs 1-2: suburb research for blue-downs, browns-farm, colorado
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'blue-downs-shopping-centre-blue-downs', 'Blue Downs Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'blue-downs'),
  'Cnr Hindle Road & Eerste Rivier Way, Blue Downs, Cape Town, 7100', NULL, NULL,
  '["https://getoccupi.com/malls/blue-downs-regional-mall", "https://www.fpggroup.co.za/blue-downs/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-crusaders-blue-downs', 'Cash Crusaders Blue Downs',
  (SELECT id FROM suburbs WHERE slug = 'blue-downs'),
  (SELECT id FROM shopping_centers WHERE slug = 'blue-downs-shopping-centre-blue-downs'),
  'Shop 24, Blue Downs Shopping Centre, Cnr Hindle Road & Eerste Rivier Way, Blue Downs, Cape Town, 7100', '021 909 2333', NULL, NULL,
  'Cash Crusaders Blue Downs is a pawnbroking and secondhand goods store inside Blue Downs Shopping Centre, buying and selling used electronics, tools, jewellery and other secondhand items.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/blue-downs/cash-crusaders-shop-the-cavalier-shopping-centre-next-to-shoprite-corner-of-hindle-road-and-eerste-rivier-way/22145", "https://za.polomap.com/cape-town/66565"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-crusaders-blue-downs'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-blue-downs', 'Shoprite Blue Downs',
  (SELECT id FROM suburbs WHERE slug = 'blue-downs'),
  (SELECT id FROM shopping_centers WHERE slug = 'blue-downs-shopping-centre-blue-downs'),
  'Blue Downs Shopping Centre, Cnr Hindle Road & Eerste Rivier Way, Blue Downs, Cape Town, 7100', '021 909 9200', NULL, NULL,
  'Shoprite Blue Downs is a supermarket inside Blue Downs Shopping Centre, stocking groceries, fresh produce and household essentials.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/shoprite-26660", "https://www.callupcontact.com/b/Supermarkets/Shoprite_Blue_Downs/4765"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-blue-downs'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-blue-downs', 'PEP Blue Downs',
  (SELECT id FROM suburbs WHERE slug = 'blue-downs'),
  (SELECT id FROM shopping_centers WHERE slug = 'blue-downs-shopping-centre-blue-downs'),
  'Shop 18, Blue Downs Shopping Centre, Cnr Hindle Road & Eerste Rivier Way, Blue Downs, Cape Town, 7100', '021 909 1757', NULL, NULL,
  'PEP Blue Downs is a budget clothing, footwear and homeware store inside Blue Downs Shopping Centre.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-cavalier-retail-centre-cnr-hindle-road-eerste-river-way-blue-downs-cape-town-western-cape/12518", "https://www.sayellow.com/view/south-africa/pep-blue-downs-cavalier-retail-centre-in-blue-downs"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-blue-downs'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
