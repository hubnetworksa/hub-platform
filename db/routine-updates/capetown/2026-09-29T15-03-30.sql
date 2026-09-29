INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pier-va-waterfront', 'Pier',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  'Pierhead Building, Pierhead, V&A Waterfront, Cape Town, 8001', '021 879 6328', NULL, 'reservations@pier.restaurant',
  'Pier is a fine-dining restaurant at the Pierhead in the V&A Waterfront, offering an intimate multi-course tasting menu with views over the harbour.',
  NULL, NULL,
  '["https://www.waterfront.co.za/eat-and-drink/pier", "https://www.lacolombe.restaurant/pier"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pier-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'coy-va-waterfront', 'COY',
  (SELECT id FROM suburbs WHERE slug = 'va-waterfront'),
  'Shop 151, The Scherwyn Pavilion Building, V&A Waterfront, Cape Town', '021 207 3278', NULL, 'reservations@coyrestaurant.com',
  'COY is a fine-dining restaurant at the V&A Waterfront led by chef Ryan Cole, with an ocean-focused menu drawing on African flavours.',
  NULL, NULL,
  '["https://coyrestaurant.com/", "https://www.foodandhome.co.za/entertaining/chef-ryan-cole-to-open-coy-restaurant-at-the-va-waterfront"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'coy-va-waterfront'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
