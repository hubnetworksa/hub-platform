INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lentegeur-clinic-lentegeur', 'Lentegeur Clinic',
  (SELECT id FROM suburbs WHERE slug = 'lentegeur'),
  'Cnr Merrydale & Melkbos Roads, Lentegeur, Mitchells Plain, Cape Town, 7785', '021 444 1428', NULL, NULL,
  'Lentegeur Clinic is a City of Cape Town public primary healthcare clinic serving the Lentegeur community in Mitchells Plain.',
  NULL, NULL,
  '["https://www.capetown.gov.za/Family%20and%20home/see-all-city-facilities/our-service-facilities/Clinics%20and%20healthcare%20facilities/Lentegeur%20Clinic", "https://resource.capetown.gov.za/documentcentre/Documents/Forms,%20notices,%20tariffs%20and%20lists/Clinics%20Contact%20List.pdf"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lentegeur-clinic-lentegeur'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lentegeur-hospital-lentegeur', 'Lentegeur Hospital',
  (SELECT id FROM suburbs WHERE slug = 'lentegeur'),
  'Highlands Drive, Lentegeur, Mitchells Plain, Cape Town, 7785', '021 370 1111', NULL, NULL,
  'Lentegeur Hospital is a Western Cape Government psychiatric hospital in Mitchells Plain, providing mental health services including child and adolescent, forensic, intellectual disability and general adult psychiatry.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/health-wellness/facility/lentegeur-hospital", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=58779"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lentegeur-hospital-lentegeur'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'merrydale-primary-school-lentegeur', 'Merrydale Primary School',
  (SELECT id FROM suburbs WHERE slug = 'lentegeur'),
  '20 Merrydale Lane, Lentegeur, Mitchells Plain, Cape Town, 7785', '021 371 3010', NULL, NULL,
  'Merrydale Primary School is a public, no-fee primary school in Lentegeur, Mitchells Plain.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/merrydale-primary-school/", "https://educationsouthafrica.com/schools/western-cape/city-of-cape-town/merrydale-primary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'merrydale-primary-school-lentegeur'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
