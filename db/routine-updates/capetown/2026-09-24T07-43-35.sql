INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-piano-bar-de-waterkant', 'The Piano Bar',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  '47 Napier Street, De Waterkant, Cape Town', '021 007 5212', NULL, NULL,
  'The Piano Bar is a New York-inspired music revue bar and eatery in De Waterkant, on the corner of Jarvis and Napier Streets, with a wraparound terrace overlooking the village, Devil''s Peak and the bay.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/the-piano-bar-1715", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d3808039-Reviews-The_Piano_Bar_Cape_Town-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-piano-bar-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'anatoli-de-waterkant', 'Anatoli',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  '24 Napier Street, De Waterkant, Cape Town', '021 419 2501', NULL, NULL,
  'Anatoli is a long-running Turkish and Mediterranean restaurant on Napier Street in De Waterkant, serving Turkish cuisine in Cape Town since 1984.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/anatoli-turkish-restaurant/", "https://www.sluurpy.co.za/cape-town-central/restaurant/4731424/anatoli-turkish-restaurant"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'anatoli-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'san-julian-taco-tequila-de-waterkant', 'San Julian Taco & Tequila',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  '3 Rose Street, De Waterkant, Cape Town', '021 419 4233', NULL, NULL,
  'San Julian Taco & Tequila is a family-run Mexican restaurant on Rose Street in De Waterkant, serving authentic Mexican dishes and a large selection of tequilas and mescals in an intimate, brightly decorated space.',
  NULL, NULL,
  '["https://foursquare.com/v/san-julian-taco--tequila/4c1a77d7624b9c74ab6e1204", "https://vymaps.com/ZA/San-Julian-Taco-Tequila-220176658338732/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'san-julian-taco-tequila-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'la-petite-tarte-de-waterkant', 'La Petite Tarte',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  (SELECT id FROM shopping_centers WHERE slug = 'cape-quarter-de-waterkant'),
  'Shop A11, Cape Quarter, 72 Waterkant Street, De Waterkant, Cape Town', '021 425 9077', NULL, NULL,
  'La Petite Tarte is a French-style sidewalk café inside Cape Quarter in De Waterkant, serving breakfast, lunch and desserts.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/la-petite-tarte/", "https://www.getaway.co.za/food/restaurant-review-la-petite-tarte-cape-towns-de-waterkant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'la-petite-tarte-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'la-menara-district-six', 'La Menara',
  (SELECT id FROM suburbs WHERE slug = 'district-six'),
  '48 Harrington Street, District Six, Cape Town', '061 583 1892', NULL, NULL,
  'La Menara is a Moroccan restaurant on Harrington Street in District Six serving tagines, couscous, charcoal grill dishes and cafe-style light meals from breakfast through dinner, with an outdoor terrace for al fresco dining.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/la-menara-35050", "https://www.tripadvisor.co.za/Restaurant_Review-g1722390-d23412802-Reviews-La_Menara-Cape_Town_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'la-menara-district-six'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'belly-of-the-beast-district-six', 'Belly of the Beast',
  (SELECT id FROM suburbs WHERE slug = 'district-six'),
  '110 Harrington Street, District Six, Cape Town', '076 220 5458', NULL, NULL,
  'Belly of the Beast is a small, intimate restaurant on Harrington Street in District Six known for its changing blackboard menu of Southern comfort and pub-inspired dishes.',
  NULL, NULL,
  '["https://www.theinfatuation.com/cape-town/reviews/belly-of-the-beast", "https://www.dineplan.com/restaurants/belly-of-the-beast"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'belly-of-the-beast-district-six'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rapt-district-six', 'Rapt',
  (SELECT id FROM suburbs WHERE slug = 'district-six'),
  '39 Buitenkant Street, District Six, Cape Town', '021 201 7000', NULL, NULL,
  'Rapt is a chocolate cafe on Buitenkant Street in District Six offering nitrogen ice cream, pastries, drinks and a make-your-own chocolate bar experience.',
  NULL, NULL,
  '["https://crushmag-online.com/unveiling-rapt-a-chocolate-wonderland/", "https://www.capetownmagazine.com/chocolate-store"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rapt-district-six'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
