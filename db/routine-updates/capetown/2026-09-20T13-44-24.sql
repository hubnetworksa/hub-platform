INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-westgate-mall-westgate', 'Woolworths Westgate Mall',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Westgate Mall, Cnr Morgenster Road & Vanguard Drive, Mitchells Plain, Cape Town', '021 370 3600', NULL, NULL,
  'Woolworths Westgate Mall is a department store branch of the Woolworths chain in Westgate Mall, selling groceries, food, and clothing.',
  NULL, NULL,
  '["https://www.sayellow.com/woolworths-westgate-mall-mitchells-plain", "https://www.cybo.com/ZA-biz/woolworths-westgate-mitchells-plain"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'markham-westgate-mall-westgate', 'Markham Westgate Mall',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Shop 65, Westgate Mall, Cnr Morgenster Road & Vanguard Drive, Mitchells Plain, Cape Town', '021 374 2490', NULL, NULL,
  'Markham Westgate Mall is a branch of the Markham menswear and streetwear chain in Westgate Mall.',
  NULL, NULL,
  '["https://bash.com/store/markham-westgate-mall-mitchells-plain-western-cape-7785/020319", "https://www.ivote.co.za/view/south-africa/markham-westgate-mall-mitchells-plain-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'markham-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bradlows-westgate-mall-westgate', 'Bradlows Westgate Mall',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Shop 9, Westgate Mall, Cnr Morgenster Road & Vanguard Drive, Mitchells Plain, Cape Town, 7785', '021 374 1131', NULL, NULL,
  'Bradlows Westgate Mall is a branch of the Bradlows furniture and homeware chain in Westgate Mall.',
  NULL, NULL,
  '["https://www.bradlows.co.za/store/mitchells-plein-westgate-mall", "https://www.sayellow.com/view/south-africa/bradlows-mitchells-plein-westgate-mall-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bradlows-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-westgate-mall-westgate', 'Checkers Westgate Mall',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Shop No 12, Westgate Mall, Cnr Jakes Gerwel Drive & Morgenster Road, Mitchells Plain, Cape Town, 7785', '021 370 1860', NULL, NULL,
  'Checkers Westgate Mall is a supermarket branch of the Checkers chain in Westgate Mall, selling groceries, fresh produce, and household essentials.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/mitchells-plain/checkers/shop-no-12-cnr-vanguard-dr-and-morgenster-roads", "https://www.callupcontact.com/b/Supermarkets/Checkers_Weltevreden/5358"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-westgate-mall-westgate', 'Mr Price Westgate Mall',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Shops 54 & 55, Westgate Mall, Cnr Vanguard Drive & Morgenster Road, Mitchells Plain, Cape Town, 7785', '0800 212 535', NULL, NULL,
  'Mr Price Westgate Mall is a branch of the Mr Price fashion and homeware chain in Westgate Mall.',
  NULL, NULL,
  '["https://www.mrp.com/en_za/store/mr-price-mitchells-plain-westgate", "https://www.sayellow.com/view/south-africa/mr-price-mitchells-plain-westgate-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-price-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'truworths-westgate-mall-westgate', 'Truworths Westgate Mall',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Shop 58, Westgate Mall, Morgenster Road, Mitchells Plain, Cape Town, 7785', '021 371 6156', NULL, NULL,
  'Truworths Westgate Mall is a branch of the Truworths fashion retail chain in Westgate Mall.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/Clothing_Stores/Truworths_Weltevreden/5811", "https://www.brabys.com/za/western-cape/mitchells-plain/truworths"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'truworths-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
