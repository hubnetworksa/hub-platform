INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'plattekloof-shopping-centre-plattekloof', 'Plattekloof Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  'Corner of Olienhout Avenue & Plattekloof Road, Plattekloof, Cape Town, 7500', NULL, NULL,
  '["https://plattekloof.capetown/index.php/about", "https://www.facebook.com/PlattekloofShoppingCentre/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'plattekloof-village-shopping-centre-plattekloof', 'Plattekloof Village Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  'Corner of Plattekloof Road & Baronetcy Boulevard, Plattekloof, Cape Town, 7500', NULL, NULL,
  '["https://www.plattekloofvillageshoppingcentre.co.za/", "https://www.sayellow.com/view/south-africa/plattekloof-village-shopping-centre-in-cape-town"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cattle-baron-plattekloof', 'Cattle Baron Plattekloof',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-shopping-centre-plattekloof'),
  'Shop 16, Plattekloof Shopping Centre, Plattekloof, Cape Town, 7500', '021 911 0110', NULL, NULL,
  'Cattle Baron Plattekloof is a branch of the Cattle Baron steakhouse chain, in Plattekloof Shopping Centre.',
  NULL, NULL,
  '["https://www.cattlebaron.co.za/plattekloof/", "https://tableagent.com/cape-town/cattle-baron-plattekloof/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cattle-baron-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'de-kelder-restaurant-winery-plattekloof', 'De Kelder Restaurant & Winery',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-shopping-centre-plattekloof'),
  'Plattekloof Shopping Centre, Cnr Plattekloof & Olienhout Drive, Plattekloof, Cape Town, 7500', '021 911 1024', NULL, NULL,
  'De Kelder Restaurant & Winery is a restaurant serving food alongside a selection of Cape wines, in Plattekloof Shopping Centre.',
  NULL, NULL,
  '["https://www.dekelderrestaurant.com/", "https://www.eatout.co.za/venue/de-kelder-restaurant-winery/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'de-kelder-restaurant-winery-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'copper-club-plattekloof', 'Copper Club Plattekloof',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-shopping-centre-plattekloof'),
  'Shop 5, Plattekloof Shopping Centre, Plattekloof Rd, Plattekloof, Cape Town, 7500', '021 879 7366', NULL, NULL,
  'Copper Club Plattekloof is a casual dining restaurant in Plattekloof Shopping Centre, serving pizzas, burgers and steaks.',
  NULL, NULL,
  '["https://coppercollection.co.za/copper-club/", "https://www.dineplan.com/restaurants/copper-club-plattekloof"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'copper-club-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bluefin-restaurant-plattekloof', 'Bluefin Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-village-shopping-centre-plattekloof'),
  'Plattekloof Village Shopping Centre, Cnr Plattekloof Road & Baronetcy Boulevard, Plattekloof, Cape Town', '021 558 4281', NULL, NULL,
  'Bluefin Restaurant is a sushi and seafood restaurant in Plattekloof Village Shopping Centre.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g2427465-d3785026-Reviews-Blue_Fin-Plattekloof_Western_Cape.html", "https://www.eatout.co.za/venue/bluefin-restaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bluefin-restaurant-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
