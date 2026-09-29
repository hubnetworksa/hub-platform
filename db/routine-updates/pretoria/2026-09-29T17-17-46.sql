INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lesi-lynnwood-manor', 'LeSi',
  (SELECT id FROM suburbs WHERE slug = 'lynnwood-manor'),
  '5 Darlington Road, Lynnwood Manor, Pretoria', '012 348 8820', 'https://casatoscana.co.za', NULL,
  'LeSi is a themed restaurant at Casa Toscana Lodge in Lynnwood Manor, offering a singing-waiter dining experience with breakfast, lunch and dinner service, private dining gazebos, and an extensive wine list.',
  NULL, NULL,
  '["https://www.sa-venues.com/things-to-do/gauteng/le-si-ristorante/", "https://whatsoninjoburg.com/event/lesi-restaurant-christmas-eve-dinner", "https://casatoscana.co.za"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lesi-lynnwood-manor'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
