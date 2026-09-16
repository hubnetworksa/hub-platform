-- Florauna: 1 new business
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'villa-veroz-spa-florauna', 'Villa Veroz Spa',
  (SELECT id FROM suburbs WHERE slug = 'florauna'),
  '748 Kamdebo Road, Florauna, Pretoria North', '079 492 3664', 'https://veroz.co.za/', 'spa@veroz.co.za',
  'Villa Veroz Spa is a hair and beauty spa in Florauna, Pretoria North, open Tuesday to Sunday for treatments (booking essential).',
  NULL, NULL,
  '["https://www.facebook.com/spaverozki/", "https://www.thespaguide.co.za/listing/pretoria/spa/verozki-hair-spa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'villa-veroz-spa-florauna'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);
