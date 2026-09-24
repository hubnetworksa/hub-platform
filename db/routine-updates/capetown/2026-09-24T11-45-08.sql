INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'chinchilla-rooftop-cafe-and-bar-camps-bay', 'Chinchilla Rooftop Café & Bar',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  'Shop 120, Second Floor, The Promenade, Victoria Road, Camps Bay, Cape Town, 8002', '021 286 5075', NULL, NULL,
  'Chinchilla Rooftop Café & Bar is a rooftop cocktail bar and restaurant serving cocktails, wine and a continental menu, in The Promenade, Camps Bay.',
  NULL, NULL,
  '["https://www.kovecollection.co.za/chinchilla/", "https://www.tripadvisor.com/Restaurant_Review-g312658-d13190557-Reviews-Chinchilla_Rooftop_Cafe_Bar-Camps_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'chinchilla-rooftop-cafe-and-bar-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'plant-camps-bay', 'Plant',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  '87 Victoria Road, The Promenade, Camps Bay, Cape Town, 8005', '076 296 1665', NULL, NULL,
  'Plant is a vegan restaurant serving breakfast, lunch and dinner, in The Promenade, Camps Bay.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g312658-d19253565-Reviews-Plant-Camps_Bay_Western_Cape.html", "https://www.eatout.co.za/venue/plant-cafe-camps-bay/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'plant-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'traders-camps-bay', 'Traders',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  'The Bay Hotel, 69 Victoria Road, Camps Bay, Cape Town', '021 430 4444', NULL, NULL,
  'Traders is a restaurant at The Bay Hotel, in Camps Bay.',
  NULL, NULL,
  '["https://thebayhotel.com/contact/", "https://www.campsbayapartments.com/camps-bay-restaurants/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'traders-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
