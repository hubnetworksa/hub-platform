-- Century City suburb research (jobs 1-2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'century-city-hotel-urban-square-century-city', 'Century City Hotel Urban Square',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  '3 Energy Lane, Bridgeways Precinct, Century City, Cape Town, 7441', '021 204 8000', NULL, NULL,
  'Century City Hotel Urban Square is a hotel offering modern accommodation and conference facilities in the Bridgeways Precinct of Century City, a short walk from Canal Walk Shopping Centre.',
  NULL, NULL,
  '["https://www.hotelplanner.com/Hotels/258777/Reservations-Century-City-Hotel-Cape-Town-3-Energy-Lane-Bridgeways-7441", "https://cchotels.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'century-city-hotel-urban-square-century-city'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'all-smiles-dentist-century-city-century-city', 'All Smiles Dentist Century City',
  (SELECT id FROM suburbs WHERE slug = 'century-city'),
  '4 Park Lane, Century Medical Suites, Ground Floor, Century City, Cape Town, 7441', '021 250 0697', NULL, NULL,
  'All Smiles Dentist Century City is a dental practice offering general, cosmetic and surgical dentistry from Century Medical Suites in Century City.',
  NULL, NULL,
  '["https://allsmilesdentist.co.za/century-medical-suites-century-city-cape-town/", "https://www.waze.com/live-map/directions/za/wc/cape-town/all-smiles-dentist-century-city?to=place.ChIJ9Z085gRczB0RS3hrbaB2JH8"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'all-smiles-dentist-century-city-century-city'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
