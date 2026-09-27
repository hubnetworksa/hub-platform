INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ellies-electronics-ndabeni', 'Ellies Electronics',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '47 Morningside Road, Ndabeni, Cape Town, 7405', '021 532 2225', 'https://ellies.co.za/', NULL,
  'Ellies Electronics is a manufacturer, importer, wholesaler and distributor of lighting, electrical and electronic products, in Ndabeni.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/ellies-electronics-17503526.html", "https://ellies.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ellies-electronics-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cci-technology-solutions-ndabeni', 'CCI Technology Solutions',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  'Unit A30 Pinelands Business Park, 4 New Mill Road, Ndabeni, Cape Town, 7405', '021 531 0850', 'https://cci.co.za/', NULL,
  'CCI Technology Solutions is an IT convergence company in Ndabeni specialising in network cabling, wireless connectivity and turnkey electrical and power solutions.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/ndabeni/data-communication-systems-equipment/c-c-i-technology-solutions", "https://cci.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cci-technology-solutions-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);
