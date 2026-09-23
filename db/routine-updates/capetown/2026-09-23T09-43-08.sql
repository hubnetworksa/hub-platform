INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bp-rocklands-service-station-rocklands', 'BP Rocklands Service Station',
  (SELECT id FROM suburbs WHERE slug = 'rocklands'),
  'Corner Caravelle Street & Handley-Page, Rocklands, Mitchells Plain, Cape Town, 7785', '021 391 4966', NULL, NULL,
  'BP Rocklands Service Station is a fuel station in Rocklands, Mitchells Plain.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/mitchells-plain/rocklands/garages-service-stations/rocklands-service-station", "https://yandex.com/maps/org/bp_rocklands_service_station/219532666383/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bp-rocklands-service-station-rocklands'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);
