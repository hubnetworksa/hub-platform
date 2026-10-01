INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-claremont-claremont', 'Pick n Pay Claremont',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  'Corner Main Road and Campground Road, Claremont, Cape Town, 7708', '021 674 5908', NULL, NULL,
  'Pick n Pay Claremont is a supermarket with a deli counter, hot food and a biltong bar, in Claremont.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/pick-n-pay-claremont-2757", "https://za.africabz.com/western-cape/pick-n-pay-claremont-6106"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-claremont-claremont'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
