INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-cake-shop-athlone', 'The Cake Shop',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  '215 Belgravia Road, cnr Port Jackson Road, Athlone, Cape Town, 7764', '065 985 1777', NULL, NULL,
  'The Cake Shop is a halaal bakery and cake shop on the corner of Belgravia and Port Jackson Roads, Athlone.',
  NULL, NULL,
  '["https://www.facebook.com/permalink.php?id=102787651664445&story_fbid=123709489572261", "https://www.tiktok.com/@aakifahfrancisbraaf/video/7302047144108674310"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-cake-shop-athlone'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wembley-bakery-athlone', 'Wembley Bakery',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  'Wembley Building, 21 Belgravia Road, Athlone, Cape Town', '021 697 1435', 'https://www.wembley.co.za/bakery/', NULL,
  'Wembley Bakery is a bakery division of the Wembley Group of Companies, in the same Belgravia Road building as Wembley Meat Market, Athlone.',
  NULL, NULL,
  '["https://www.wembley.co.za/bakery/", "https://foursquare.com/v/wembley-bakery/4eaff4cf93ad8dcab70c2523"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wembley-bakery-athlone'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);
