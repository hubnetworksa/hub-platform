INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'betsekgadi-community-projects-cc-fauna-park', 'Betsekgadi Community Projects CC',
  (SELECT id FROM suburbs WHERE slug = 'fauna-park'),
  '123 Grobler Street, Fauna Park, Polokwane', '015 296 4798', NULL, NULL,
  'Betsekgadi Community Projects CC is a civil and concrete construction contractor based in Fauna Park, Polokwane.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/betsekgadi-community-projects-polokwane", "https://www.yep.co.za/business/16946902_3"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'betsekgadi-community-projects-cc-fauna-park'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);
