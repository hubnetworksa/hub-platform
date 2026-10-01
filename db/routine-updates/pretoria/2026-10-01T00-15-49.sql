INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'blu-saffron-waterkloof', 'Blu Saffron',
  (SELECT id FROM suburbs WHERE slug = 'waterkloof'),
  '241 Sidney Avenue, Waterkloof, Pretoria, 0181', '012 346 0223', NULL, NULL,
  'Blu Saffron is a restaurant and bar at the Pretoria Country Club in Waterkloof, with lounges, a bar and an outdoor patio overlooking the golf course, serving South African, steak, seafood and grill dishes.',
  NULL, NULL,
  '["https://www.eatout.co.za/?p=102253", "https://wanderlog.com/place/details/1296458/blu-saffron"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'blu-saffron-waterkloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
