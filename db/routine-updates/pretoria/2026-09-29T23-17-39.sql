INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'panarottis-montana-montana', 'Panarottis Montana',
  (SELECT id FROM suburbs WHERE slug = 'montana'),
  (SELECT id FROM shopping_centers WHERE slug = 'kolonnade-shopping-centre-montana'),
  'Shop 29, Kolonnade Shopping Centre, Zambesi Dr, Montana, Pretoria, 0151', '012 548 0500', NULL, NULL,
  'Panarottis Montana is a branch of the family-style Italian restaurant chain inside Kolonnade Shopping Centre, serving pizzas, pastas and a dedicated kids'' menu, open daily from 8am to 10pm, in Montana, Pretoria.',
  NULL, NULL,
  '["https://www.eatout.co.za/?p=103635", "https://au.trip.com/restaurant/south%20africa/pretoria/detail/Panarottis%20Montana-19861152"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'panarottis-montana-montana'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
