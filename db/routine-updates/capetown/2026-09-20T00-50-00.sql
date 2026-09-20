INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eziko-restaurant-langa', 'Eziko Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'langa'),
  'Corner Washington and Jungle Walk Street, Langa, Cape Town, 7455', '021 694 0434', 'https://ezikorestaurant.co.za/', NULL,
  'Eziko Restaurant is a cooking school and restaurant in Langa serving traditional South African cuisine.',
  NULL, NULL,
  '["https://ezikorestaurant.co.za/restaurant/", "https://www.dining-out.co.za/md/Eziko/5988"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eziko-restaurant-langa'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mzansi-restaurant-langa', 'Mzansi Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'langa'),
  '45 Harlem Avenue, Langa, Cape Town, 7455', '021 694 1656', 'https://mzansi45.co.za/', NULL,
  'Mzansi Restaurant is a buffet-style restaurant in Langa established in 2008, specialising in traditional Xhosa dishes.',
  NULL, NULL,
  '["https://mzansi45.co.za/contact-us/", "https://www.eatout.co.za/venue/mzansi-restaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mzansi-restaurant-langa'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'guga-sthebe-arts-and-culture-centre-langa', 'Guga S''thebe Arts and Culture Centre',
  (SELECT id FROM suburbs WHERE slug = 'langa'),
  'Washington Street (King Langalibalele Avenue), Langa, Cape Town, 7455', '021 695 3493', NULL, NULL,
  'Guga S''thebe Arts and Culture Centre is a community arts and cultural centre in Langa offering workshops, performances and exhibitions.',
  NULL, NULL,
  '["https://www.musicinafrica.net/directory/guga-sthebe-cultural-centre", "https://www.capetownmagazine.com/guga-sthebe"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'guga-sthebe-arts-and-culture-centre-langa'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'maneos-bb-and-catering-langa', 'MaNeo''s B&B and Catering',
  (SELECT id FROM suburbs WHERE slug = 'langa'),
  'Zone 7 No 30, Langa, Cape Town', '021 694 2504', NULL, NULL,
  'MaNeo''s B&B and Catering is a bed and breakfast and catering business in Langa.',
  NULL, NULL,
  '["https://www.sa-venues.com/westerncape/bandb/langa.php", "https://heybedbreakfast.co.za/Cape_Town/Kwa-Langa_township/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'maneos-bb-and-catering-langa'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'radebes-bed-and-breakfast-langa', 'Radebe''s Bed and Breakfast',
  (SELECT id FROM suburbs WHERE slug = 'langa'),
  '23 PW Mama Way, Settlers Place, Langa, Cape Town', '021 695 0508', NULL, NULL,
  'Radebe''s Bed and Breakfast is a guesthouse and coffee shop in Langa offering themed bedrooms and breakfast, lunch and dinner service.',
  NULL, NULL,
  '["https://www.sa-venues.com/westerncape/guesthouses/langa.php", "https://heybedbreakfast.co.za/Cape_Town/Kwa-Langa_township/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'radebes-bed-and-breakfast-langa'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
