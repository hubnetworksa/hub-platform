INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-blue-cafe-tamboerskloof', 'The Blue Cafe',
  (SELECT id FROM suburbs WHERE slug = 'tamboerskloof'),
  '13 Brownlow Road, Tamboerskloof, Cape Town', '021 426 0250', NULL, NULL,
  'The Blue Cafe is a neighbourhood general dealer and sidewalk cafe on Brownlow Road, trading since 1903, in Tamboerskloof.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/blue-cafe", "https://www.chrisvonulmenstein.com/blog/cape-town/neighbourhood-treasure-the-blue-cafe-opens-in-tamboerskloof-as-deli-and-general-dealer/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-blue-cafe-tamboerskloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'el-burro-taqueria-tamboerskloof', 'El Burro Taqueria',
  (SELECT id FROM suburbs WHERE slug = 'tamboerskloof'),
  '12 Kloof Nek Road, Corner of Kloof Nek and New Church Street, Tamboerskloof, Cape Town', '021 422 3554', NULL, NULL,
  'El Burro Taqueria is a Mexican restaurant at the corner of Kloof Nek and New Church Street serving tacos, quesadillas and tequila, in Tamboerskloof.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/el-burro-taqueria-kloof-nek-43", "https://za.africabz.com/western-cape/el-burro-taqueria-kloof-nek-457"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'el-burro-taqueria-tamboerskloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'beleza-tamboerskloof', 'Beleza',
  (SELECT id FROM suburbs WHERE slug = 'tamboerskloof'),
  'Corner of Burnside and Kloof Nek Roads, Tamboerskloof, Cape Town', '021 426 0795', NULL, NULL,
  'Beleza is a Portuguese and Italian restaurant and bar at the corner of Burnside and Kloof Nek Roads, trading since 2005, in Tamboerskloof.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/cafes/beleza-restaurant-and-bar-in-cape-town/93_22_18757", "https://www.sa-venues.com/things-to-do/westerncape/beleza-restaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'beleza-tamboerskloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
