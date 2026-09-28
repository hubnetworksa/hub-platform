INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'st-vincent-clinic-belhar', 'St Vincent Clinic',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  'St Vincent Drive, Belhar, Cape Town, 7493', '021 953 8028', NULL, NULL,
  'St Vincent Clinic is a public City Health day clinic in Belhar.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/st-vincent-clinic-143517", "https://www.capetown.gov.za/Family%20and%20home/See-all-city-facilities/Our-service-facilities/Clinics%20and%20healthcare%20facilities/st-vincent-community-day-centre", "https://d7.westerncape.gov.za/facility/st-vincent-community-health-clinic"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'st-vincent-clinic-belhar'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'belhar-primary-school-belhar', 'Belhar Primary School',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  'Acanthus Circle, Belhar, Cape Town, 7493', '021 952 2144', 'www.belharprimary.co.za', 'admin@belharps.wcape.school.za',
  'Belhar Primary School is a public primary school in Belhar.',
  NULL, NULL,
  '["https://www.school-register.co.za/school/belhar-primary-school/", "https://www.belharprimary.co.za/wcontact.php", "https://www.waze.com/live-map/directions/za/wc/cape-town/belhar-primary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'belhar-primary-school-belhar'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'belhar-high-school-belhar', 'Belhar High School',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  '2 Suikerbossie Way, Belhar, Cape Town, 7493', '021 952 2147', 'belharhighschool.co.za', 'belhar.sec@wcgschools.gov.za',
  'Belhar High School is a public secondary school in Belhar.',
  NULL, NULL,
  '["https://educationsouthafrica.com/schools/western-cape/city-of-cape-town/belhar-sekondr", "https://belharhighschool.co.za/contact-us/", "https://schoolsdigest.co.za/listings/belhar-sekonder/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'belhar-high-school-belhar'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'belhar-islamic-primary-school-belhar', 'Belhar Islamic Primary School',
  (SELECT id FROM suburbs WHERE slug = 'belhar'),
  '31 Syringa Crescent, Belhar, Cape Town, 7490', '021 952 3872', NULL, NULL,
  'Belhar Islamic Primary School is an independent primary school in Belhar.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/belhar-islamic-primary-school/", "https://www.school-register.co.za/school/belhar-islamic-primary-school/", "https://educationsouthafrica.com/schools/western-cape/city-of-cape-town/belhar-islamic-primary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'belhar-islamic-primary-school-belhar'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
