INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'crossroads-1-clinic-crossroads', 'Crossroads 1 Clinic',
  (SELECT id FROM suburbs WHERE slug = 'crossroads'),
  'Klipfontein Road, Crossroads, Cape Town', '021 444 6440', NULL, NULL,
  'Crossroads 1 Clinic is a public primary health care clinic on Klipfontein Road in Crossroads, part of the Nyanga Health District, providing free general healthcare services to the local community.',
  NULL, NULL,
  '["https://resource.capetown.gov.za/documentcentre/Documents/Forms,%20notices,%20tariffs%20and%20lists/Clinics%20Contact%20List.pdf", "https://www.westerncape.gov.za/facility/crossroads-1-clinic"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'crossroads-1-clinic-crossroads'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
