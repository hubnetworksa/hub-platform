INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'thumbs-up-plumbing-construction-monte-vista', 'Thumbs Up Plumbing & Construction',
  (SELECT id FROM suburbs WHERE slug = 'monte-vista'),
  '36 Plettenberg Street, Monte Vista, Cape Town, 7460', '074 457 4466', NULL, NULL,
  'Thumbs Up Plumbing & Construction is a plumbing and construction contractor based in Monte Vista.',
  NULL, NULL,
  '["https://www.thumbsupplumbing.co.za/contact/", "https://www.brabys.com/za/western-cape/goodwood/monte-vista/plumbers/thumbs-up-plumbing-construction"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'thumbs-up-plumbing-construction-monte-vista'),
  (SELECT id FROM categories WHERE slug = 'plumbers'),
  1
);
