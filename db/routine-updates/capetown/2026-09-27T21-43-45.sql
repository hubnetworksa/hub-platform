INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'palm-tyre-service-maitland', 'Palm Tyre Service',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  '10 Cannon Street, Maitland, Cape Town, 7405', '021 511 6283', NULL, NULL,
  'Palm Tyre Service is a tyre dealer and fitment centre on Cannon Street, in Maitland.',
  NULL, NULL,
  '["https://www.pirelli.com/tyres/en-za/car/find-your-dealer/dealer-locator/south-africa/maitland/za0002400268", "https://www.brabys.com/business/5285097/south-africa/western-cape/cape-town/maitland/cannon-st/tyre-dealers/palm-tyre-service-cc"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'palm-tyre-service-maitland'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kehls-upholstery-suppliers-maitland', 'Kehl''s Upholstery Suppliers',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  '403 Voortrekker Road, Maitland, Cape Town, 7405', '021 511 2061', NULL, NULL,
  'Kehl''s Upholstery Suppliers is a wholesale and retail supplier of upholstery fabric, vinyl, foam and tools, on Voortrekker Road, in Maitland.',
  NULL, NULL,
  '["https://www.kehls.co.za/contact-us/", "https://za.africabz.com/western-cape/kehls-upholstery-suppliers-17241"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kehls-upholstery-suppliers-maitland'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'caterware-connection-maitland', 'Caterware Connection',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  '21 Maitland Business Park, Mowbray Road, Maitland, Cape Town, 7405', '021 510 3175', NULL, NULL,
  'Caterware Connection supplies, installs and maintains commercial catering equipment, in Maitland.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1300768599973888/caterware-connection/cape-town/kitchen-accessories", "https://www.brabys.com/za/western-cape/cape-town/maitland/catering-equipment-suppliers/caterware-connection"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'caterware-connection-maitland'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'paint-chemistry-maitland', 'Paint Chemistry',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  '234 Voortrekker Road, Maitland, Cape Town, 7405', '021 510 8087', NULL, NULL,
  'Paint Chemistry is a paint merchant supplying automotive, wood and industrial refinish coatings, in Maitland.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/paint-chemistry-maitland", "https://www.findglocal.com/ZA/Cape-Town/697450123696124/Paint-chemistry"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'paint-chemistry-maitland'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
