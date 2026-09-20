INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'westridge-shopping-centre-westridge', 'Westridge Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'westridge'),
  'Wespoort Drive, Westridge, Mitchells Plain, Cape Town', NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Mitchells-Plain/Shoprite-Westridge/store-details/54790", "https://www.tiendeo.co.za/stores/mitchells-plain/shoprite-westridge-shopping-centre-wespoort-drive/73906"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-westridge-westridge', 'Shoprite Westridge',
  (SELECT id FROM suburbs WHERE slug = 'westridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'westridge-shopping-centre-westridge'),
  'Westridge Shopping Centre, Wespoort Drive, Mitchells Plain, Cape Town', '021 378 2109', NULL, NULL,
  'Shoprite Westridge is a supermarket branch of the Shoprite chain at Westridge Shopping Centre on Wespoort Drive in Westridge, Mitchells Plain, selling groceries, fresh produce, and household essentials.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Mitchells-Plain/Shoprite-Westridge/store-details/54790", "https://promotheus.co.za/mitchells-plain/shoprite/westridge-shopping-centre-wespoort-drive"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-westridge-westridge'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-westridge-westridge', 'KFC Westridge',
  (SELECT id FROM suburbs WHERE slug = 'westridge'),
  'Simonsig Ave, Mitchells Plain, Cape Town', '021 392 8638', NULL, NULL,
  'KFC Westridge is a fried-chicken and fast-food outlet on Simonsig Avenue in Westridge, Mitchells Plain, offering burgers, wings and other quick-service meals.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/cape-town/simonsig-ave-mitchels-plain", "https://www.cylex.net.za/company/kfc-mitchells-plain-westridge-23709660.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-westridge-westridge'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
