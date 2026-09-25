-- Jobs 1-2: suburb research -- ndabeni (5 new businesses, all standalone industrial premises)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'voltmill-ndabeni', 'Voltmill',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  'Unit 12, Old Mill Square, 50 Old Mill Road, Ndabeni, Cape Town, 7405', '078 095 4453', 'https://voltmill.co.za/', NULL,
  'Voltmill is a supplier and installer of generators and solar energy systems, operating from Old Mill Square in Ndabeni.',
  NULL, NULL,
  '["https://voltmill.co.za/contact/", "https://www.cylex.net.za/company/voltmill-generators-and-solar-western-cape-23870206.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'voltmill-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'solar-renewable-energy'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'freeline-ndabeni', 'Freeline',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '1st Floor Sunrise Building, 55 Morningside Drive, Ndabeni, Cape Town, 7405', '021 531 2526', 'https://freeline.co.za/', NULL,
  'Freeline is a garment printing business in Ndabeni offering screenprint, sublimation, digital print, vinyl cut and transfer services.',
  NULL, NULL,
  '["https://freeline.co.za/contact/", "https://www.africanadvice.com/1258202/Screen_Printers/Cape_Town/Freeline_Screenprint/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'freeline-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'anchor-industries-ndabeni', 'Anchor Industries',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  'Anchor House, 20 Old Mill Road, Ndabeni, Cape Town, 7405', '021 531 0525', 'https://anchors.co.za/', NULL,
  'Anchor Industries supplies, tests and rents marine and offshore mooring, lifting and rigging equipment from its Ndabeni base.',
  NULL, NULL,
  '["https://anchors.co.za/contact/", "https://za.africabz.com/western-cape/anchor-industries-145157"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'anchor-industries-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'superior-packaging-industries-ndabeni', 'Superior Packaging Industries',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '24 Old Mill Road, Ndabeni, Cape Town, 7405', '021 531 6634', 'https://superiorpackaging.co.za/', NULL,
  'Superior Packaging Industries is a packaging manufacturer based in Ndabeni, supplying packaging products under its AgriPack line.',
  NULL, NULL,
  '["https://superiorpackaging.co.za/contact/", "https://www.brabys.com/za/western-cape/cape-town/ndabeni/packaging-companies/superior-packaging-industries"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'superior-packaging-industries-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ellies-electronics-cape-ndabeni', 'Ellies Electronics Cape',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '47 Morningside Road, Ndabeni, Cape Town, 7405', '021 532 2225', 'https://www.ellies.co.za/', NULL,
  'Ellies Electronics Cape is an electronics, lighting and electrical products distributor operating from Morningside Road in Ndabeni.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/ellies-electronics-17503526.html", "https://www.yep.co.za/biz/store/ellies-pty-ltd/79434", "https://www.callupcontact.com/b/business/Ellies_Electronics_Cape/56943"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ellies-electronics-cape-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);
