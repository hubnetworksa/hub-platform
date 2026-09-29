INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tadka-claremont', 'Tadka',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  '214 Main Road, Claremont, Cape Town, 7800', '021 672 0640', NULL, NULL,
  'Tadka is an Indian multicuisine restaurant in Claremont offering fine dining, takeaway and a fully licensed bar.',
  NULL, NULL,
  '["https://tadka.co.za/index.php/menu", "https://www.tripadvisor.co.za/Restaurant_Review-g2144715-d23170348-Reviews-Tadka_Indian_Multicuisine_Restaurant-Claremont_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tadka-claremont'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'korean-kitchen-claremont', 'Korean Kitchen',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  '103 Main Road, Claremont, Cape Town', '021 671 4604', NULL, NULL,
  'Korean Kitchen is a Korean restaurant in Claremont serving Korean BBQ and traditional dishes.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/Korean-Kitchen/10659", "https://koreankitchen.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'korean-kitchen-claremont'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'exact-claremont', 'Exact',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  'Shop 4, Warwick Place, Main Road, Claremont, Cape Town, 7700', '021 674 0208', NULL, NULL,
  'Exact is an electronics and computer store in Warwick Place, Claremont.',
  NULL, NULL,
  '["https://www.guzzle.co.za/exact/claremont/", "https://finderafrica.com/listing/exact-claremont/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'exact-claremont'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);
