INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'goldwagen-goodwood-goodwood', 'Goldwagen Goodwood',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  '46 Voortrekker Rd, Goodwood, Cape Town, 7460', '021 202 1082', 'https://www.goldwagen.com', 'goodwood@goldwagen.com',
  'Goldwagen Goodwood is a franchised automotive parts store supplying parts, lubricants and oils for passenger cars and trucks, in Goodwood.',
  NULL, NULL,
  '["https://www.goldwagen.com/store/goldwagen-goodwood/", "https://www.cybo.com/ZA-biz/goldwagen-goodwood"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'goldwagen-goodwood-goodwood'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-hardware-goodwood', 'Cape Hardware',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  '163 Voortrekker Road, Goodwood, Cape Town', '021 202 7583', 'https://capehardware.co.za', NULL,
  'Cape Hardware is a hardware store selling general hardware, tools, building materials, plumbing and electrical supplies, paint and pool chemicals, in Goodwood.',
  NULL, NULL,
  '["https://capehardware.co.za/contact-us/", "https://essentialgroup.co.za/store/cape-hardware-supplies/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-hardware-goodwood'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
