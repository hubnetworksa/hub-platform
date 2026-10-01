INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sams-hardware-and-gas-lentegeur', 'Sams Hardware & Gas',
  (SELECT id FROM suburbs WHERE slug = 'lentegeur'),
  '9 Melkbos Street, Lentegeur, Mitchells Plain', '021 374 4761', NULL, NULL,
  'Sams Hardware & Gas is a hardware, gas, plumbing and electrical supplies store in Lentegeur, Mitchells Plain.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/1676462_2", "https://take.app/samshardware/follow"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sams-hardware-and-gas-lentegeur'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
