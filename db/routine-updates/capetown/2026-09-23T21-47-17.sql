INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ocean-view-clinic-ocean-view', 'Ocean View Clinic',
  (SELECT id FROM suburbs WHERE slug = 'ocean-view'),
  'Carina Close, Ocean View, Cape Town', '021 400 5494', NULL, NULL,
  'Ocean View Clinic is a public community health centre serving the Ocean View area.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/ocean-view-clinic-209000", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=94820", "https://clinicfinder.co.za/clinics/western-cape/ocean-view-clinic-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ocean-view-clinic-ocean-view'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ocean-view-civic-centre-ocean-view', 'Ocean View Civic Centre',
  (SELECT id FROM suburbs WHERE slug = 'ocean-view'),
  'Corner Carina Close and Oakley Place, Ocean View, Cape Town', '021 444 2668', NULL, NULL,
  'Ocean View Civic Centre is a City of Cape Town community hall available for hire for weddings, functions and corporate meetings.',
  NULL, NULL,
  '["https://www.capetown.gov.za/Family%20and%20home/see-all-city-facilities/our-recreational-facilities/Community%20centres/Ocean%20View%20Civic%20Centre", "https://community-services.blaauwberg.net/halls-venue-hire/halls-and-venues-for-hire-cape-town/Ocean-View-Civic-Centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ocean-view-civic-centre-ocean-view'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);
