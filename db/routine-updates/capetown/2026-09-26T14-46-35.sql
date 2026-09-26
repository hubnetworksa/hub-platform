INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sentinel-primary-school-hangberg', 'Sentinel Primary School',
  (SELECT id FROM suburbs WHERE slug = 'hangberg'),
  '6 Atlantic Skipper Road, Hangberg, Hout Bay, Cape Town, 7806', '021 790 1560', 'https://www.sentinelps.co.za', NULL,
  'Sentinel Primary School is a primary school on Atlantic Skipper Road in Hangberg, Hout Bay, that grew out of the local fishing community.',
  NULL, NULL,
  '["https://www.sentinelps.co.za/contact-us/", "https://www.brabys.com/business/4880811/south-africa/western-cape/cape-town/hout-bay/harbour-rd/primary-school/schools/sentinel-primary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sentinel-primary-school-hangberg'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hangberg-pre-primary-school-hangberg', 'Hangberg Pre-Primary School',
  (SELECT id FROM suburbs WHERE slug = 'hangberg'),
  'c/o Atlantic Skipper Street & Karbonkel Road, Hangberg, Hout Bay, Cape Town, 7806', '082 790 5417', NULL, NULL,
  'Hangberg Pre-Primary School is a pre-primary school for Grade R children in Hangberg, Hout Bay, operating on the premises of Sentinel Primary School since 2014.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/facility/hangberg-pre-primary-school", "https://sentinelnews.co.za/sentinel-news/news/2026-09-15-hangberg-pre-primary-school-marks-a-decade-of-nurturing-hout-bays-youngest-pupils/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hangberg-pre-primary-school-hangberg'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hangberg-dreams-hangberg', 'Hangberg Dreams',
  (SELECT id FROM suburbs WHERE slug = 'hangberg'),
  'St Simons, Karbonkel Road, Hangberg, Hout Bay, Cape Town, 7806', '062 291 4713', 'https://hangbergdreams.org.za', NULL,
  'Hangberg Dreams is a non-profit running a rehabilitation day centre and recovery programmes for people affected by substance misuse in Hangberg, Hout Bay.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/facility/hangberg-dreams", "https://hangbergdreams.org.za/contacts/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hangberg-dreams-hangberg'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
