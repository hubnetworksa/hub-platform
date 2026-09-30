INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'coffee-on-18th-rietondale', 'Coffee on 18th',
  (SELECT id FROM suburbs WHERE slug = 'rietondale'),
  '232 18th Ave, Rietondale, Pretoria, 0186', '076 081 8181', NULL, NULL,
  'Coffee on 18th is a coffee shop in Rietondale, Pretoria, serving house-roasted coffee, cooked breakfasts, quiches, pancakes and sandwiches with free parking and outdoor seating; open Mon-Fri 7am-5pm and Sat 8am-3pm, closed Sundays.',
  NULL, NULL,
  '["https://www.gauteng.net/attractions/coffee-on-18th", "https://wanderlog.com/place/details/3303485/coffee-on-18th"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'coffee-on-18th-rietondale'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
