INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'thornton-service-station-thornton', 'Thornton Service Station',
  (SELECT id FROM suburbs WHERE slug = 'thornton'),
  '58 Sipres Avenue, Thornton, Cape Town, 7460', '021 534 3667', NULL, NULL,
  'Thornton Service Station is a BP petrol station, in Thornton.',
  NULL, NULL,
  '["https://map.bp.com/en-US/ZA/gas-station/thornton/thornton-service-station/THORCYPA1R", "https://www.brabys.com/za/western-cape/cape-town/thornton/garages-service-stations/thornton-service-station", "https://www.africanadvice.com/1371174/Garages_And_Service_Stations/Cape_Town/Thornton_Service_Station/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'thornton-service-station-thornton'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  '41-on-cedar-thornton', '41 on Cedar',
  (SELECT id FROM suburbs WHERE slug = 'thornton'),
  '41 Cedar Road, Thornton, Cape Town, 7460', '021 531 6223', 'https://www.41oncedar.co.za', NULL,
  '41 on Cedar is a bed and breakfast guest accommodation, in Thornton.',
  NULL, NULL,
  '["https://www.41oncedar.co.za/contact-us/", "https://www.hotelplanner.com/Hotels/303800/Reservations-41-on-Cedar-Bed-Breakfast-Cape-Town-41-Cedar-Rd-Town-7460"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '41-on-cedar-thornton'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
