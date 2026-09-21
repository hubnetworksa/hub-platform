INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  '1890-house-sushi-grill-observatory', '1890 House Sushi & Grill',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '40 Trill Road, Observatory, Cape Town', '021 447 1450', NULL, NULL,
  '1890 House Sushi & Grill is a sushi and Asian-cuisine restaurant on Trill Road, in Observatory.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d2326265-Reviews-1890_House_Sushi-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/1890-house-sushi-and-grill-16784"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '1890-house-sushi-grill-observatory'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sonder-cafe-observatory', 'Sonder Cafe',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '79 Lower Main Road, Observatory, Cape Town', '083 394 6672', NULL, NULL,
  'Sonder Cafe is a New York-style bagel and brunch cafe on Lower Main Road, in Observatory.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/sonder-cafe", "https://www.tripadvisor.com/Restaurant_Review-g2427107-d23165227-Reviews-Sonder_Cafe-Observatory_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sonder-cafe-observatory'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'timbuktu-cafe-observatory', 'Timbuktu Cafe',
  (SELECT id FROM suburbs WHERE slug = 'observatory'),
  '16 Lower Main Road, Observatory, Cape Town', '072 283 6739', NULL, NULL,
  'Timbuktu Cafe is an Ethiopian restaurant on Lower Main Road, in Observatory.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d6539167-Reviews-Timbuktu_Cafe-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/timbuktu-23020"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'timbuktu-cafe-observatory'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
