INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wills-cafe-deli-oranjezicht', 'Will''s Cafe & Deli',
  (SELECT id FROM suburbs WHERE slug = 'oranjezicht'),
  '22 Upper Orange Street, Oranjezicht, Cape Town', '021 465 0795', NULL, NULL,
  'Will''s Cafe & Deli is a delicatessen-style cafe on Upper Orange Street serving sandwiches, salads and breakfasts, in Oranjezicht.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/carluccis-oranjezicht/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d10470572-Reviews-Will_s_Cafe_Deli-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wills-cafe-deli-oranjezicht'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'coffee-time-oranjezicht', 'Coffee Time',
  (SELECT id FROM suburbs WHERE slug = 'oranjezicht'),
  '20 Breda Street, Oranjezicht, Cape Town', '021 461 8414', NULL, NULL,
  'Coffee Time is a kosher coffee shop and cafe on Breda Street that provides training and work opportunities for adults with special needs, in Oranjezicht.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d5789038-Reviews-Coffee_Time-Cape_Town_Central_Western_Cape.html", "https://za.africabz.com/western-cape/coffee-time-79683"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'coffee-time-oranjezicht'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
