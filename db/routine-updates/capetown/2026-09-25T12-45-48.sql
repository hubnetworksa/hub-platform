INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-wetton-lansdowne', 'KFC Wetton',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  (SELECT id FROM shopping_centers WHERE slug = 'lansdowne-corner-shopping-centre-lansdowne'),
  'Cnr Jan Smuts Drive & Lansdowne Road, Lansdowne Corner Shopping Centre, Lansdowne, Cape Town, 7780', '021 703 2047', NULL, NULL,
  'KFC Wetton is a fast-food restaurant inside Lansdowne Corner Shopping Centre, Lansdowne.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1722390-d24193082-Reviews-KFC_Wetton-Cape_Town_Western_Cape.html", "https://www.mrd.com/delivery/restaurant/kfc-wetton-lansdowne-shopping-centre-lansdowne/20654"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-wetton-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
