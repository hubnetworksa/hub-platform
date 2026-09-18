-- Suburb: bantry-bay (jobs 1-2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-president-hotel-bantry-bay', 'The President Hotel',
  (SELECT id FROM suburbs WHERE slug = 'bantry-bay'),
  '4 Alexander Road, Bantry Bay, Cape Town', '021 434 8111', 'https://www.presidenthotel.co.za', 'hello@presidenthotel.co.za',
  'The President Hotel is a hotel on the Bantry Bay waterfront with sea-facing rooms and multiple dining venues on site.',
  NULL, NULL,
  '["https://www.sa-venues.com/visit/thepresidenthotel/", "https://www.presidenthotel.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-president-hotel-bantry-bay'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-bantry-aparthotel-bantry-bay', 'The Bantry Aparthotel',
  (SELECT id FROM suburbs WHERE slug = 'bantry-bay'),
  '8 Alexander Road, Bantry Bay, Cape Town', '021 434 8448', 'https://www.bantryaparthotel.co.za/', 'bookings@totalstay.co.za',
  'The Bantry Aparthotel is a serviced-apartment hotel on Alexander Road in Bantry Bay, offering an outdoor pool and 24-hour reception.',
  NULL, NULL,
  '["https://www.bantryaparthotel.co.za/", "https://www.trivago.com/bantry-bay-53408/hotel/8-alexander-road-38978"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-bantry-aparthotel-bantry-bay'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);
