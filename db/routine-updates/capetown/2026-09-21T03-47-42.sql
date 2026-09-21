-- Job 1-2: marina-da-gama -- new shopping centre + 1 verified tenant

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'eastlake-shopping-centre-marina-da-gama', 'Eastlake Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'marina-da-gama'),
  'Eastlake Drive, Marina Da Gama, Muizenberg, Cape Town, 7945', NULL, NULL,
  '["https://2pos.co.za/2/2972", "https://za.africabz.com/western-cape/eastlake-shopping-centre-29765", "http://textmap.co.za/3/4458"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'marina-pub-and-bistro-marina-da-gama', 'Marina Pub and Bistro',
  (SELECT id FROM suburbs WHERE slug = 'marina-da-gama'),
  (SELECT id FROM shopping_centers WHERE slug = 'eastlake-shopping-centre-marina-da-gama'),
  'Shop 36, Eastlake Shopping Centre, Eastlake Drive, Marina Da Gama, Muizenberg, Cape Town, 7945',
  '069 592 5495', NULL, NULL,
  'Marina Pub and Bistro is a pub and bistro in Eastlake Shopping Centre, Marina Da Gama.',
  NULL, NULL,
  '["https://www.tripadvisor.com/LocationPhotoDirectLink-g4606907-i481281035-Marina_da_Gama_Western_Cape.html", "https://heyrestaurants.co.za/02048641/Marina_Pub_and_Bistro", "https://www.facebook.com/MarinaPubAndBistro/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'marina-pub-and-bistro-marina-da-gama'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
