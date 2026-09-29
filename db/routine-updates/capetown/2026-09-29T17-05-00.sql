INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'harbour-house-camps-bay', 'Harbour House Camps Bay',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-promenade-camps-bay'),
  'Shop 4, Ground Floor, The Promenade, 87 Victoria Road, Camps Bay, Cape Town, 8040', '021 001 7889', NULL, NULL,
  'Harbour House Camps Bay is a seafood restaurant on the beachfront Promenade in Camps Bay, offering coastal cuisine with Mediterranean influences.',
  NULL, NULL,
  '["https://www.harbourhouse.co.za/", "https://www.foodandhome.co.za/entertaining/harbour-house-camps-bay-has-officially-opened-its-doors"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'harbour-house-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'umi-camps-bay', 'Umi',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  '201 The Promenade, Victoria Road, Marly Hotel, Camps Bay, 8040', '021 437 1802', NULL, NULL,
  'Umi is a Japanese and Asian fusion restaurant above the Camps Bay promenade at the Marly Hotel, with a whisky bar serving over 100 local and international labels.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312658-d5966649-Reviews-Umi-Camps_Bay_Western_Cape.html", "https://www.eatout.co.za/article/umi-marly-hotel-just-another-overpriced-camps-bay-restaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'umi-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'salsify-at-the-roundhouse-camps-bay', 'Salsify at The Roundhouse',
  (SELECT id FROM suburbs WHERE slug = 'camps-bay'),
  'The Roundhouse, Roundhouse Road, Camps Bay, Cape Town, 8005', '021 010 6444', NULL, NULL,
  'Salsify at The Roundhouse is a fine-dining restaurant inside the historic Roundhouse building in Camps Bay, led by chef Ryan Cole under the Luke Dale-Roberts restaurant group.',
  NULL, NULL,
  '["https://salsify.co.za/", "https://www.theworlds50best.com/discovery/Establishments/South-Africa/Cape-Town/Salsify-at-the-Roundhouse.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'salsify-at-the-roundhouse-camps-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
