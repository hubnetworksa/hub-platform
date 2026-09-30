INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'maphindis-braai-place-nyanga', 'Maphindi''s Braai Place',
  (SELECT id FROM suburbs WHERE slug = 'nyanga'),
  '3rd Avenue, Nyanga, Cape Town, 7750', '021 386 0582', NULL, NULL,
  'Maphindi''s Braai Place is a shisa nyama-style braai restaurant and butchery in Nyanga, serving flame-grilled meat, wors, pap and vetkoek with outdoor communal seating.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/maphindis/", "https://www.findmy.co.za/food/category-detail/maphindis-braai-place/22908"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'maphindis-braai-place-nyanga'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
