INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fat-harrys-harfield-village', 'Fat Harry''s',
  (SELECT id FROM suburbs WHERE slug = 'harfield-village'),
  '166 2nd Avenue, Harfield Village, Cape Town', '021 671 7433', NULL, NULL,
  'Fat Harry''s is a restaurant and bar on 2nd Avenue, Harfield Village, known for burgers and craft beer.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/fat-harrys-restaurant-and-bar", "https://nearbyza.com/place/fat-harry-s"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fat-harrys-harfield-village'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'brads-grill-harfield-village', 'Brad''s Grill',
  (SELECT id FROM suburbs WHERE slug = 'harfield-village'),
  '69 2nd Avenue, Harfield Village, Cape Town', '021 671 2527', 'http://bradsgrill-claremont.co.za', NULL,
  'Brad''s Grill is a steakhouse on 2nd Avenue, Harfield Village.',
  NULL, NULL,
  '["http://bradsgrill-claremont.co.za/about.html", "https://www.tripadvisor.co.za/Restaurant_Review-g2144715-d4090837-Reviews-Brads_Grill-Claremont_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'brads-grill-harfield-village'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
