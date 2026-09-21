INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'maharajah-restaurant-rosebank', 'Maharajah Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'rosebank'),
  '8 Alma Road, Rosebank, Cape Town, 7700', '021 685 0714', 'https://www.maharajah.restaurant', NULL,
  'Maharajah Restaurant is an Indian restaurant on Alma Road in Rosebank.',
  NULL, NULL,
  '["https://www.maharajah.restaurant/contact-us/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d5597979-Reviews-Maharajah_Indian_Restaurant-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'maharajah-restaurant-rosebank'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
