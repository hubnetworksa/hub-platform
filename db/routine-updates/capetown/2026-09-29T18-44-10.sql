INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fresnaye-sports-club-fresnaye', 'Fresnaye Sports Club',
  (SELECT id FROM suburbs WHERE slug = 'fresnaye'),
  '15 Ave St Bartholomew, Sea Point, Cape Town, 8005', '021 434 2710', NULL, NULL,
  'Fresnaye Sports Club is a private members'' sports and social club established in 1928, offering tennis courts, lawn bowls, and a licensed bar and restaurant, in Fresnaye.',
  NULL, NULL,
  '["https://www.fresnayesportsclub.co.za/contact.html", "https://www.waze.com/live-map/directions/za/wc/cape-town/fresnaye-sports-club"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fresnaye-sports-club-fresnaye'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
