INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'simply-asia-lakeside', 'Simply Asia',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  (SELECT id FROM shopping_centers WHERE slug = 'lakeside-centre-lakeside'),
  'Shop 6, Lakeside Centre, Main Road, Lakeside, Cape Town, 7945', '021 788 2247', NULL, NULL,
  'Simply Asia is a Pan-Asian restaurant in Lakeside Centre, Lakeside, serving Thai, sushi and other Asian dishes.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/simply-asia-lakeside/", "https://www.dining-out.co.za/md/Simply-Asia-Lakeside/8588"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'simply-asia-lakeside'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'feet4life-lakeside-lakeside', 'Feet4Life Lakeside',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  'Stone Village Wellness Centre, 461 Main Road, Lakeside, Cape Town, 7945', '021 795 0012', NULL, NULL,
  'Feet4Life Lakeside is a podiatry practice at Stone Village Wellness Centre in Lakeside, treating biomechanical, sports-related and diabetic foot conditions.',
  NULL, NULL,
  '["https://feet4life.co.za/lakeside/", "https://nearmedoctors.com/business/feet4life-podiatrist-lakeside-excellent-podiatrist-in-cape-town/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'feet4life-lakeside-lakeside'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
