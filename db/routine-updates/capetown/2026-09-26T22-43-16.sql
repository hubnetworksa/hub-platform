INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'club-kloof-tamboerskloof', 'Club Kloof',
  (SELECT id FROM suburbs WHERE slug = 'tamboerskloof'),
  '84 Kloof St, Tamboerskloof, Cape Town, 8001', '072 415 3752', 'https://clubkloof.com', NULL,
  'Club Kloof is an Italian-inspired restaurant and bar on Kloof Street in Tamboerskloof, Cape Town.',
  NULL, NULL,
  '["https://www.corner.inc/place/pkkuWKNDW9rD", "https://mindtrip.ai/restaurant/cape-town-western/club-kloof/re-HEyes87q"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'club-kloof-tamboerskloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
