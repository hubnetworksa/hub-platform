INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'apple-tree-creche-pre-school-annadale', 'Apple Tree Creche & Pre School',
  (SELECT id FROM suburbs WHERE slug = 'annadale'),
  '109 Pietersburg St, Annadale, Polokwane, 0699', '015 023 0169', NULL, NULL,
  'Apple Tree Creche & Pre School is a creche and pre-school in Annadale, Polokwane.',
  NULL, NULL,
  '["https://findapreschool.co.za/preschools/limpopo/polokwane", "https://www.facebook.com/p/Apple-Tree-Cr%C3%A8che-61562683847355/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'apple-tree-creche-pre-school-annadale'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
