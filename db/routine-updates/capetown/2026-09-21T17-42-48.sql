INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'our-local-sea-point', 'Our Local',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '295 Main Road, Sea Point, Cape Town', '069 665 3996', NULL, NULL,
  'Our Local is an all-day dining restaurant on Main Road in Sea Point, part of a small Cape Town restaurant group.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/our-local-sea-point/", "https://www.dineplan.com/restaurants/our-local-sea-point"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'our-local-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zeetan-turkish-restaurant-sea-point', 'Zeetan Turkish Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '233 Main Road, Sea Point, Cape Town', '078 647 1110', NULL, NULL,
  'Zeetan Turkish Restaurant is a Turkish restaurant on Main Road in Sea Point.',
  NULL, NULL,
  '["https://hungryforhalaal.co.za/listing/zeetan-turkish-sea-point/", "https://www.facebook.com/people/Zeetan_turkish_restaurant/100094511144986/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zeetan-turkish-restaurant-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'simply-asia-sea-point', 'Simply Asia',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  'Shop 8 & 9, Alice Court, 180 Main Road, Sea Point, Cape Town', '021 439 0610', NULL, NULL,
  'Simply Asia is a Thai and Asian cuisine restaurant in Alice Court on Main Road, Sea Point.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d1582092-Reviews-Simply_Asia_Sea_Point-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/simply-asiasea-point/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'simply-asia-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
