INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'victoria-mall-grassy-park', 'Victoria Mall',
  (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  'Cnr Victoria Road & 4th Avenue, Grassy Park, Cape Town, 7941', NULL, NULL,
  '["https://mydorpie.com/m/?page=fran_deb_grassypark", "https://yandex.com/maps/org/victoria_mall_grassy_park/29924300049/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'debonairs-pizza-victoria-mall-grassy-park', 'Debonairs Pizza', (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'victoria-mall-grassy-park'),
  'Shop 2, Victoria Mall, 101 4th Avenue, Grassy Park, Cape Town, 7941', '021 705 6858', NULL, 'info@debonairspizza.co.za',
  'Debonairs Pizza at Victoria Mall is a branch of the national pizza takeaway and delivery chain, in Grassy Park.',
  NULL, NULL,
  '["https://locations.debonairspizza.co.za/restaurants-VictoriaMall-DebonairsPizzaGrassyPark", "https://www.tripadvisor.com/Restaurant_Review-g14251551-d17787063-Reviews-Debonairs_Pizza-Grassy_Park_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'debonairs-pizza-victoria-mall-grassy-park'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-stores-victoria-mall-grassy-park', 'PEP Stores Grassy Park', (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  (SELECT id FROM shopping_centers WHERE slug = 'victoria-mall-grassy-park'),
  'Cnr 4th Avenue & Victoria Road, Victoria Mall, Grassy Park, Cape Town, 7945', '021 705 2561', NULL, NULL,
  'PEP Stores Grassy Park is a branch of the national discount variety retail chain, at Victoria Mall, selling clothing, footwear and household goods.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-victoria-road-grassy-park-cape-town-western-cape/11873", "https://yandex.com/maps/org/pep_stores_grassy_park/55990902759/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-stores-victoria-mall-grassy-park'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'busy-corner-bakery-grassy-park', 'Busy Corner Bakery', (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  '77 Victoria Road, Grassy Park, Cape Town, 7888', '021 706 3036', NULL, 'busycornerbakery@gmail.com',
  'Busy Corner Bakery is a neighbourhood bakery on Victoria Road in Grassy Park.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/7349559_3", "https://www.facebook.com/p/Busy-Corner-Bakery-100054426193734/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'busy-corner-bakery-grassy-park'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);
