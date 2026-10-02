INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'john-dory-s-century-city-century-city', 'John Dory''s Century City',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  (SELECT id FROM shopping_centers WHERE slug = 'canal-walk-century-city'),
  'Shop 483, Canal Walk Shopping Centre, Century Boulevard, Century City, Cape Town, 7441', '021 551 6443', NULL, NULL,
  'John Dory''s Century City is a seafood restaurant serving fish, grills and sushi, in Canal Walk Shopping Centre, Century City.',
  NULL, NULL,
  '["https://www.johndorys.com/za/restaurants/western-cape/john-dorys-century-city", "https://www.eatout.co.za/venue/john-dorys-century-city/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'john-dory-s-century-city-century-city'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
