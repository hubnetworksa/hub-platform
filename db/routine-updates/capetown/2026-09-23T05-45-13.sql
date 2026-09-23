INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lavender-hill-clinic-lavender-hill', 'Lavender Hill Clinic',
  (SELECT id FROM suburbs WHERE slug = 'lavender-hill'),
  'Grindal Crescent, Lavender Hill, Cape Town, 7945', '021 814 1660', NULL, NULL,
  'Lavender Hill Clinic is a City of Cape Town public primary healthcare clinic serving the Lavender Hill community.',
  NULL, NULL,
  '["https://www.capetown.gov.za/Family%20and%20home/see-all-city-facilities/our-service-facilities/Clinics%20and%20healthcare%20facilities/Lavender%20Hill%20Clinic", "https://resource.capetown.gov.za/documentcentre/Documents/Forms,%20notices,%20tariffs%20and%20lists/Clinics%20Contact%20List.pdf"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lavender-hill-clinic-lavender-hill'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lavender-hill-high-school-lavender-hill', 'Lavender Hill High School',
  (SELECT id FROM suburbs WHERE slug = 'lavender-hill'),
  '91 Grindal Ave, Lavender Hill, Cape Town, 7945', '081 583 0027', NULL, NULL,
  'Lavender Hill High School is a public secondary school in Lavender Hill, established in 1978.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/lavender-hill-high-school/", "https://educationsouthafrica.com/schools/western-cape/city-of-cape-town/lavender-hill-high-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lavender-hill-high-school-lavender-hill'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lavender-hill-community-centre-lavender-hill', 'Lavender Hill Community Centre',
  (SELECT id FROM suburbs WHERE slug = 'lavender-hill'),
  'Cnr Hek Street & Grindle Avenue, Lavender Hill, Cape Town', '021 444 2668', NULL, NULL,
  'Lavender Hill Community Centre is a City of Cape Town recreational facility offering a hall and venue space for hire in Lavender Hill.',
  NULL, NULL,
  '["https://www.capetown.gov.za/Family%20and%20home/see-all-city-facilities/our-recreational-facilities/Community%20centres/Lavender%20Hill%20Community%20Centre", "https://resource.capetown.gov.za/documentcentre/Documents/Forms,%20notices,%20tariffs%20and%20lists/Rec_and_Parks_Facility_Contact_List.pdf"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lavender-hill-community-centre-lavender-hill'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);
