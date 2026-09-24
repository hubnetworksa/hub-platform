-- Rondebosch East: 1 new business discovered via general suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eden-beauty-collection-rondebosch-east', 'Eden Beauty Collection',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch-east'),
  '6A Kromboom Road, Rondebosch East, Cape Town, 7700', '083 707 3828', NULL, NULL,
  'Eden Beauty Collection is a hair and beauty salon on Kromboom Road, Rondebosch East, offering hair styling, laser hair removal and beauty treatments.',
  NULL, NULL,
  '["https://www.fresha.com/a/eden-beauty-collection-cape-town-6a-kromboom-road-irphxcus", "https://wikideals.co.za/save-up-to-75-on-laser-hair-removal-sessions-at-eden-beauty-collection-kromboom-road-rondebosch-wiki922337203686017668.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eden-beauty-collection-rondebosch-east'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
