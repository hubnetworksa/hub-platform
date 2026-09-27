-- Southfield suburb research: 1 new business

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'southfield-superette-southfield', 'Southfield Superette',
  (SELECT id FROM suburbs WHERE slug = 'southfield'),
  '161 Victoria Road, Southfield, Cape Town, 7800', '074 449 0267', NULL, NULL,
  'Southfield Superette is a small supermarket and convenience shop on Victoria Road in Southfield.',
  NULL, NULL,
  '["https://wego.here.com/south-africa/cape-town/food-drink/southfield-superette--710k3vnk-1f9c2080ec034499a9aee1cd7fdd471e?lang=en-gb", "https://rsa.worldorgs.com/catalog/cape-town/supermarket/southfield-superette"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'southfield-superette-southfield'),
  (SELECT id FROM categories WHERE slug = 'convenience-stores'),
  1
);
