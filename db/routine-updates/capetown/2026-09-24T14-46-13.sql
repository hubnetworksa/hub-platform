INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bihari-newlands', 'Bihari',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  '7 Main Road, Newlands, Cape Town, 7700', '021 674 7186', NULL, NULL,
  'Bihari is a North Indian restaurant on the ground floor of the Southern Sun hotel in Newlands.',
  NULL, NULL,
  '["https://www.southernsun.com/southern-sun-newlands/dining/bihari-indian-restaurant", "https://za.africabz.com/western-cape/bihari-11238"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bihari-newlands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'copper-club-eatery-newlands', 'Copper Club Eatery',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'dean-street-arcade-newlands'),
  '3 Main Street, Dean Street Arcade, Newlands, Cape Town, 7700', '021 687 0025', NULL, NULL,
  'Copper Club Eatery is a cafe in Dean Street Arcade, Newlands.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/copper-club-eatery-newlands/", "https://za.africabz.com/western-cape/copper-club-eatery-17164"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'copper-club-eatery-newlands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'montebello-design-centre-newlands', 'Montebello Design Centre',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  '31 Newlands Avenue, Newlands, Cape Town, 7708', NULL, NULL,
  '["https://en.wikipedia.org/wiki/Montebello_Design_Centre", "https://www.montebello.co.za/contact.htm"]',
  'mall'
);
