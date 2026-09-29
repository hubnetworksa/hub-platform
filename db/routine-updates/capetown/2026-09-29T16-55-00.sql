INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'villa-massage-spa-bantry-bay', 'Villa Massage Spa',
  (SELECT id FROM suburbs WHERE slug = 'bantry-bay'),
  '20 Ave Marina, Bantry Bay, Cape Town, 8005', '081 705 8750', NULL, NULL,
  'Villa Massage Spa is a massage and wellness spa on Avenue Marina in Bantry Bay, offering treatments including full body massage and reflexology.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/the-villa-massage-spa-avenue-marina-cape-town-ovLQGx", "https://thevillamassagespa.setmore.com/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'villa-massage-spa-bantry-bay'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);
