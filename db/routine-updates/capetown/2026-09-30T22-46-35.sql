INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hassans-colorado-service-station-colorado', 'Hassans Colorado Service Station',
  (SELECT id FROM suburbs WHERE slug = 'colorado'),
  '18 Highlands Drive, Weltevreden Valley, Mitchells Plain, Cape Town, 7785', '021 371 3319', NULL, NULL,
  'Hassans Colorado Service Station is a Shell fuel station on Highlands Drive in Colorado Park, Mitchells Plain.',
  NULL, NULL,
  '["https://fueldirectory.co.za/listing-contact.php?listings_id=6274", "https://find.shell.com/za/fuel/10043025-hassans-colorado-service-stn/en_US"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hassans-colorado-service-station-colorado'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'colorado-motor-spares-colorado', 'Colorado Motor Spares',
  (SELECT id FROM suburbs WHERE slug = 'colorado'),
  'Shop 19, Cnr Highlands Drive & Weltevreden Parkway, Colorado Park, Mitchells Plain, Cape Town, 7785', '021 372 5604', NULL, NULL,
  'Colorado Motor Spares is a motor spares and auto parts shop on Highlands Drive in Colorado Park, Mitchells Plain.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/colorado-motor-spares-166059", "https://www.thinklocal.co.za/biz/colorado-motor-spares-mitchells-plain"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'colorado-motor-spares-colorado'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);
