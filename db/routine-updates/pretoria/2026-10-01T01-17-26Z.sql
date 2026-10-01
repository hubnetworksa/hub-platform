INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'priva-waterkloof-heights', 'Priva',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof-heights'),
  (SELECT id FROM shopping_centers WHERE slug = 'waterkloof-heights-shopping-centre-waterkloof-heights'),
  'Waterkloof Heights Shopping Centre, 103 Club Avenue, Waterkloof Heights, Pretoria, 0181', '012 346 4849', NULL, NULL,
  'Priva is a fine-dining restaurant, champagne and cocktail lounge, cigar lounge and live-music venue in Waterkloof Heights Shopping Centre, offering tasting and a la carte menus, a wine cellar and a terrace overlooking Waterkloof Ridge.',
  NULL, NULL,
  '["https://www.dineplan.com/restaurants/priva-pretoria", "https://restaurantsforkings.com/city/pretoria/priva-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'priva-waterkloof-heights'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bicccs-waterkloof-heights', 'BICCCS',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof-heights'),
  'Club Avenue, Waterkloof Heights, Pretoria, 0065', '012 346 3203', NULL, NULL,
  'BICCCS is an Italian-style ice-cream parlour and cafe in Waterkloof Heights, also serving fresh bread, pastries, sandwiches and coffee, open seven days a week from early morning into the evening.',
  NULL, NULL,
  '["https://vymaps.com/ZA/BICCCS-481251/", "https://www.sa-venues.com/things-to-do/gauteng/bysuburb/waterkloof/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bicccs-waterkloof-heights'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
