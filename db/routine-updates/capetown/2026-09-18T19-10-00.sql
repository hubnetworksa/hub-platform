-- Jobs 1-2: rondebosch suburb research
-- New shopping centre (Riverside Mall) + 6 new tenants of the already-known Rondebosch Main Centre

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'riverside-mall-rondebosch', 'Riverside Mall',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  'Cnr Belmont & Main Roads, Rondebosch, Cape Town', NULL, NULL,
  '["https://riversiderondebosch.co.za/", "https://www.guzzle.co.za/malls/850/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'peacock-tea-coffee-rondebosch', 'Peacock Tea & Coffee',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'rondebosch-main-centre-rondebosch'),
  'Shop 15, Rondebosch Main Centre, Main Road, Rondebosch, Cape Town, 7700', '021 685 1622', 'https://www.peacockteaandcoffee.co.za/stores/', NULL,
  'Peacock Tea & Coffee is a tea and coffee shop inside Rondebosch Main Centre in Rondebosch.',
  NULL, NULL,
  '["https://www.rondeboschmain.co.za/divi_overlay/peacock-tea-coffee/", "https://www.peacockteaandcoffee.co.za/stores/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'peacock-tea-coffee-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sorbet-salon-rondebosch', 'Sorbet Salon (Rondebosch)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'rondebosch-main-centre-rondebosch'),
  'Shop 16, Rondebosch Main Centre, 89 Main Road, Rondebosch, Cape Town, 7700', '021 685 5483', NULL, NULL,
  'Sorbet Salon is a beauty salon inside Rondebosch Main Centre in Rondebosch.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/sorbet-salon-main-road-cape-town-G57z90", "https://za.africabz.com/western-cape/sorbet-rondebosch-131679"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sorbet-salon-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nandos-rondebosch', "Nando's (Rondebosch)",
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'rondebosch-main-centre-rondebosch'),
  'Shop 20, Rondebosch Main Centre, Main Road, Rondebosch, Cape Town, 7700', '021 685 3757', 'https://www.nandos.co.za', NULL,
  "Nando's is a branch of the South African flame-grilled chicken restaurant chain, inside Rondebosch Main Centre in Rondebosch.",
  NULL, NULL,
  '["https://www.rondeboschmain.co.za/divi_overlay/nandos/", "https://za.africabz.com/western-cape/nandos-rondebosch-2980"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nandos-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-rondebosch', 'Pick n Pay (Rondebosch)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'rondebosch-main-centre-rondebosch'),
  'Shop 1, 89 Main Road, Rondebosch, Cape Town, 7700', '021 685 4001', NULL, NULL,
  'Pick n Pay is a branch of the South African supermarket chain, inside Rondebosch Main Centre in Rondebosch.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/pick-n-pay-rondebosch", "https://www.rondeboschonline.co.za/item/pick-n-pay-rondebosch/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zone-fitness-rondebosch', 'Zone Fitness (Rondebosch)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'rondebosch-main-centre-rondebosch'),
  '2nd Floor, Rondebosch Main Centre, Main Road, Rondebosch, Cape Town, 7700', '021 685 5588', 'https://zonefitness.co.za/', NULL,
  'Zone Fitness is a branch of the South African budget gym chain, on the 2nd floor of Rondebosch Main Centre in Rondebosch.',
  NULL, NULL,
  '["https://www.rondeboschmain.co.za/divi_overlay/the-zone-fitness/", "https://www.cybo.com/ZA-biz/zone-fitness-rondebosch"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zone-fitness-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'school-and-leisure-rondebosch', 'School and Leisure (Rondebosch)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'rondebosch-main-centre-rondebosch'),
  'Shop 49, Rondebosch Main Centre, 51 Main Road, Rondebosch, Cape Town, 7800', '021 762 1075', 'https://www.schoolandleisure.co.za', NULL,
  'School and Leisure is a branch of the South African school-wear retail chain, inside Rondebosch Main Centre in Rondebosch.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/claremont/school-wear-retailers/school-and-leisure", "https://www.cylex.net.za/company/school-and-leisure-19632498.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'school-and-leisure-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
