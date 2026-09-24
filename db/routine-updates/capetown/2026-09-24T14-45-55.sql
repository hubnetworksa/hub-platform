INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cafe-nood-claremont', 'Cafe Nood',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  'Quadrant Square, Wilderness Road, Claremont, Cape Town, 7708', '021 671 4475', NULL, NULL,
  'Cafe Nood is a neighbourhood cafe in Claremont, popular for breakfast and lunch.',
  NULL, NULL,
  '["https://cafenood.co.za/contact/", "https://www.tripadvisor.com/ShowUserReviews-g2144715-d5264370-r374607405-Cafe_Nood-Claremont_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cafe-nood-claremont'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
