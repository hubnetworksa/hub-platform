INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-sunshine-food-sprouting-co-african-vegan-cafe-three-anchor-bay', 'The Sunshine Food Sprouting Co African Vegan Café',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '6 Main Road, Three Anchor Bay, Cape Town, 8005', '081 825 0925', NULL, NULL,
  'The Sunshine Food Sprouting Co African Vegan Café is a Black-owned, plant-based café in Three Anchor Bay serving 100% organic vegan dishes with an African influence.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g15555242-d17659802-Reviews-The_Sunshine_Food_Co-Three_Anchor_Bay_Western_Cape.html", "https://www.ubereats.com/za/store/the-sunshine-food-sprouting-co-vegan-cafe/pcVHOJx0STKc3UWf1uwbGw"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-sunshine-food-sprouting-co-african-vegan-cafe-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lellos-trattoria-three-anchor-bay', 'Lello''s Trattoria',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '7 Penarth Road, Three Anchor Bay, Cape Town, 8005', '060 795 9071', NULL, NULL,
  'Lello''s Trattoria is a family-run Italian trattoria and aperitivo bar in Three Anchor Bay, serving fresh pasta, pizza al taglio and other Roman-inspired dishes.',
  NULL, NULL,
  '["https://wanderlog.com/place/details/7837478/lellos-trattoria", "https://mindtrip.ai/attraction/cape-town-western/lellos-trattoria/at-SDTG4BzI"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lellos-trattoria-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
