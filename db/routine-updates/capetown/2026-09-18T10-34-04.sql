-- Jobs 1-2: Woodstock suburb research

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'the-old-biscuit-mill-woodstock', 'The Old Biscuit Mill',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '373-375 Albert Road, Woodstock, Cape Town', NULL, NULL,
  '["https://theoldbiscuitmill.co.za/contact/", "https://insideguide.co.za/cape-town/old-biscuit-mill/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'the-palms-decor-and-lifestyle-centre-woodstock', 'The Palms Decor and Lifestyle Centre',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '66 Albert Road, Woodstock, Cape Town', NULL, NULL,
  '["https://www.sa-venues.com/attractionswc/the-palms.php", "https://www.facebook.com/thepalmscentre/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-potluck-club-woodstock', 'The Potluck Club',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-old-biscuit-mill-woodstock'),
  'Silo Top Floor, The Old Biscuit Mill, 373-375 Albert Road, Woodstock, Cape Town', '021 447 0804', 'https://thepotluckclub.co.za/', NULL,
  'The Potluck Club is a small-plates restaurant on the Silo Top Floor of The Old Biscuit Mill in Woodstock, serving a globally inspired shared-plate menu.',
  NULL, NULL,
  '["https://thepotluckclub.co.za/contact/", "https://www.capetownring.com/pages/the-pot-luck-club"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-potluck-club-woodstock'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'neighbourgoods-market-woodstock', 'Neighbourgoods Market',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-old-biscuit-mill-woodstock'),
  'The Old Biscuit Mill, 373-375 Albert Road, Woodstock, Cape Town', '021 448 1438', NULL, 'info@neighbourgoodsmarket.co.za',
  'Neighbourgoods Market is a weekly food, craft and design market held at The Old Biscuit Mill in Woodstock, running Saturdays and Sundays.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/things-to-do/neighbourgoods-market/", "https://theoldbiscuitmill.co.za/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'neighbourgoods-market-woodstock'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'casa-woodstock-bar-woodstock', 'Casa Woodstock Bar',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '332 Albert Road, Woodstock, Cape Town', '082 577 2153', 'https://casabarcpt.co.za/', NULL,
  'Casa Woodstock Bar is a pizza bar on Albert Road in Woodstock serving pizza and alcohol in a casual setting.',
  NULL, NULL,
  '["https://casabarcpt.co.za/", "https://restaurantguru.com/Casa-Woodstock-Bar-Cape-Town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'casa-woodstock-bar-woodstock'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'gogo-woodstock-woodstock', 'GoGo Woodstock',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  'Shop 1, The District Building, 41 Sir Lowry Road, Woodstock, Cape Town', '021 461 3973', NULL, NULL,
  'GoGo Woodstock is a restaurant in The District building on Sir Lowry Road, Woodstock.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d5427323-Reviews-GoGo_Woodstock-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/gogo-woodstock/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gogo-woodstock-woodstock'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'district-cafe-woodstock', 'District Cafe',
  (SELECT id FROM suburbs WHERE slug = 'woodstock'),
  '115 Roodebloem Road, Woodstock, Cape Town', '021 447 3444', 'https://www.districtcafe.co.za/', 'info@districtcafe.co.za',
  'District Cafe is a family-run cafe and restaurant on Roodebloem Road in Woodstock, serving breakfast and lunch through the week and staying open later on weekends.',
  NULL, NULL,
  '["https://www.districtcafe.co.za/", "https://www.dine4less.co.za/establishment.asp?est=10767"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'district-cafe-woodstock'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
