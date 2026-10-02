INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-kraaifontein-kraaifontein', 'KFC Kraaifontein',
  (SELECT id FROM suburbs WHERE slug = 'kraaifontein'),
  'Corner of Van Riebeeck & Old Paarl Road, Kraaifontein, 7570', '021 987 3937', NULL, NULL,
  'KFC Kraaifontein is a fast-food restaurant serving fried chicken, burgers and wings, in Kraaifontein.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/kraaifontein-cape-town/corner-of-van-riebeeck-&-old-paarl-road", "https://www.cylex.net.za/company/kfc-kraaifontein-17652236.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-kraaifontein-kraaifontein'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
