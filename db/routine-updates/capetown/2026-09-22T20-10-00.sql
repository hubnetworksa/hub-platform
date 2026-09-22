INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'buco-plaza-mitchells-plain', 'BUCO Plaza',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  'Shop F15A, Station Plaza, Seventh Avenue, Mitchells Plain, Cape Town, 7785', '021 391 5555', NULL, NULL,
  'BUCO Plaza is a branch of the BUCO hardware and building materials chain, in Mitchells Plain.',
  NULL, NULL,
  '["https://www.buco.co.za/capetown/plaza", "https://www.cybo.com/ZA-biz/buco-plaza-mitchells-plain"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'buco-plaza-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'debonairs-pizza-town-centre-mitchells-plain', 'Debonairs Pizza Mitchells Plain Express',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  'Shop 8, Town Centre, Katdoring Street, Mitchells Plain, Cape Town, 7785', '021 376 4451', NULL, NULL,
  'Debonairs Pizza Mitchells Plain Express is a branch of the pizza delivery and takeaway chain, in Mitchells Plain Town Centre.',
  NULL, NULL,
  '["https://locations.debonairspizza.co.za/restaurants-OKMall-DebonairsPizzaMitchellsPlainExpress", "https://nearfinderza.com/business/western-cape/cape-town/debonairs-pizza-mitchells-plain_121352+5.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'debonairs-pizza-town-centre-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-liberty-promenade-mitchells-plain', 'KFC Liberty Promenade',
  (SELECT id FROM suburbs WHERE slug = 'mitchells-plain'),
  (SELECT id FROM shopping_centers WHERE slug = 'liberty-promenade-mitchells-plain'),
  'Shop 90, Liberty Promenade, Cnr AZ Berman Drive & Morgenster Road, Mitchells Plain, Cape Town, 7785', '021 376 7204', NULL, NULL,
  'KFC Liberty Promenade is a branch of the fried chicken fast food chain, inside Liberty Promenade shopping centre.',
  NULL, NULL,
  '["https://wanderlog.com/place/details/12741814/kfc-promenade-mitchells-plain-mitchells-plain", "https://www.sa-venues.com/things-to-do/westerncape/go-shopping-at-the-liberty-promenade/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-liberty-promenade-mitchells-plain'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'westgate-pharmacy-westgate', 'Westgate Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  '81 Westgate Mall, 6 Morgenster Road, Westgate, Mitchells Plain, Cape Town, 7789', '021 371 6110', NULL, NULL,
  'Westgate Pharmacy is a retail pharmacy inside Westgate Mall.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/2210713_2", "https://www.thinklocal.co.za/biz/westgate-pharmacy-mitchells-plain"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'westgate-pharmacy-westgate'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
