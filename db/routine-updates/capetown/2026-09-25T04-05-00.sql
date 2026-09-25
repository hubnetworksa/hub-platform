INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'future-tool-thornton', 'Future Tool',
  (SELECT id FROM suburbs WHERE slug = 'thornton'),
  'Unit 33, Viking Business Place, 29 Thor Circle, Thornton, Cape Town, 7460', '021 531 6560', 'https://www.futuretool.co.za/', NULL,
  'Future Tool is a power tools and hardware retailer operating from Viking Business Place in Thornton.',
  NULL, NULL,
  '["https://www.futuretool.co.za/pages/contact-us", "https://rsa.worldorgs.com/catalog/cape-town/tool-store/future-tool"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'future-tool-thornton'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
