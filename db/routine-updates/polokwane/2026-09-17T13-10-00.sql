INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mcdonalds-seshego-circle-seshego', 'McDonald''s Seshego Circle',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  (SELECT id FROM shopping_centers WHERE slug = 'seshego-circle-seshego'),
  '2 Ditlou St, Seshego Circle Shopping Centre, Seshego-F, Seshego, Polokwane, 0742', '015 233 8410', NULL, 'Seshego@za.mcd.com',
  'McDonald''s Seshego Circle is a quick-service restaurant with a McCafe, in Seshego Circle Shopping Centre, Seshego.',
  NULL, NULL,
  '["https://www.pressreader.com/south-africa/polokwane-observer/20260917/281741276321304", "https://www.tiendeo.co.za/stores/seshego/mcdonald-s", "https://www.mcdonalds.co.za/templates/_layout/ajax_calls/get_all_locations.php?lat=0&long=0"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mcdonalds-seshego-circle-seshego'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
