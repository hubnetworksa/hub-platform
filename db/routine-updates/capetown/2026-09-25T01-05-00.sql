INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sa-dairy-factory-shop-boston', 'SA Dairy Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'boston'),
  '33 Northumberland Road, Boston, Bellville, Cape Town, 7530', '021 905 7955', NULL, 'infonorthumberland@sadairyfactoryshop.co.za',
  'SA Dairy Factory Shop is a factory outlet selling dairy products and beverages at discounted retail and wholesale prices, in Boston, Bellville.',
  NULL, NULL,
  '["https://www.facebook.com/SaDairyFactoryShopBellville/", "https://www.factoryshopssa.co.za/directory/sa-dairy-factory-shop/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sa-dairy-factory-shop-boston'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jackys-chinese-restaurant-bothasig', "Jacky's Chinese Restaurant",
  (SELECT id FROM suburbs WHERE slug = 'bothasig'),
  (SELECT id FROM shopping_centers WHERE slug = 'bothasig-square-bothasig'),
  'Bothasig Square, Cnr Vryburger Avenue & Tafelberg Street, Bothasig, Cape Town, 7441', '021 558 4860', NULL, NULL,
  "Jacky's Chinese Restaurant is a Chinese and sushi buffet and takeaway restaurant in Bothasig Square, Bothasig.",
  NULL, NULL,
  '["https://www.facebook.com/p/Jackys-Chinese-Restaurant-100066840572784/", "https://www.dining-out.co.za/md-menu/Jackys-Chinese-Restaurant/6373"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jackys-chinese-restaurant-bothasig'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vida-e-caffe-edgemead', 'Vida e Caffe',
  (SELECT id FROM suburbs WHERE slug = 'edgemead'),
  (SELECT id FROM shopping_centers WHERE slug = 'edgemead-village-centre-edgemead'),
  'Shop 10, Edgemead Village Centre, Letchworth Drive, Edgemead, Cape Town, 7441', '021 461 0424', NULL, NULL,
  'Vida e Caffe is a coffee shop serving espresso-based coffee and light meals, in Edgemead Village Centre, Edgemead.',
  NULL, NULL,
  '["https://www.facebook.com/EdgemeadVillageCentre/", "https://za.africabz.com/western-cape/vida-e-caffe-edgemead-village-445093"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vida-e-caffe-edgemead'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
