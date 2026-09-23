-- Jobs 1-2: westridge suburb research, 1 new Westridge Shopping Centre tenant
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-grillfather-westridge-westridge', 'The Grillfather Westridge',
  (SELECT id FROM suburbs WHERE slug = 'westridge'),
  (SELECT id FROM shopping_centers WHERE slug = 'westridge-shopping-centre-westridge'),
  'Shop 15A, Westridge Shopping Centre, Simonsig Avenue, Westridge, Mitchells Plain, Cape Town', '084 319 2573', 'https://thegrillfather.co.za/', NULL,
  'The Grillfather Westridge is a grilled-chicken and fast-food takeaway in Westridge Shopping Centre, Mitchells Plain.',
  NULL, NULL,
  '["https://thegrillfather.co.za/contact/", "https://www.hungryfoody.com/za/the-grillfather-s-a-mitchells-plain/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-grillfather-westridge-westridge'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
