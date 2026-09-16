INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'digitas-liquorice-zonnebloem', 'Digitas Liquorice',
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  'The Harrington, 50 Harrington Street, Zonnebloem, Cape Town', '087 255 0900', 'https://liquorice.co.za/', 'info@liquorice.co.za',
  'Digitas Liquorice is a digital and creative marketing agency based at The Harrington on Harrington Street, in Zonnebloem.',
  NULL, NULL,
  '["https://www.digitas.com/en-my/offices/cape-town", "https://mypr.co.za/directory/a/digitas-liquorice/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'digitas-liquorice-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'marketing-advertising'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'arc-zonnebloem', 'Arc',
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  'The Harrington, 50 Harrington Street, Zonnebloem, Cape Town', '087 255 1400', 'https://www.arcww.co.za/', 'hello@arcww.co.za',
  'Arc is a data-driven creative marketing agency based at The Harrington on Harrington Street, in Zonnebloem.',
  NULL, NULL,
  '["https://www.arcww.co.za/contact/", "https://www.facebook.com/arcwwsa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'arc-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'marketing-advertising'),
  1
);
