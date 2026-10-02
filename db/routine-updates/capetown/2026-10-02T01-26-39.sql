INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'brackenfell-steel-brackenfell', 'Brackenfell Steel',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  '31 Viben Ave, Brackenfell Industrial, Cape Town, 7560', '021 981 7090', 'https://www.brackenfellsteel.co.za', NULL,
  'Brackenfell Steel is a steel supplier, established in 1994, selling new and re-usable steel with same-day cutting and bending of reinforcing steel, in Brackenfell.',
  NULL, NULL,
  '["https://www.brackenfellsteel.co.za/contact-us", "https://www.cybo.com/ZA-biz/brackenfell-steel_27"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'brackenfell-steel-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
