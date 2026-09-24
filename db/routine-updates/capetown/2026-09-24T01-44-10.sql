INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'geuwels-faure', 'Geuwels',
  (SELECT id FROM suburbs WHERE slug = 'faure'),
  'Vergenoegd Löw Wine Estate, 1 Vergenoegd Road, Faure, 7131', '021 843 3248', 'https://vergenoegd.co.za/geuwels/', NULL,
  'Geuwels is a casual, farm-to-table restaurant at Vergenoegd Löw Wine Estate in Faure, offering heritage-style tapas and wine pairings with indoor and outdoor seating.',
  NULL, NULL,
  '["https://vergenoegd.co.za/geuwels/", "https://www.capetownetc.com/things-to-do-cape-town/restaurants/why-geuwels-at-vergenoegd-low-is-a-must-visit-just-outside-cape-town/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'geuwels-faure'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
