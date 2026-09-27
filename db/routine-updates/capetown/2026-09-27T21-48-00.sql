INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tile-factory-shop-paarden-eiland', 'Tile Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '49 Paarden Eiland Road, Paarden Eiland, Cape Town, 7405', '021 510 4102', NULL, NULL,
  'Tile Factory Shop is a tile, mosaic and sanitaryware outlet on Paarden Eiland Road, in Paarden Eiland.',
  NULL, NULL,
  '["https://www.instagram.com/kalestilesfactoryshop/", "https://kalestiles.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tile-factory-shop-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spk-engineering-supplies-paarden-eiland', 'SPK Engineering Supplies',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '25 Paarden Eiland Road, Paardeneiland, Cape Town, 7420', '021 510 4928', NULL, NULL,
  'SPK Engineering Supplies is a supplier of industrial cutting tools and engineering products, in Paarden Eiland.',
  NULL, NULL,
  '["http://www.spk-sa.co.za/", "https://www.yep.co.za/biz/store/s-p-k-engineering-supplies/216767"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spk-engineering-supplies-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'peninsula-power-products-paarden-eiland', 'Peninsula Power Products',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  'Invicta House, 6 Calcutta Street, Paarden Eiland, Cape Town, 7405', '021 511 5061', NULL, NULL,
  'Peninsula Power Products supplies industrial gearboxes, engines and power transmission equipment, in Paarden Eiland.',
  NULL, NULL,
  '["https://www.facebook.com/PeninsulaPowerProducts/", "https://www.cylex.net.za/company/peninsula-power-products-15497447.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'peninsula-power-products-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'grandi-manufacturing-paarden-eiland', 'Grandi Manufacturing',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '35 Paarden Eiland Road, Paarden Eiland, Cape Town, 7405', '021 511 1538', NULL, NULL,
  'Grandi Manufacturing is a precision metal processing and engineering manufacturing business, in Paarden Eiland.',
  NULL, NULL,
  '["https://grandi.co.za/contact-us/", "https://www.brabys.com/za/western-cape/cape-town/paarden-eiland/engineers-contractors/grandi-manufacturing-cc"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'grandi-manufacturing-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
