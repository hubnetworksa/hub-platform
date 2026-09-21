INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-firgrove-firgrove', 'SPAR Firgrove',
  (SELECT id FROM suburbs WHERE slug = 'firgrove'),
  'Corner of R102 and Main Road, Firgrove, 7130', '021 206 7797', NULL, NULL,
  'SPAR Firgrove is a supermarket at the corner of the R102 and Main Road in Firgrove.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/firgrove/spar/r102-road-main-road", "https://www.tiendeo.co.za/stores/somerset-west/spar-tops-r-main-road-firgrove/75217"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-firgrove-firgrove'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tops-at-spar-firgrove-firgrove', 'TOPS at SPAR Firgrove',
  (SELECT id FROM suburbs WHERE slug = 'firgrove'),
  'Corner of R102 and Main Road, Firgrove, 7130', '021 206 7797', NULL, NULL,
  'TOPS at SPAR Firgrove is a liquor store alongside SPAR Firgrove at the corner of the R102 and Main Road.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/firgrove/tops-at-spar/r102-main-road-firgrove", "https://www.tiendeo.co.za/stores/somerset-west/spar-tops-r-main-road-firgrove/75217"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tops-at-spar-firgrove-firgrove'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-express-at-shell-firgrove-firgrove', 'SPAR Express at Shell Firgrove',
  (SELECT id FROM suburbs WHERE slug = 'firgrove'),
  'Old Main Road, Firgrove, 7130', '021 842 2406', NULL, NULL,
  'SPAR Express at Shell Firgrove is a convenience store at the Shell service station on Old Main Road in Firgrove.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/88cd7d37dc766bf976eafdb3b2a8e709/spar-express-at-shell-firgrove/cape-town/shopping-services-supplies", "https://www.iglobal.co/south-africa/firgrove/spar-express-at-shell-firgrove"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-express-at-shell-firgrove-firgrove'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);
