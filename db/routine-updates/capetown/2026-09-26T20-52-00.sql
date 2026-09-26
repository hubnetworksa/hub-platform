INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vergenoegd-low-wine-estate-faure', 'Vergenoegd Löw Wine Estate',
  (SELECT id FROM suburbs WHERE slug = 'faure'),
  '1 Vergenoegd Road, Faure, 7130', '021 843 3248', NULL, NULL,
  'Vergenoegd Löw Wine Estate is a historic working wine farm in Faure with a boutique hotel and spa, and on-site restaurants.',
  NULL, NULL,
  '["https://vergenoegd.co.za/contact-us/", "https://www.africanadvice.com/1107275/Wine_Estates/Western_Cape/Faure_Wine_Farm/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vergenoegd-low-wine-estate-faure'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
