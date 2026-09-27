-- Jobs 1-2: Three Anchor Bay suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'simunye-primary-health-care-centre-three-anchor-bay', 'Simunye Primary Health Care Centre',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '6 Main Road, corner Penarth Road, Three Anchor Bay, Cape Town, 8005', '+27 21 439 7887', NULL, NULL,
  'Simunye Primary Health Care Centre is a general practice medical clinic in Three Anchor Bay, Cape Town.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=237439", "https://simunyehealthcare.com/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'simunye-primary-health-care-centre-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'amanee-beauty-salon-three-anchor-bay', 'Amanee Beauty Salon',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '46B Main Road, Three Anchor Bay, Cape Town', '+27 74 035 5453', NULL, NULL,
  'Amanee Beauty Salon is a nail and beauty salon on Main Road, Three Anchor Bay, offering manicures, lash extensions and skincare treatments.',
  NULL, NULL,
  '["https://www.fresha.com/a/amanee-beauty-salon-cape-town-three-anchor-bay-48-baywest-46b-main-road-cae1xjue", "https://rsa.worldorgs.com/catalog/cape-town/nail-salon/amanee-beauty-salon"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'amanee-beauty-salon-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-one-8-hotel-three-anchor-bay', 'The One 8 Hotel',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '18 Antrim Road, Three Anchor Bay, Cape Town, 8005', '+27 21 434 6100', NULL, NULL,
  'The One 8 Hotel is a four-star hotel on Antrim Road, Three Anchor Bay, Cape Town.',
  NULL, NULL,
  '["https://www.sa-venues.com/visit/theone8hotel/map.php", "https://www.theone8.com/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-one-8-hotel-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);
