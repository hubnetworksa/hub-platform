INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kalahari-slaghuis-annadale', 'Kalahari Slaghuis',
  (SELECT id FROM suburbs WHERE slug = 'annadale'),
  (SELECT id FROM shopping_centers WHERE slug = 'tropicana-centre-ladanna'),
  'Tropicana Centre, 21 Witklip Street, Annadale, Polokwane', '015 293 1199', NULL, NULL,
  'Kalahari Slaghuis is a butchery trading from the Tropicana Centre in Annadale, Polokwane.',
  NULL, NULL,
  '["https://www.worldofmeats.co.za/view/kalahari-slaghuis", "https://www.thinklocal.co.za/biz/kalahari-slaghuis-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kalahari-slaghuis-annadale'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
