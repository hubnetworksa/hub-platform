INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mcdonalds-blue-downs', 'McDonald''s Blue Downs',
  (SELECT id FROM suburbs WHERE slug = 'blue-downs'),
  'Hindle Road, Blue Downs, Cape Town, 7100', '021 901 2050', NULL, NULL,
  'McDonald''s Blue Downs is a fast-food restaurant with a drive-thru, serving burgers and other quick-service meals in Blue Downs.',
  NULL, NULL,
  '["https://www.mcdonalds.co.za/location/mcdonalds-blue-downs", "https://www.tripadvisor.com/Restaurant_Review-g312659-d32995172-Reviews-Mcdonald_s_Blue_Downs-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mcdonalds-blue-downs'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ok-furniture-blue-downs', 'OK Furniture Blue Downs',
  (SELECT id FROM suburbs WHERE slug = 'blue-downs'),
  (SELECT id FROM shopping_centers WHERE slug = 'blue-downs-shopping-centre-blue-downs'),
  'Shop 25, Cavalier Centre, Hindle Road, Blue Downs, Cape Town, 7100', '021 909 9240', NULL, NULL,
  'OK Furniture Blue Downs is a furniture and home essentials retailer in the Blue Downs Shopping Centre.',
  NULL, NULL,
  '["https://www.okfurniture.co.za/blue-downs", "https://appliancerepair.co.za/places/ok-furniture-blue-downs/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ok-furniture-blue-downs'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
