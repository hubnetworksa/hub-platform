INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'body-life-activity-zone-bendor', 'Body Life Activity Zone',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '100 Genl Maritz Street, Bendor Ext 8, Polokwane, 0699', '015 297 5850', NULL, NULL,
  'Body Life Activity Zone is a health and fitness club in Bendor, offering fitness and wellness programmes tailored to individual needs.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/bodylife-bendor", "https://za.polomap.com/polokwane/3145"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'body-life-activity-zone-bendor'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
