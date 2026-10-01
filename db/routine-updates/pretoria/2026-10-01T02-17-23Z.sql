INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mont-paradiso-guesthouse-waverley', 'Mont Paradiso Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'waverley'),
  '1246 Breyer Avenue, Waverley, Pretoria, 0186', '012 332 5601', 'https://www.montparadiso.co.za', 'info@montparadiso.co.za',
  'Mont Paradiso is a 4-star guesthouse perched atop the Magalies Mountain with eight room types, a swimming pool, an honesty bar and a restaurant with city views, also hosting weddings and conferences for up to 40 guests, in Waverley, Pretoria.',
  NULL, NULL,
  '["https://www.montparadiso.co.za", "https://www.successfulmeetings.com/Meeting-Event-Venues/Pretoria-South-Africa/Convention-Hotel/Mont-Paradiso-Guesthouse-p55347089"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mont-paradiso-guesthouse-waverley'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dunwoodie-travel-lodge-waverley', 'Dunwoodie Travel Lodge',
  (SELECT id FROM suburbs WHERE slug = 'waverley'),
  '1393 Dunwoodie Avenue, Waverley, Pretoria, 0183', '081 011 6544', 'https://www.dunwoodietravellodge.co.za', NULL,
  'Dunwoodie Travel Lodge is a guest lodge with en-suite rooms, a swimming pool, secure parking, free WiFi and conference facilities for up to 80 people, with breakfast and dinner available on request, in Waverley, Pretoria.',
  NULL, NULL,
  '["https://sa-venues.com/visit/dunwoodie", "https://www.meetings-conventions.com/Meeting-Event-Venues/Pretoria-South-Africa/Convention-Hotel/Dunwoodie-Travel-Lodge-p56955313"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dunwoodie-travel-lodge-waverley'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
