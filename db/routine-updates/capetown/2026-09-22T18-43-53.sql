INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'saverite-ruyterwacht', 'Saverite',
  (SELECT id FROM suburbs WHERE slug = 'ruyterwacht'),
  '2 Paul Kruger Avenue, Ruyterwacht, Cape Town, 7460', '021 534 4259', NULL, NULL,
  'Saverite is a supermarket in Ruyterwacht, part of the independently-owned Saverite grocery chain.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/saverite-supermarket-116279", "https://vymaps.com/ZA/Saverite-Ruyterwacht-1207050812685097/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'saverite-ruyterwacht'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
