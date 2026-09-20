INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tirepoint-matroosfontein', 'Tirepoint',
  (SELECT id FROM suburbs WHERE slug = 'matroosfontein'),
  '6 Milan Road, Matroosfontein, Cape Town, 7490', '021 385 1559', NULL, NULL,
  'Tirepoint is a tyre fitment and repair centre on Milan Road in Matroosfontein, offering tyre sales, fitment and repairs.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/tyre-dealers/tirepoint-cape-town-pty-ltd", "https://tirepoint.co.za/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tirepoint-matroosfontein'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);
