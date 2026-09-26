INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'phologo-health-care-lebowakgomo', 'Phologo Health Care',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  'Zone B, 2678, Lebowakgomo', '015 633 5081', NULL, NULL,
  'Phologo Health Care is a private clinic in Lebowakgomo Zone B offering medical and dental services.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=179880", "https://www.facebook.com/PhologoHealthCare/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'phologo-health-care-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'the-place-food-eatery-lebowakgomo', 'The Place Food Eatery',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  'Zone A Caravan Park, Lebowakgomo', '076 312 9760', NULL, NULL,
  'The Place Food Eatery is a sit-down and takeaway restaurant in Lebowakgomo serving an a la carte menu of seafood, meat, poultry and vegetarian dishes.',
  NULL, NULL,
  '["https://restaurantguru.com/The-Place-Food-Eatery-Lebowakgomo", "https://wanderlog.com/place/details/13595362/the-place-food-eatery"]',
  'published', 'agent_research', 'Mon-Sat 10:00-18:00'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-place-food-eatery-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
