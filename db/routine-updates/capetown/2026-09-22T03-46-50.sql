INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ashleys-family-restaurant-goodwood', 'Ashley''s Family Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  '123 Voortrekker Road, Goodwood, Cape Town, 7460', '021 591 8555', NULL, NULL,
  'Ashley''s Family Restaurant is a family-run steakhouse and pizzeria on Voortrekker Road in Goodwood, known for large portions of steaks, pizza and burgers.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1841250-d3878588-Reviews-or45-Ashley_s_Family_Restaurant-Goodwood_Western_Cape.html", "https://www.facebook.com/Ashleysfamilyrestaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ashleys-family-restaurant-goodwood'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
