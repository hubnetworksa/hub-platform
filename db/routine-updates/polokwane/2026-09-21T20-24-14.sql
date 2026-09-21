INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'babirwa-travel-sterpark', 'Babirwa Travel',
  (SELECT id FROM suburbs WHERE slug = 'sterpark'),
  '27 Munnik Avenue, Sterpark, Polokwane, 0699', '015 291 5012', NULL, NULL,
  'Babirwa Travel, also branded Uniglobe Babirwa Travel, is a travel agency in Sterpark, Polokwane.',
  NULL, NULL,
  '["https://za.near-place.com/babirwa-travel-27-munnik-avenue-sterpark-polokwane", "https://www.yellosa.co.za/company/941237/uniglobe-babirwa-travel-sa"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'babirwa-travel-sterpark'),
  (SELECT id FROM categories WHERE slug = 'travel-agents'),
  1
);
