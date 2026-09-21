INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'south-pole-studios-salt-river', 'South Pole Studios',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  '100 Voortrekker Road, Salt River, Cape Town', '082 601 7787', NULL, NULL,
  'South Pole Studios is a pole dancing and fitness studio on Voortrekker Road, in Salt River.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/south-pole-studios-voortrekker-road-cape-town-jbKeP4", "https://southpolestudios.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'south-pole-studios-salt-river'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'plumb-crazy-salt-river', 'Plumb Crazy',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  '100 Voortrekker Road, Salt River, Cape Town', '021 511 7818', NULL, NULL,
  'Plumb Crazy is a plumbing, sanitaryware and hardware retailer on Voortrekker Road, in Salt River.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1099860609650688/plumb-crazy-plumbing-sanitaryware-and-hardware/cape-town/home-improvement", "https://www.africabizinfo.com/ZA/plumb-crazy_35-021-511-7818"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'plumb-crazy-salt-river'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
