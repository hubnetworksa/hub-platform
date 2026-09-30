INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pet-utopia-crawford', 'Pet Utopia',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  'Shop 7, Cnr Thornton & Massey Avenue, Crawford, Cape Town, 7780', '021 697 0664', NULL, NULL,
  'Pet Utopia is a pet supplies shop in Crawford, stocking food and accessories for a range of pets.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=325766", "https://2pos.co.za/2/11504"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pet-utopia-crawford'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'classic-bakery-crawford', 'Classic Bakery',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  '212 Thornton Road, Crawford, Cape Town, 7780', '021 696 9437', 'http://www.classicbakery.co.za/', NULL,
  'Classic Bakery is a Halaal bakery and confectioner on Thornton Road in Crawford.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/classic-bakery-39241", "http://www.classicbakery.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'classic-bakery-crawford'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'unimedics-international-crawford', 'Unimedics International',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  '167 Kromboom Road, Crawford, Cape Town, 7780', '064 069 9299', NULL, NULL,
  'Unimedics International is a dental practice on Kromboom Road in Crawford.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=1910743", "https://unimedicsinternational.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'unimedics-international-crawford'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-lounge-on-kromboom-crawford', 'The Lounge On Kromboom',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  'First Floor, Kromboom Convenience Centre, Kromboom Road, Crawford, Cape Town, 7780', '021 696 9719', NULL, NULL,
  'The Lounge On Kromboom is a restaurant on the first floor of Kromboom Convenience Centre in Crawford.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1722390-d11913053-Reviews-The_Lounge_On_Kromboom-Cape_Town_Western_Cape.html", "https://www.eatout.co.za/venue/lounge-kromboom/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-lounge-on-kromboom-crawford'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
