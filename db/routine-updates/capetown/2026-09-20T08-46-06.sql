INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-corner-surf-shop-muizenberg', 'The Corner Surf Shop',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '143 Main Road, Muizenberg, Cape Town, 7945', '021 788 1191', NULL, NULL,
  'The Corner Surf Shop is a surf shop in Muizenberg, said to be Africa''s oldest surf shop.',
  NULL, NULL,
  '["https://thecornersurfshop.com/contact/", "https://www.tripadvisor.com/ShowUserReviews-g1509162-d10441223-r439203005-The_Corner_Surf_Shop-Muizenberg_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-corner-surf-shop-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'surf-emporium-muizenberg', 'Surf Emporium',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  'Surfers Corner, 72 Beach Road, Muizenberg, Cape Town, 7945', '021 788 8687', NULL, NULL,
  'Surf Emporium is a surf and stand-up paddleboard shop and school at Surfers Corner in Muizenberg, also offering equipment rental.',
  NULL, NULL,
  '["https://surfemporium.co.za/", "https://yourneighbourhood.co.za/the-surf-emporium/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'surf-emporium-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'empire-cafe-muizenberg', 'Empire Cafe',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '11 York Road, Muizenberg, Cape Town, 7950', '021 788 1250', NULL, NULL,
  'Empire Cafe is a breakfast, lunch and dinner cafe in Muizenberg, trading since 2002.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1509162-d1475598-Reviews-Empire_Cafe-Muizenberg_Western_Cape.html", "https://triptap.com/places/za/western-cape/cape-town/empire-cafe-t00fc0de"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'empire-cafe-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'casa-labia-muizenberg', 'Casa Labia',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '192 Main Road, Muizenberg, Cape Town', '021 788 6062', NULL, NULL,
  'Casa Labia is a cultural centre in a 1929 heritage building in Muizenberg, housing an art gallery, a boutique and an Italian cafe.',
  NULL, NULL,
  '["https://blog.sa-venues.com/provinces/western-cape/casa-labia-in-muizenberg/", "https://www.tripadvisor.com/Restaurant_Review-g1509162-d2460106-Reviews-Casa_Labia_by_Ideas_Cartel-Muizenberg_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'casa-labia-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bombay-chilli-indian-bistro-muizenberg', 'Bombay Chilli Indian Bistro',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '46 Beach Road, Muizenberg, Cape Town, 7945', '021 788 2052', NULL, NULL,
  'Bombay Chilli Indian Bistro is an Indian restaurant in Muizenberg.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1509162-d7606724-Reviews-Bombay_Chilli_Indian_Bistro-Muizenberg_Western_Cape.html", "https://www.eatout.co.za/venue/bombay-chilli/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bombay-chilli-indian-bistro-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'capricorn-square-muizenberg', 'Capricorn Square',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  'Cnr Prince George Drive & Dury Road, Muizenberg, Cape Town', NULL, NULL,
  '["https://www.capricornsquare.co.za/stores/", "https://www.facebook.com/Capricornsquare/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capitec-bank-muizenberg', 'Capitec Bank',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'capricorn-square-muizenberg'),
  'Shop 21, Capricorn Square, Cnr Prince George Drive & Dury Road, Muizenberg, Cape Town', '021 788 2785', NULL, NULL,
  'Capitec Bank is a South African retail bank, with a branch in Capricorn Square, Muizenberg.',
  NULL, NULL,
  '["https://www.capricornsquare.co.za/stores/", "https://za.africabz.com/western-cape/capricorn-square-shopping-centre-18434"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capitec-bank-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-muizenberg', 'Woolworths',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'capricorn-square-muizenberg'),
  'Shop 26, Capricorn Square, Cnr Prince George Drive & Dury Road, Muizenberg, Cape Town', '021 709 6940', NULL, NULL,
  'Woolworths is a South African department store and food retailer, with a branch in Capricorn Square, Muizenberg.',
  NULL, NULL,
  '["https://www.capricornsquare.co.za/stores/", "https://za.africabz.com/western-cape/woolworths-capricorn-square-26233"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
