INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dawood-butchery-delft', 'Dawood Butchery',
  (SELECT id FROM suburbs WHERE slug = 'delft'),
  '100 Delft Main Road, The Hague, Delft, Cape Town, 7100', '021 956 2191', NULL, NULL,
  'Dawood Butchery is a halaal butchery in The Hague, Delft, serving the community with beef, lamb and other meat products.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/dawood-butchery_1I", "https://www.yep.co.za/biz/store/iyp/6885283_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dawood-butchery-delft'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
