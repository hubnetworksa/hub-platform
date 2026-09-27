INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hugo-the-hair-company-panorama', 'Hugo The Hair Company',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  '56 Panorama Road, Panorama, Cape Town, 7500', '021 930 2194', NULL, NULL,
  'Hugo The Hair Company is a hair salon on Panorama Road in Panorama.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/hugo-the-hair-company-panorama-road-cape-town-q8QyrD", "https://www.brabys.com/za/western-cape/parow/panorama/hair-salons/hugo-the-hair-company"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hugo-the-hair-company-panorama'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lotter-attorneys-panorama', 'Lotter Attorneys',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  '25 Panorama Road, Panorama, Cape Town, 7500', '021 559 4304', NULL, NULL,
  'Lotter Attorneys is a law firm in Panorama specialising in family law, conveyancing, debt collection, and wills and estates.',
  NULL, NULL,
  '["https://lotterattorneys.co.za/", "https://www.sayellow.com/view/south-africa/lotter-attorneys-in-goodwood"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lotter-attorneys-panorama'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'heyns-and-partners-panorama', 'Heyns & Partners Inc',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  'Panorama Healthcare Centre, 1st Floor, 60 Hennie Winterbach Street, Panorama, Cape Town, 7500', '021 590 7200', 'https://heyns.co.za/', NULL,
  'Heyns & Partners Inc is a law firm based at the Panorama Healthcare Centre in Panorama.',
  NULL, NULL,
  '["https://heyns.co.za/contact-us/", "https://za.africabz.com/western-cape/heyns-and-partners-inc-101443"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'heyns-and-partners-panorama'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);
