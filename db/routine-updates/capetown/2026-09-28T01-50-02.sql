-- Jobs 1-2: plattekloof suburb research (Plattekloof Village Shopping Centre tenant discovery)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-plattekloof', 'Woolworths Plattekloof',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-village-shopping-centre-plattekloof'),
  'Cnr Plattekloof Road & Baronetcy Boulevard, Plattekloof Village Shopping Centre, Plattekloof, Cape Town', '021 524 2120', NULL, NULL,
  'Woolworths Plattekloof is a supermarket and clothing store inside Plattekloof Village Shopping Centre.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/plattekloof/woolworths/plattekloof-village-shopping-centre-plattekloof-rd-baronetcy-boulevard-parow", "https://www.cybo.com/ZA-biz/woolworths-plattekloof"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'chinook-spur-plattekloof', 'Chinook Spur',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-village-shopping-centre-plattekloof'),
  'Shop 1, Plattekloof Village Shopping Centre, Plattekloof Road, Plattekloof, Cape Town', '021 558 0095', NULL, NULL,
  'Chinook Spur is a family restaurant inside Plattekloof Village Shopping Centre, serving steak, ribs, burgers and wings.',
  NULL, NULL,
  '["https://www.spursteakranches.com/za/restaurant/western-cape/cape-town/plattekloof/chinook-spur", "https://www.mrd.com/delivery/restaurant/spur-chinook-plattekloof-parow/13901"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'chinook-spur-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bella-casa-plattekloof', 'Bella Casa',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-village-shopping-centre-plattekloof'),
  'Shop 15, Plattekloof Village Shopping Centre, Corner Plattekloof Road & Baronetcy Boulevard, Plattekloof, Cape Town', '021 558 9865', NULL, NULL,
  'Bella Casa is a home decor and gift shop inside Plattekloof Village Shopping Centre, stocking flooring, gifting and homeware.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/bella-casa-48750", "https://www.plattekloofvillageshoppingcentre.co.za/shop/bella-casa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bella-casa-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
