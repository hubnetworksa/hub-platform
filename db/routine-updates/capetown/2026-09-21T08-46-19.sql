INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-express-at-shell-firgrove-firgrove', 'SPAR Express at Shell Firgrove',
  (SELECT id FROM suburbs WHERE slug = 'firgrove'),
  'Old Main Road (R102), Firgrove, 7130', '021 842 2406', NULL, NULL,
  'SPAR Express at Shell Firgrove is a 24-hour convenience store and fuel station on the R102 in Firgrove.',
  NULL, NULL,
  '["https://www.spar.co.za/Home/Store-View/SPAR-Express-Firgrove-Express-Western-Cape", "https://www.hotfrog.co.za/company/88cd7d37dc766bf976eafdb3b2a8e709/spar-express-at-shell-firgrove/cape-town/shopping-services-supplies"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-express-at-shell-firgrove-firgrove'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'firgrove-primary-school-firgrove', 'Firgrove Primary School',
  (SELECT id FROM suburbs WHERE slug = 'firgrove'),
  '7th Avenue, Firgrove, Somerset West, 7130', '021 842 3635', NULL, NULL,
  'Firgrove Primary School is a public primary school in Firgrove, Somerset West.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/education/facility/firgrove-primary-school", "https://www.brabys.com/za/western-cape/somerset-west/firgrove/schools/firgrove-primary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'firgrove-primary-school-firgrove'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
