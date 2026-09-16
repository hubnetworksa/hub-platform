-- Car Wash & Detailing: 3 verified businesses (owner-requested research,
-- 2026-09-16). Each confirmed against 2+ independent sources with a real
-- phone number and street address. Several other candidates found during
-- research were discarded: Crouch Auto Valet (no verifiable address),
-- 24Hours Auto Spa (no phone number), Nare-tlou Car Wash (no phone
-- number), Stop & Shine Car Wash and "GlossWorX"/Prima Auto Aesthetics
-- turned out to be name collisions with unrelated businesses elsewhere
-- (a US car wash chain; a Johannesburg detailing shop) once checked
-- directly -- Prima Auto Aesthetics's real Polokwane address is in
-- Ladine, which isn't a seeded suburb, so it was skipped rather than
-- forced into the wrong one.

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'gizaras-carwash-cleaning-services-polokwane-central', "Gizara's Carwash & Cleaning Services",
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '80 Church Street, Polokwane, 0699', '015 297 0624', NULL, NULL,
  'A car wash and vehicle cleaning service in Polokwane Central, open 24 hours a day.',
  NULL, NULL,
  '["https://www.gizaracleaners.co.za/", "https://cylex.net.za/p?f=gizara-carwash-and-cleaning-services&id=18005444"]',
  'published', 'agent_research', 'Open 24 hours'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gizaras-carwash-cleaning-services-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'car-wash-detailing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'auto-supreme-bendor', 'Auto Supreme',
  (SELECT id FROM suburbs WHERE slug = 'bendor'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-farmyard-trading-post-bendor'),
  'The Farmyard Trading Post, Cnr Munnik Avenue & School Road, Bendor, Polokwane', '064 793 6436', NULL, NULL,
  'A car wash and vehicle cleaning service at The Farmyard Trading Post in Bendor.',
  NULL, NULL,
  '["https://thedailycoffeecafe.co.za/franchise-location-express-auto-supreme-car-wash/", "https://www.facebook.com/autosupremepolokwane/"]',
  'published', 'agent_research', 'Mon-Fri 08:00-18:00, Sat 08:00-17:00, Sun 08:00-16:00'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'auto-supreme-bendor'),
  (SELECT id FROM categories WHERE slug = 'car-wash-detailing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin, hours)
VALUES (
  'lifestyle-corner-valet-and-lounge-polokwane-central', 'Lifestyle Corner Valet and Lounge',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '57 Van Warmelo Street, Polokwane', '082 708 5174', NULL, NULL,
  'A car wash and valet service in Polokwane Central.',
  NULL, NULL,
  '["https://za.polomap.com/gl/polokwane/16040", "https://www.cylex.net.za/company/lifestyle-corner-valet-and-lounge-23751200.html"]',
  'published', 'agent_research', 'Mon-Sun 07:00-17:00'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lifestyle-corner-valet-and-lounge-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'car-wash-detailing'),
  1
);
