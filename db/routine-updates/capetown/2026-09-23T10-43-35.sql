-- Jobs 1-2: tafelsig suburb research, 3 new businesses
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tafelsig-community-centre-tafelsig', 'Tafelsig Community Centre',
  (SELECT id FROM suburbs WHERE slug = 'tafelsig'),
  '1 Olifantshoek Street, Tafelsig, Mitchells Plain, Cape Town', '021 444 5852', NULL, NULL,
  'Tafelsig Community Centre is a council-run venue in Tafelsig, Mitchells Plain, available for hire for weddings, birthday parties and corporate meetings.',
  NULL, NULL,
  '["https://www.capetown.gov.za/Family%20and%20home/see-all-city-facilities/our-recreational-facilities/Community%20centres/Tafelsig%20Community%20Centre", "https://community-services.blaauwberg.net/halls-venue-hire/halls-and-venues-for-hire-cape-town/Tafelsig-Community-Centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tafelsig-community-centre-tafelsig'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tafelsig-clinic-tafelsig', 'Tafelsig Clinic',
  (SELECT id FROM suburbs WHERE slug = 'tafelsig'),
  'Corner Kilimanjaro Street & Pyrenees Road, Tafelsig, Mitchells Plain, Cape Town', '021 444 2024', NULL, NULL,
  'Tafelsig Clinic is a City of Cape Town public health clinic at the corner of Kilimanjaro Street and Pyrenees Road in Tafelsig, Mitchells Plain.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/tafelsig-clinic-140036", "https://resource.capetown.gov.za/documentcentre/Documents/Forms,%20notices,%20tariffs%20and%20lists/Clinics%20Contact%20List.pdf"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tafelsig-clinic-tafelsig'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tafelsig-primary-school-tafelsig', 'Tafelsig Primary School',
  (SELECT id FROM suburbs WHERE slug = 'tafelsig'),
  'Olifantshoek Avenue, Tafelsig, Mitchells Plain, Cape Town, 7785', '021 397 6040', NULL, NULL,
  'Tafelsig Primary School is a public primary school on Olifantshoek Avenue in Tafelsig, Mitchells Plain.',
  NULL, NULL,
  '["https://skools.co.za/listings/tafelsig-primary-school/", "https://schoolsdigest.co.za/listings/tafelsig-primary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tafelsig-primary-school-tafelsig'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
