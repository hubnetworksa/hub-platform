INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cashbuild-gugulethu-square-gugulethu', 'Cashbuild',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Shop 81, Gugulethu Square, NY3, Gugulethu, Cape Town, 7750',
  '021 637 1004', NULL, 'smgugulethusquare@cashbuild.co.za',
  'Cashbuild is a building materials retailer inside Gugulethu Square, selling cement, hardware, and construction supplies.',
  NULL, NULL,
  '["https://locations.cashbuild.co.za/Retail-GuguletuSquare-CashbuildGugulethu", "https://www.cylex.net.za/company/cashbuild-23707905.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cashbuild-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mcdonalds-gugulethu-square-gugulethu', 'McDonald''s Gugulethu',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Gugulethu Square, NY3, Gugulethu, Cape Town, 7750',
  '021 699 3821', 'https://www.mcdonalds.co.za/location/mcdonalds-gugulethu', NULL,
  'McDonald''s Gugulethu is a fast-food restaurant with a drive-thru inside Gugulethu Square.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g1722390-d23211923-Reviews-McDonald_s_Gugulethu-Cape_Town_Western_Cape.html", "https://www.findmy.co.za/food/category-detail/mcdonalds-gugulethu/24294"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mcdonalds-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
