INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'faw-trucks-pretoria-west-zandfontein', 'FAW Trucks Pretoria West',
  (SELECT id FROM suburbs WHERE slug = 'zandfontein'),
  '1656 Malie Street, Zandfontein, Pretoria, 0030', '066 485 0626', 'https://www.fawpretoria.co.za/', NULL,
  'FAW Trucks Pretoria West is a commercial vehicle dealership on Malie Street in Zandfontein, offering new FAW truck sales, finance, genuine parts and an in-house service centre for freight carriers, truck tractors, tippers, mixers and compactors.',
  NULL, NULL,
  '["https://www.fawpretoria.co.za/", "https://www.bizcommunity.com/Company/FAWPretoria", "https://pretoria.infoisinfo.co.za/card/faw-pretoria-west/432536"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'faw-trucks-pretoria-west-zandfontein'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'grandmark-international-pretoria-zandfontein', 'Grandmark International Pretoria',
  (SELECT id FROM suburbs WHERE slug = 'zandfontein'),
  '1339 Malie Street, Zandfontein, Pretoria, 0082', '012 377 7000', 'https://grandmark.co.za/pretoria/', NULL,
  'Grandmark International Pretoria is an automotive parts and motor spares supplier on Malie Street in Zandfontein, stocking vehicle body parts, air conditioning, glass, braking and electrical components, open Monday to Friday 08:00-17:00 and Saturday 08:00-13:00.',
  NULL, NULL,
  '["https://grandmark.co.za/pretoria/", "https://www.eeziads.co.za/p/867685/grandmark-international-pretoria", "https://vymaps.com/ZA/Grandmark-International--Pretoria-Branch-18100/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'grandmark-international-pretoria-zandfontein'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);
