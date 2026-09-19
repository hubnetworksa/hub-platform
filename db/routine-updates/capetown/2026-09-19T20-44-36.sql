INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'giant-hyper-epping', 'Giant Hyper',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '3 Benbow Avenue, Gunners Circle, Epping, Cape Town', '021 534 5925', 'https://gianthyper.co.za', NULL,
  'Giant Hyper is a wholesale and retail hypermarket at Gunners Circle in Epping, Cape Town.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/gunners-circle/giant-hyper/3-benbow-avenue-epping", "https://gianthyper.co.za/contact-page/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'giant-hyper-epping'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-chips-epping', 'Mr Chips',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '110 Gunners Circle, Epping Industria, Cape Town, 7460', '021 447 1877', NULL, NULL,
  'Mr Chips is a fruit and vegetable processor and factory shop in Epping Industria, Cape Town.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/epping/fruit-vegetable-processors/mr-chips", "https://www.cylex.net.za/company/nutripick-mr-chips--pty--ltd-23688144.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-chips-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hbc-systems-epping', 'HBC Systems',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  'Unit 15, Bofors 3 Industrial Park, 98b Bofors Circle, Epping Industria, Cape Town', '021 534 0240', 'https://hbcsystems.co.za', NULL,
  'HBC Systems supplies, installs and manufactures emergency vehicle equipment, based in Epping Industria, Cape Town.',
  NULL, NULL,
  '["https://hbcsystems.co.za/", "https://www.yep.co.za/biz/store/hbc-systems/314877"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hbc-systems-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
