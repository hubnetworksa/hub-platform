INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'favour-guest-house-penina-park', 'Favour Guest House',
  (SELECT id FROM suburbs WHERE slug = 'penina-park'),
  '76 Limpopo Avenue, Penina Park, Polokwane, 0699', '+27 78 745 9953', NULL, NULL,
  'Favour Guest House is a guesthouse in Penina Park, Polokwane, offering ground-floor units with kitchenettes, private bathrooms and free on-site parking, near the N1.',
  NULL, NULL,
  '["https://www.booking.com/hotel/za/favour-guest-house.html", "https://www.hotel.com.au/polokwane/favour-guest-house.htm"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'favour-guest-house-penina-park'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zuch-accommodation-at-pafuri-penina-park', 'ZUCH Accommodation at Pafuri',
  (SELECT id FROM suburbs WHERE slug = 'penina-park'),
  '47 Pafuri Avenue, Penina Park, Polokwane, 0699', '081 025 1317', 'https://zuchaccommodation.co.za/', NULL,
  'ZUCH Accommodation at Pafuri is a self-catering guesthouse in Penina Park, Polokwane, offering apartments, villas and cabins for family and business travellers.',
  NULL, NULL,
  '["https://www.lekkeslaap.co.za/accommodation/zuch-accommodation-at-pafuri", "https://zuchaccommodation.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zuch-accommodation-at-pafuri-penina-park'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
