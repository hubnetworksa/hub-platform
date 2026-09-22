INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'going-under-clothing-nyanga-junction-manenberg', 'Going Under Clothing',
  (SELECT id FROM suburbs WHERE slug = 'manenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'nyanga-junction-shopping-centre-manenberg'),
  'Shop 35, Nyanga Junction Shopping Centre, Duinefontein Road, Manenberg, Cape Town, 7764', '021 691 0247', NULL, NULL,
  'Going Under Clothing is a branch of the value fashion retail chain, in Nyanga Junction Shopping Centre.',
  NULL, NULL,
  '["https://www.goingunder.co.za/find-our-stores/", "https://m.guzzle.co.za/retailer/1752/nyanga/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'going-under-clothing-nyanga-junction-manenberg'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
