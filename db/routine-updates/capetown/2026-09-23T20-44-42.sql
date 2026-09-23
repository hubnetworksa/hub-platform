INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  '26-sunset-villa-llandudno', '26 Sunset Villa',
  (SELECT id FROM suburbs WHERE slug = 'llandudno'),
  '26 Sunset Avenue, Llandudno, Cape Town', '082 826 9986', 'http://www.26sunsetvilla.com', 'llandudno@26sunsetvilla.com',
  '26 Sunset Villa is a guesthouse in Llandudno, Cape Town.',
  NULL, NULL,
  '["http://www.26sunsetvilla.com", "https://wetu.com/iBrochure/en/Information/24397/26_sunset_villa/Contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '26-sunset-villa-llandudno'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
