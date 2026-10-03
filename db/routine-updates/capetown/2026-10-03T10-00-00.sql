INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'westlake-clinic-westlake', 'Westlake Clinic',
  (SELECT id FROM suburbs WHERE slug = 'westlake'),
  '44 Westlake Drive, Westlake, Cape Town', '021 814 1607', NULL, NULL,
  'Westlake Clinic is a public primary healthcare clinic offering child health, family planning, HIV care and testing, and STI assessment and treatment, in Westlake.',
  NULL, NULL,
  '["https://www.capetown.gov.za/Family%20and%20home/See-all-city-facilities/Our-service-facilities/Clinics%20and%20healthcare%20facilities/westlake-clinic", "https://westerncape.gov.za/facility/westlake-clinic"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'westlake-clinic-westlake'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
