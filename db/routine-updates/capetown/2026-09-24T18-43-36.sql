INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'colcacchio-meadowridge', 'Col''Cacchio Meadowridge',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Shop 11, Meadowridge Shopping Centre, Firgrove Way, Meadowridge, Cape Town, 7806', '021 712 3190', NULL, 'meadowridge@colcacchio.co.za',
  'Col''Cacchio Meadowridge is a branch of the South African pizzeria chain, serving wood-fired pizzas and Italian-style dishes, in Meadowridge Shopping Centre, Meadowridge.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/mio-colcacchio-meadowridge/", "https://www.sluurpy.co.za/cape-town-central/restaurant/4732905/col-cacchio-meadowridge"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'colcacchio-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-fat-german-meadowridge', 'The Fat German',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Shop 5, Meadowridge Shopping Centre, Howard Drive, Meadowridge, Cape Town', '021 712 1933', NULL, 'thefatgerman@gmail.com',
  'The Fat German is a deli and butchery in Meadowridge Shopping Centre, Meadowridge, selling meats and deli products.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/the-fat-german-73894", "https://www.cybo.com/ZA-biz/the-fat-german"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-fat-german-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'village-skincare-medi-spa-meadowridge', 'Village Skincare & Medi Spa',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Shop 3, Meadowridge Shopping Centre, Howard Drive, Meadowridge, Cape Town, 7806', '021 713 3442', 'www.villageskincare.co.za', NULL,
  'Village Skincare & Medi Spa is a skincare and beauty spa offering facials and medi-spa treatments, in Meadowridge Shopping Centre, Meadowridge.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=401148", "https://www.tuugo.co.za/Companies/village-skincare-medi-spa8/0260003513511"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'village-skincare-medi-spa-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-meadowridge-meadowridge', 'PostNet Meadowridge',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Shop 17, Meadowridge Shopping Centre, Firgrove Way, Meadowridge, Cape Town, 7806', '021 712 5035', NULL, 'meadowridge@postnet.co.za',
  'PostNet Meadowridge is a branch of the courier, printing and mailbox-services franchise, in Meadowridge Shopping Centre, Meadowridge.',
  NULL, NULL,
  '["https://www.postnet.co.za/stores/meadowridge/5c69211355c8c661d10be9f4", "https://www.africabizinfo.com/ZA/postnet-meadowridge-021-712-5035"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-meadowridge-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pna-meadowridge-meadowridge', 'PNA Meadowridge',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'meadowridge-shopping-centre-meadowridge'),
  'Shop 29, Meadowridge Shopping Centre, Howard Drive, Meadowridge, Cape Town, 7806', '021 712 4699', 'www.pna.co.za', NULL,
  'PNA Meadowridge is a branch of the stationery, books and gifts retail chain, in Meadowridge Shopping Centre, Meadowridge.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/p-n-a-stationers--meadowridge--23687520.html", "https://www.cybo.com/ZA-biz/pna-meadowridge"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pna-meadowridge-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'engen-meadowridge-meadowridge', 'Engen Meadowridge',
  (SELECT id FROM suburbs WHERE slug = 'meadowridge'),
  '142 Ladies Mile Road, Meadowridge, Cape Town', '021 712 9270', NULL, NULL,
  'Engen Meadowridge is a 24-hour Engen fuel station on Ladies Mile Road, Meadowridge, with a Woolworths Food Stop and Quick Shop convenience store.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/engen-meadowridge-service-station-1473", "https://www.fueldirectory.co.za/listing-contact.php?listings_id=5996"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'engen-meadowridge-meadowridge'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);
