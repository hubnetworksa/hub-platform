INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bo-kaap-kombuis-bo-kaap', 'Bo-Kaap Kombuis',
  (SELECT id FROM suburbs WHERE slug = 'bo-kaap'),
  '7 August Street, Bo-Kaap, Cape Town', '021 422 5446', NULL, NULL,
  'Bo-Kaap Kombuis is a traditional Cape Malay restaurant, in Bo-Kaap.',
  NULL, NULL,
  '["https://bokaapkombuis.co.za/contact/", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d3736702-Reviews-Bo_Kaap_Kombuis-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bo-kaap-kombuis-bo-kaap'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bo-kaap-deli-bo-kaap', 'Bo-Kaap Deli',
  (SELECT id FROM suburbs WHERE slug = 'bo-kaap'),
  '114 Church Street, Bo-Kaap, Cape Town', '076 346 6207', NULL, NULL,
  'Bo-Kaap Deli is a cafe and restaurant serving Cape Malay and Middle Eastern inspired food, in Bo-Kaap.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/Bo-Kaap-Deli/10730", "https://www.tripadvisor.com/Restaurant_Review-g312659-d27458194-Reviews-Bo_Kaap_Deli-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bo-kaap-deli-bo-kaap'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lions-bread-bo-kaap', 'Lion''s Bread',
  (SELECT id FROM suburbs WHERE slug = 'bo-kaap'),
  '81 Rose Street, Bo-Kaap, Cape Town', '082 908 9879', NULL, NULL,
  'Lion''s Bread is an artisan bakery specialising in slow-fermented sourdough, pastries and toasties, in Bo-Kaap.',
  NULL, NULL,
  '["https://lionsbread.co.za/", "https://www.wantedonline.co.za/food-and-drink/2026-03-20-for-wanted-online-do-not-publish-a-bakery-with-lions-heart/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lions-bread-bo-kaap'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bo-kaap-museum-bo-kaap', 'Bo-Kaap Museum',
  (SELECT id FROM suburbs WHERE slug = 'bo-kaap'),
  '71 Wale Street, Bo-Kaap, Cape Town', '021 462 1609', NULL, NULL,
  'Bo-Kaap Museum is a heritage museum housed in a restored 18th-century Cape Malay dwelling, in Bo-Kaap.',
  NULL, NULL,
  '["https://www.iziko.org.za/museums/bo-kaap-museum/", "https://www.lekkeslaap.co.za/attractions/bo-kaap-museum"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bo-kaap-museum-bo-kaap'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'biesmiellah-bo-kaap', 'Biesmiellah',
  (SELECT id FROM suburbs WHERE slug = 'bo-kaap'),
  '2 Wale St & Pentz St, Bo-Kaap, Cape Town', '021 423 0850', NULL, NULL,
  'Biesmiellah is a Cape Malay restaurant, in Bo-Kaap.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d1588434-Reviews-Biesmiellah-Cape_Town_Central_Western_Cape.html", "https://www.capetown.travel/attractions/discover-the-authentic-flavours-of-cape-malay-cuisine-at-biesmiellah-restaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'biesmiellah-bo-kaap'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'atlas-trading-company-bo-kaap', 'Atlas Trading Company',
  (SELECT id FROM suburbs WHERE slug = 'bo-kaap'),
  '104 Wale Street, Bo-Kaap, Cape Town', '021 423 4361', NULL, NULL,
  'Atlas Trading Company is a spice shop trading since 1946, in Bo-Kaap.',
  NULL, NULL,
  '["https://atlastradingonline.com/pages/about-us", "https://www.capetownmagazine.com/atlas"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'atlas-trading-company-bo-kaap'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
