-- Jobs 1-2: Somerset West suburb research
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pomodoro-somerset-west', 'Pomodoro',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  'Lion''s Square, Main Road, Somerset West, 7130', '021 851 1805', NULL, NULL,
  'Pomodoro is an Italian restaurant at Lion''s Square on Main Road, Somerset West, known for its wood-fired pizzas and pasta, offering sit-down, takeaway and delivery.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g469396-d2655710-Reviews-Pomodoro_Authentic_Italian-Somerset_West_Western_Cape.html", "https://za.2pos.info/84/7404"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pomodoro-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kwikspar-somerset-lions-square-somerset-west', 'KwikSpar Somerset@Lion''s Square',
  (SELECT id FROM suburbs WHERE slug = 'somerset-west'),
  '150 Main Road, Cnr Huising & Main Street, Lion Square, Somerset West, 7130', '021 851 5795', NULL, NULL,
  'KwikSpar Somerset@Lion''s Square is a supermarket at Lion''s Square on Main Road, Somerset West, with an in-house bakery, deli and butchery.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/kwikspar-somersetlions-square-190153", "https://kookaloney.com/stores/kwikspar-somersetlions-square/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kwikspar-somerset-lions-square-somerset-west'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
