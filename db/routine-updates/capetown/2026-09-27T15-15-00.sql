INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'francor-bakery-parow', 'Francor Bakery',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  '46 West Street, Parow, 7500', '021 930 4308', NULL, NULL,
  'Francor Bakery is a bakery and confectioner on West Street in Parow.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312669-d20920417-Reviews-Francor_Bakery-Parow_Western_Cape.html", "https://www.cybo.com/ZA-biz/francor-bakery"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'francor-bakery-parow'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);
