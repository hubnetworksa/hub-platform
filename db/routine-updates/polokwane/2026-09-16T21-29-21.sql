INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vts-vehicle-testing-station-superbia', 'VTS Vehicle Testing Station',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '24 Mangaan Street, Superbia, Polokwane, 0699', '015 292 5941', NULL, NULL,
  'VTS Vehicle Testing Station is a business in Superbia, part of the Greater Polokwane area.',
  NULL, NULL,
  '["https://www.brabys.com/za/limpopo/polokwane/superbia/vehicle-testing-stations/v-t-s-vehicle-testing-station", "https://www.searchinafrica.com/business/6088422/south-africa/limpopo/polokwane/superbia/mangaan-st/vehicle-testing-stations/v-t-s-vehicle-testing-station", "https://www.yep.co.za/biz/store/iyp/12867413_3"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vts-vehicle-testing-station-superbia'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'car-service-city-superbia', 'Car Service City - Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'superbia'),
  '29 Nikkel Street, Superbia, Polokwane, 0699', '015 590 1205', NULL, 'polokwane@carservicecity.co.za',
  'Car Service City - Polokwane is a business in Superbia, part of the Greater Polokwane area.',
  NULL, NULL,
  '["https://carservicecity.net/find-a-branch/polokwane/", "https://miwa-members.miwa.org.za/?listing=car-service-city-polokwane", "https://www.autorepairdirectory.co.za/listing.php?listings_id=17"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'car-service-city-superbia'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);
