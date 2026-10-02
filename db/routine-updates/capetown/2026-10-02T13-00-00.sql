INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tokers-trophies-kensington', 'Tokers Trophies',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  'Unit C4, Maitland Park, 733 Voortrekker Road, Kensington, Cape Town, 7405', '021 593 0514', 'https://www.tokerstrophies.co.za/', NULL,
  'Tokers Trophies is a trophy and engraving shop supplying awards for sporting, corporate and academic achievements, in Kensington.',
  NULL, NULL,
  '["https://www.tokerstrophies.co.za/", "https://za.africabz.com/western-cape/tokers-trophies-107162"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tokers-trophies-kensington'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
