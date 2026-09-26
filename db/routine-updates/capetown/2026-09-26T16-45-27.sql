INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-coffee-station-and-bakery-scarborough', 'The Coffee Station & Bakery',
  (SELECT id FROM suburbs WHERE slug = 'scarborough'),
  (SELECT id FROM shopping_centers WHERE slug = 'village-hub-scarborough'),
  '2 Watsonia Lane, The Village Hub, Scarborough, Cape Town, 7975', '071 342 5210', NULL, NULL,
  'The Coffee Station & Bakery is a coffee and bakery counter inside The Village Hub, Scarborough.',
  NULL, NULL,
  '["https://www.thevillagehub.co.za/coffee-station/", "https://www.findmy.co.za/food/category-detail/the-hub-caf-/22653"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-coffee-station-and-bakery-scarborough'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
