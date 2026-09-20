INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tafelsig-moslem-butchery-tafelsig', 'Tafelsig Moslem Butchery',
  (SELECT id FROM suburbs WHERE slug = 'tafelsig'),
  '3 Huguenot Street, Tafelsig, Mitchells Plain, Cape Town', '021 397 2719', NULL, NULL,
  'Tafelsig Moslem Butchery is a Halaal butchery on Huguenot Street in Tafelsig, selling fresh meat and poultry.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/764827/tafelsig-moslem-butchery", "https://www.worldofmeats.co.za/view/tafelsig-moslem-butchery", "https://www.brabys.com/za/western-cape/mitchells-plain/tafelsig/butchers-retail/tafelsig-moslem-butchery"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tafelsig-moslem-butchery-tafelsig'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
