-- Jobs 1-2: Claremont suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'j-s-sushi-claremont-claremont', 'J&S Sushi Claremont',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  '227C Main Rd, Claremont, Cape Town, 7708', '068 259 0518', NULL, NULL,
  'J&S Sushi Claremont is a sushi restaurant on Main Road offering a range of Japanese-style sushi and rolls for dine-in and delivery.',
  NULL, NULL,
  '["https://www.mrdfood.com/food-delivery/restaurant/jands-sushi-claremont_claremont/22835", "https://www.ubereats.com/za/store/j&s-sushi-claremont/q_zWjJa5UearC-Rgm1eCvw"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'j-s-sushi-claremont-claremont'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
