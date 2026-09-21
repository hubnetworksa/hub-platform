INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ocean-view-house-bakoven', 'Ocean View House',
  (SELECT id FROM suburbs WHERE slug = 'bakoven'),
  '33 Victoria Road, Bakoven, Cape Town', '021 438 1982', NULL, NULL,
  'Ocean View House is a 4-star guest house in Bakoven with individually decorated rooms and views across the Atlantic Ocean.',
  NULL, NULL,
  '["https://oceanview-house.com/contact-us", "https://www.tripadvisor.com/Hotel_Review-g4574140-d316622-Reviews-Ocean_View_House-Bakoven_Camps_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ocean-view-house-bakoven'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
