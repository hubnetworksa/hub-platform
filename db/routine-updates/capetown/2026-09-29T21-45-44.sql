-- Jobs 1-2: Constantia suburb research -- new shopping centre (High Constantia Centre) with 4 tenants,
-- 1 tenant linked into the existing Constantia Village, and 2 standalone restaurants
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'high-constantia-centre-constantia', 'High Constantia Centre', (SELECT id FROM suburbs WHERE slug = 'constantia'),
  '1 Groot Constantia Main Road, Constantia, Cape Town, 7806', NULL, NULL,
  '["https://mungo.co.za/blog/meet-mungo-high-constantia/", "https://www.alamy.com/stock-image-shops-and-cafes-in-high-constantia-centre-in-cape-town-south-africa-165741062.html"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kleinskys-constantia', "Kleinsky's", (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'high-constantia-centre-constantia'),
  'High Constantia Centre, 1 Groot Constantia Main Road, Constantia, Cape Town, 7806', '021 301 0275', NULL, NULL,
  "Kleinsky's is a New York-style delicatessen in High Constantia Centre, serving bagels, breakfasts and deli classics.",
  NULL, NULL,
  '["https://www.timeout.com/cape-town/restaurants/kleinskys-constantia", "https://www.capetownetc.com/food-and-drink/kleinskys-delicatessen-review/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kleinskys-constantia'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'chardonnay-deli-constantia', 'Chardonnay Deli', (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'high-constantia-centre-constantia'),
  '87 Constantia Main Road, Constantia, Cape Town, 7806', '021 795 0606', NULL, NULL,
  'Chardonnay Deli is an artisan bakery and deli in High Constantia Centre selling rustic breads, pies, pastries and cakes, open for breakfast and lunch.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g312660-d7699737-Reviews-Chardonnay_Deli-Constantia_Western_Cape.html", "https://insideguide.co.za/cape-town/restaurants/chardonnay-deli/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'chardonnay-deli-constantia'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mungo-constantia', 'Mungo', (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'high-constantia-centre-constantia'),
  'High Constantia Centre, Main Road, Constantia, Cape Town', '021 518 0718', NULL, NULL,
  'Mungo is a homeware and textiles store in High Constantia Centre, part of the South African weaving brand.',
  NULL, NULL,
  '["https://mungo.co.za/blog/meet-mungo-high-constantia/", "https://www.tripadvisor.com/Attraction_Review-g1722390-d12163210-Reviews-Mungo-Cape_Town_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mungo-constantia'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'foxcroft-constantia', 'Foxcroft', (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'high-constantia-centre-constantia'),
  'Shop 8, High Constantia Centre, Groot Constantia Road, Constantia, Cape Town', '021 202 3304', NULL, NULL,
  'Foxcroft is a fine-dining restaurant in High Constantia Centre serving international and South African cuisine in a casual, considered setting.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/foxcroft-restaurant-and-bakery", "https://www.tripadvisor.co.za/Restaurant_Review-g312660-d10755380-Reviews-Foxcroft-Constantia_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'foxcroft-constantia'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

-- Cattle Baron: general suburb research turned up an existing-pattern chain branch confirmed inside
-- the already-known Constantia Village shopping centre, so it gets shopping_center_id in the same INSERT
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cattle-baron-constantia', 'Cattle Baron', (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'constantia-village-constantia'),
  '52 Constantia Main Road, Constantia Village, Constantia, Cape Town, 7806', '021 794 4930', NULL, NULL,
  'Cattle Baron is a steakhouse grill restaurant inside Constantia Village, Constantia.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g312660-d2390553-Reviews-Cattle_Baron_Constantia-Constantia_Western_Cape.html", "https://triptap.com/places/za/western-cape/cape-town/cattle-baron-constantia-t000c6f2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cattle-baron-constantia'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'parks-restaurant-constantia', 'Parks Restaurant', (SELECT id FROM suburbs WHERE slug = 'constantia'),
  '114 Constantia Main Road, Constantia, Cape Town', '021 761 0247', NULL, NULL,
  'Parks Restaurant is an Italian restaurant on Constantia Main Road serving time-honoured northern Italian cuisine.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g312660-d7375849-Reviews-95_at_Parks-Constantia_Western_Cape.html", "https://www.dineplan.com/restaurants/95-at-parks"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'parks-restaurant-constantia'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'little-fox-constantia', 'Little Fox', (SELECT id FROM suburbs WHERE slug = 'constantia'),
  'Constantia Nek, Constantia Main Road, Constantia, Cape Town, 7806', '021 202 3308', NULL, NULL,
  'Little Fox is a restaurant at the historic Constantia Nek, serving global, produce-driven small plates centred on the Constantia wine route.',
  NULL, NULL,
  '["https://www.eatout.co.za/article/la-colombe-group-opens-little-fox-their-new-restaurant-in-constantia/", "https://www.ewn.co.za/2026/03/01/little-fox-now-offers-second-dining-option-at-historic-constantia-nek"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'little-fox-constantia'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
