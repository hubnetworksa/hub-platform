INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'erasmus-dental-fauna-park', 'Erasmus Dental',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  '288 Marshall Street, Fauna Park, Polokwane', '015 296 1129', NULL, NULL,
  'Erasmus Dental is a dental practice in Fauna Park offering general, cosmetic and orthodontic dentistry.',
  NULL, NULL,
  '["https://www.facebook.com/p/ErasmusDental_PLK-61550477410207/", "https://www.medpages.info/sf/index.php?page=person&personcode=10037"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'erasmus-dental-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ashas-lifestyle-house-fauna-park', 'Asha''s Lifestyle House',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  '58 Thabo Mbeki Street (R71), Fauna Park, Polokwane', '072 898 0985', NULL, NULL,
  'Asha''s Lifestyle House is a restaurant in Fauna Park combined with a boutique selling ladies'', men''s, kids'' and bridal clothing.',
  NULL, NULL,
  '["https://www.mrdfood.com/food-delivery/restaurant/ashas-lifestyle-house_fauna-park/15207", "https://za.polomap.com/polokwane/16235"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ashas-lifestyle-house-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
