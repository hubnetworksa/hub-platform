-- Jobs 1-2: Salt River suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dimensions-tent-and-structures-salt-river', 'Dimensions Tent & Structures',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  '19 Voortrekker Road, Salt River, Cape Town', '021 510 1043', 'https://dimensionstents.com/', 'info@dimensionstents.com',
  'Dimensions Tent & Structures is a Salt River-based manufacturer and hire company for stretch tents and event structures.',
  NULL, NULL,
  '["https://dimensionstents.com/contact-us/", "https://www.facebook.com/DimensionsTentsAndStructures/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dimensions-tent-and-structures-salt-river'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'artappel-prop-hire-salt-river', 'Artappel Prop Hire',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  'Transnet Industrial Park, 19a Voortrekker Road, Salt River, Cape Town', '021 510 1013', 'https://www.artappel.co.za/', NULL,
  'Artappel Prop Hire is a prop rental business based in the Transnet Industrial Park in Salt River, supplying props for film, events and photography.',
  NULL, NULL,
  '["https://www.artappel.co.za/contact/", "https://b2bhint.com/en/company/za/artappel-prophire--B2009142051"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'artappel-prop-hire-salt-river'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-of-storms-distilling-company-salt-river', 'Cape of Storms Distilling Company',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  'The Spice Yard, Unit RS03, 100 Voortrekker Road, Salt River, Cape Town', '078 233 8375', 'https://capeofstormsdistillery.com/', 'info@capeofstormsdistillery.com',
  'Cape of Storms Distilling Company is a craft rum distillery in the Spice Yard on Voortrekker Road, Salt River, offering tastings and tours.',
  NULL, NULL,
  '["https://capeofstormsdistillery.com/contact/", "https://www.tripadvisor.com/Attraction_Review-g1722390-d18856854-Reviews-Cape_Of_Storms_Distilling_Company-Cape_Town_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-of-storms-distilling-company-salt-river'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'buco-salt-river-salt-river', 'BUCO Salt River',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  '9 Brickfield Road, Salt River, Cape Town', '021 448 9471', 'https://www.buco.co.za/', 'customercare@buco.co.za',
  'BUCO Salt River is a hardware and building supplies store on Brickfield Road, Salt River.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/buco-cape-town-3842", "https://www.cybo.com/ZA-biz/buco-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'buco-salt-river-salt-river'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
