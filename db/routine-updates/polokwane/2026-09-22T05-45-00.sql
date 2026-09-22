INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-mm-chokoe-bendor-park', 'Dr MM Chokoe',
  (SELECT id FROM suburbs WHERE slug = 'bendor-park'),
  '28 Meteor Avenue, Bendor Park, Polokwane, 0699', '082 854 8257', NULL, NULL,
  'Dr MM Chokoe is a general practice in Bendor Park.',
  NULL, NULL,
  '["https://www.recomed.co.za/general-practitioner/polokwane/mm-chokoe/3105/2793/", "https://nhcltd.com/professionals/dr-mm-chokoe/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-mm-chokoe-bendor-park'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bendor-guest-house-bendor', 'Bendor Guest House',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  '78 Bendor Drive, Bendor, Polokwane, 0699', '015 296 3923', 'https://bendorguesthouse.co.za', NULL,
  'Bendor Guest House is a guesthouse on Bendor Drive in Bendor.',
  NULL, NULL,
  '["https://governmentdirectree.com/business-directory/5203/bendor-guest-house/", "https://bnbfinder.co.za/places/bendor-guest-house/", "https://www.tripadvisor.co.za/Hotel_Review-g312624-d8424593-Reviews-Bendor_GuestHouse-Polokwane_Limpopo_Province.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bendor-guest-house-bendor'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
