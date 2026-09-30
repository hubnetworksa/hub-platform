INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'oppi-hoek-guesthouse-riviera', 'Oppi Hoek Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'riviera'),
  '196 Blake Street, Riviera, Pretoria, 0084', '012 329 0014', 'https://www.oppihoek.com', NULL,
  'Oppi Hoek Guesthouse is a bed and breakfast in Riviera, Pretoria, offering single, double and twin en-suite rooms with DSTV, Wi-Fi, an indoor braai area and an on-site restaurant, close to the Union Buildings and Church Square.',
  NULL, NULL,
  '["https://www.oppihoek.com", "https://www.sa-venues.com/visit/oppihoekguesthouse"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'oppi-hoek-guesthouse-riviera'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
