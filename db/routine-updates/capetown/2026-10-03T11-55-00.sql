INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'on-the-rocks-restaurant-bloubergstrand', 'On the Rocks Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  '45 Stadler Road, Bloubergstrand, Cape Town, 7441', '021 554 1988', NULL, NULL,
  'On the Rocks Restaurant is a seafood restaurant on the water''s edge in Bloubergstrand, with views of Table Mountain and Robben Island.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/westerncape/on-the-rocks-restaurant/", "https://cvent.com/venues/cape-town/restaurant/on-the-rocks/venue-729c7c45-e2a7-4c6e-93f5-b018c4b7811c"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'on-the-rocks-restaurant-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
