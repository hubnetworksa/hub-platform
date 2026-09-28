INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nandos-grassy-park', 'Nando''s (Grassy Park)',
  (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  'Cnr Prince George Dr & 5th Ave, Grassy Park, Cape Town, 7888', '021 706 0436', NULL, NULL,
  'Nando''s (Grassy Park) is a PERi-PERi chicken restaurant with a drive-thru at the corner of Prince George Drive and 5th Avenue, Grassy Park.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/grassy-park/takeaway-foods/nandos", "https://www.sayellow.com/view/south-africa/nandos-grassy-park-drive-thru-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nandos-grassy-park'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pedros-grassy-park', 'Pedros Grassy Park',
  (SELECT id FROM suburbs WHERE slug = 'grassy-park'),
  'Shop 1, Cnr Victoria Rd & Klip Rd, Grassy Park, Cape Town', '021 203 5252', NULL, NULL,
  'Pedros Grassy Park is a fast-food chicken restaurant at the corner of Victoria Road and Klip Road, Grassy Park.',
  NULL, NULL,
  '["https://restaurants-in-cape-town.co.za/restaurants/pedros-grassy-park/", "https://restaurantguru.com/Pedros-Grassy-Park-Cape-Town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pedros-grassy-park'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
