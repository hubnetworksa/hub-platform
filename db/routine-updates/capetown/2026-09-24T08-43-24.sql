INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'the-watershed-va-waterfront', 'The Watershed',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  '17 Dock Road, V&A Waterfront, Cape Town', NULL, NULL,
  '["https://insideguide.co.za/cape-town/things-to-do/the-watershed-at-the-va/", "https://www.waterfront.co.za/area/watershed/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'marble-va-waterfront', 'Marble',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  'Union Castle Building, Shop 7, 19 Dock Road, V&A Waterfront, Cape Town', '021 002 8484', NULL, NULL,
  'Marble is a fire-driven grill restaurant at the V&A Waterfront, known for live-fire cooking and a rooftop bar.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/marble/", "https://marble.restaurant/capetown/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'marble-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'le-bistrot-de-jan-va-waterfront', 'Le Bistrot de Jan',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  'InterContinental Table Bay, 6 West Quay Road, V&A Waterfront, Cape Town', '021 821 4180', NULL, NULL,
  'Le Bistrot de Jan is a French bistro by chef Jan Hendrik van der Westhuizen, inside the InterContinental Table Bay hotel at the V&A Waterfront.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/le-bistrot-de-jan-cape-town/", "https://janonline.com/le-bistrot-de-jan-cape-town/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'le-bistrot-de-jan-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-waterside-va-waterfront', 'The Waterside',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  '2 Pierhead Road, V&A Waterfront, Cape Town', '021 879 6328', NULL, NULL,
  'The Waterside is a seafood-focused restaurant by the La Colombe Restaurant Group, on the water''s edge at Pierhead Road.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/waterside/", "https://www.waterfront.co.za/eat-and-drink/the-waterside"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-waterside-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tang-va-waterfront', 'Tang',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  'Shop 153, 19 Breakwater Boulevard, V&A Waterfront, Cape Town', '076 652 8972', NULL, NULL,
  'Tang is an Asian restaurant and bar at the V&A Waterfront serving Cantonese- and Japanese-inspired cuisine.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/tang/", "https://www.waterfront.co.za/food_and_drinks/tang/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tang-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
