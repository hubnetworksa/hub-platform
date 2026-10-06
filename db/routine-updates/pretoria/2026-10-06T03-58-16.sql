-- thin-pages pretoria batch 11, checkpoint 4: Newlands (1 business)
-- (group3 of parallel verification: fuel-stations (partial))
-- All 14 Bergtuin combos had no candidate clear the 2-source+phone+address bar
-- this checkpoint (directory aggregator/search-list pages, national chains with
-- no suburb-pinned branch, or wrong-city/wrong-suburb homonyms).

-- Fuel Stations & Garages, Newlands (partial: 1/2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, hours, lat, lng, source_urls, status, origin)
VALUES (
  'totalenergies-newlands-service-station-newlands', 'TotalEnergies Newlands Service Station',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  '181 Dely Road, cnr Lois Ave, Newlands, Pretoria, 0181', '012 348 2461', 'https://totalenergies.co.za', NULL,
  'TotalEnergies Newlands Service Station is a fuel station on Dely Road, on the corner of Lois Avenue, in Newlands, Pretoria. The station offers diesel and petrol along with a comprehensive car wash service, and includes washroom facilities with a wheelchair-accessible washroom, as part of the wider TotalEnergies network of service stations in South Africa.

The station operates around the clock, giving customers access to fuel and car wash services at any hour of the day or night. On-site amenities noted by customers include a Mugg & Bean cafe and trailer hire. TotalEnergies Newlands Service Station serves motorists across Newlands and the wider Pretoria area looking for a 24-hour fuel stop with added convenience services.',
  'Open 24 hours',
  NULL, NULL,
  '["https://pretoria.co.za/place/totalenergies-newlands-service-station", "https://za.africabz.com/gauteng/total-newlands-service-station-124684"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'totalenergies-newlands-service-station-newlands'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);
