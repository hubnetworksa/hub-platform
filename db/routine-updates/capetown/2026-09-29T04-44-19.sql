INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'masiphumelele-clinic-masiphumelele', 'Masiphumelele Clinic',
  (SELECT id FROM suburbs WHERE slug = 'masiphumelele'),
  'Pokela Road, Masiphumelele, Cape Town, 7975', '021 444 4103', NULL, NULL,
  'Masiphumelele Clinic is a public primary healthcare clinic run by the City of Cape Town, in Masiphumelele.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/facility/masiphumelele-clinic", "https://www.capetown.gov.za/Family%20and%20home/see-all-city-facilities/our-service-facilities/Clinics%20and%20healthcare%20facilities/Masiphumelele%20Clinic"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'masiphumelele-clinic-masiphumelele'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
