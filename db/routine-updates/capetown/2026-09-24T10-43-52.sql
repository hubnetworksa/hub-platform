INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'health-on-point-mouille-point', 'Health on Point',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  '5 Surrey Place, Mouille Point, Cape Town', '021 433 0546', 'https://www.healthonpoint.co.za', NULL,
  'Health on Point is a pharmacy and health & wellness store in Mouille Point.',
  NULL, NULL,
  '["https://www.healthonpoint.co.za/contact", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1841561"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'health-on-point-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
