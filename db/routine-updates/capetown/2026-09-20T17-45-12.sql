INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'good-thyme-cafe-milnerton', 'Good Thyme Cafe',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  'Racecourse Road, Stodels Garden Centre, Milnerton, Cape Town, 7441', '021 551 0881', NULL, NULL,
  'Good Thyme Cafe is a family-friendly breakfast and lunch cafe inside Stodels Garden Centre in Milnerton.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312665-d19240618-Reviews-Good_Thyme_Cafe-Milnerton_Western_Cape.html", "https://www.capetownwithkids.com/good-thyme-cafe-milnerton/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'good-thyme-cafe-milnerton'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-milnerton-milnerton', 'Shoprite Milnerton',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  'Cnr Koeberg and De Grendel Roads, Milnerton, Cape Town', '021 528 1680', NULL, NULL,
  'Shoprite Milnerton is a supermarket branch of the Shoprite chain on the corner of Koeberg and De Grendel Roads in Milnerton.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/shoprite-milnerton-41578", "https://southafricaplacesmap.com/Shoprite--Milnerton-623180"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-milnerton-milnerton'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'centre-point-milnerton', 'Centre Point Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  'Cnr Koeberg & Loxton Road, Milnerton, Cape Town, 7441', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/centre-point---milnerton.html", "https://galetti.co.za/western-cape/milnerton-property/242/2832"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-centre-point-milnerton', 'Pick n Pay Centre Point',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  (SELECT id FROM shopping_centers WHERE slug = 'centre-point-milnerton'),
  'Loxton Road, Centre Point Shopping Centre, Milnerton, Cape Town, 7441', '021 003 4255', NULL, NULL,
  'Pick n Pay Centre Point is a branch of the Pick n Pay supermarket chain inside Centre Point Shopping Centre in Milnerton.',
  NULL, NULL,
  '["https://centrepointshoppingcentre.co.za/shops/pick-n-pay/", "https://za.africabz.com/western-cape/pick-n-pay-centre-point-milnerton-370779"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-centre-point-milnerton'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nedbank-centre-point-milnerton', 'Nedbank Centre Point',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  (SELECT id FROM shopping_centers WHERE slug = 'centre-point-milnerton'),
  'Shop 25, Centre Point Shopping Centre, Cnr Loxton & Langerman Roads, Milnerton, Cape Town, 7441', '021 555 5761', NULL, NULL,
  'Nedbank Centre Point is a Nedbank branch inside Centre Point Shopping Centre in Milnerton.',
  NULL, NULL,
  '["https://nedbank.banklocationmaps.com/en/branch/956855-nedbank-branch-shop-gf017-and-gf025-centre-point-shopping-centre-0a-loxton-road", "https://www.yellosa.co.za/company/749340/nedbank-centre-point"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nedbank-centre-point-milnerton'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);
