INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'masana-cafe-moregloed', 'Masana Cafe',
  (SELECT id FROM suburbs WHERE slug = 'moregloed'),
  '99 Johnson Street, Moregloed, Polokwane', '015 291 1625', NULL, NULL,
  'Masana Cafe is a restaurant and bar in Moregloed serving home-cooked traditional meals alongside braai meat and pizza.',
  NULL, NULL,
  '["https://www.facebook.com/masanacafe99/", "http://www.findglocal.com/ZA/Polokwane/710158632346247/Masana-Lodge"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'masana-cafe-moregloed'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
