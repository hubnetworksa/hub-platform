-- Suburb research: rocklands (2 new businesses)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rocklands-clinic-rocklands', 'Rocklands Clinic',
  (SELECT id FROM suburbs WHERE slug = 'rocklands'),
  'Cnr Lancaster Road & Park Avenue, Rocklands, Mitchells Plain, Cape Town, 7785', '021 392 5121', NULL, 'rocklands.clinic@capetown.gov.za',
  'Rocklands Clinic is a City of Cape Town public health clinic serving the Rocklands area of Mitchells Plain.',
  NULL, NULL,
  '["https://d7.westerncape.gov.za/facility/rocklands-clinic", "https://resource.capetown.gov.za/documentcentre/Documents/Forms,%20notices,%20tariffs%20and%20lists/Clinics%20Contact%20List.pdf"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rocklands-clinic-rocklands'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rocklands-pharmacy-rocklands', 'Rocklands Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'rocklands'),
  'BP Garage, Cnr Caravelle Street & Handley-Page, Rocklands, Mitchells Plain, Cape Town, 7785', '021 012 5539', NULL, 'Rocklandspharmacy@gmail.com',
  'Rocklands Pharmacy is a pharmacy operating out of the BP garage on the corner of Caravelle Street and Handley-Page in Rocklands, dispensing prescription and over-the-counter medicine to the local community.',
  NULL, NULL,
  '["https://www.facebook.com/savemorepharmacies/", "https://distributors.oxygenproducts.org/listing/rocklands-pharmacies/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rocklands-pharmacy-rocklands'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
