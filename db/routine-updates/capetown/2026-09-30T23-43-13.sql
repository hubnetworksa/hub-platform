-- Jobs 1-2: de-oude-weg (nothing found), eastridge, elsies-river

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eastridge-clinic-eastridge', 'Eastridge Clinic',
  (SELECT id FROM suburbs WHERE slug = 'eastridge'),
  '1st Avenue, Tokin Centre, Eastridge, Mitchells Plain', '021 392 7125', NULL, NULL,
  'Eastridge Clinic is a public primary healthcare clinic in Eastridge, Mitchells Plain, providing community-oriented health services including HIV, AIDS and TB-related care.',
  NULL, NULL,
  '["https://d7.westerncape.gov.za/facility/eastridge-clinic", "http://www.allaboutmzansi.com/eastridge-clinic.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eastridge-clinic-eastridge'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'debonairs-pizza-elsies-river', 'Debonairs Pizza',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'avonwood-square-elsies-river'),
  'Shop 25, Avonwood Square, Cnr 35th Avenue & Balvenie Road, Elsies River', '021 932 3699', NULL, NULL,
  'Debonairs Pizza is a pizza and takeaway outlet in Avonwood Square, Elsies River, part of the national Debonairs Pizza chain.',
  NULL, NULL,
  '["https://foursquare.com/v/debonairs-pizza/5cc745e0c8b2fb002c847167", "https://za.readymap.info/4/37244"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'debonairs-pizza-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sik-liquidation-centre-elsies-river', 'SIK Liquidation Centre',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '3A Botha Street, Elsies River Industrial, Cape Town', '021 592 2222', NULL, NULL,
  'SIK Liquidation Centre is a discount liquidation store in Elsies River Industrial selling a range of stock clearance goods.',
  NULL, NULL,
  '["https://legumguide.co.za/sik-liquidation-centre-10110573181593057513/", "https://za.africabz.com/western-cape/sik-liquidation-centre-212109"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sik-liquidation-centre-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
