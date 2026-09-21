INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'leda-lebowakgomo-lebowakgomo', 'LEDA Lebowakgomo',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  'Enterprise Development House, Main Road, Lebowakgomo, 0737', '015 633 4700', 'https://www.lieda.co.za/index.php/leda-lebowakgomo/', NULL,
  'LEDA Lebowakgomo is a Limpopo Economic Development Agency office offering business support, financial loans and property rental services.',
  NULL, NULL,
  '["https://www.lieda.co.za/index.php/leda-lebowakgomo/", "https://www.ivote.co.za/view/south-africa/limpopo-economic-development-agency-leda-lebowakgomo-in-lebowakgomo"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'leda-lebowakgomo-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'government-municipal-services'),
  1
);
