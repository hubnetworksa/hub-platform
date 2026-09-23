INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sinenjongo-high-school-joe-slovo-park', 'Sinenjongo High School',
  (SELECT id FROM suburbs WHERE slug = 'joe-slovo-park'),
  '11a Freedom Way, Joe Slovo Park, Milnerton, Cape Town, 7441', '021 204 0590', NULL, NULL,
  'Sinenjongo High School is a public high school in Joe Slovo Park serving grades 8 to 12.',
  NULL, NULL,
  '["https://skools.co.za/listings/sinenjongo-high-school/", "https://www.school-register.co.za/school/sinenjongo-high-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sinenjongo-high-school-joe-slovo-park'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'joe-slovo-recreation-centre-joe-slovo-park', 'Joe Slovo Recreation Centre',
  (SELECT id FROM suburbs WHERE slug = 'joe-slovo-park'),
  '60 Democracy Way, Joe Slovo Park, Milnerton, Cape Town', '021 814 1527', NULL, NULL,
  'Joe Slovo Recreation Centre is a City of Cape Town community facility in Joe Slovo Park with multipurpose indoor and outdoor courts, available for functions, meetings and recreational activities.',
  NULL, NULL,
  '["https://www.capetown.gov.za/Family%20and%20home/See-all-city-facilities/Our-recreational-facilities/Community%20centres/Joe%20Slovo%20Recreation%20Centre", "https://resource.capetown.gov.za/documentcentre/Documents/Forms,%20notices,%20tariffs%20and%20lists/Rec_and_Parks_Facility_Contact_List.pdf"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'joe-slovo-recreation-centre-joe-slovo-park'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);
