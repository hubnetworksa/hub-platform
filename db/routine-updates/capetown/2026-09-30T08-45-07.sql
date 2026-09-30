INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steel-pipes-for-africa-epping', 'Steel & Pipes for Africa',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '30 Hewett Avenue, Epping Industria, Cape Town, 7475', '021 530 2500', 'https://spfa.co.za', 'admin@spfa.co.za',
  'Steel & Pipes for Africa is a steel and piping supplier and service centre on Hewett Avenue in Epping Industria, part of the national Steel & Pipes for Africa group.',
  NULL, NULL,
  '["https://spfa.co.za/contact/", "https://www.hotfrog.co.za/company/1198140704030720"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steel-pipes-for-africa-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mpact-plastics-epping', 'Mpact Plastics',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  'Cnr Bofors Circle & Losack Avenue, Epping 2, Cape Town, 7460', '021 505 9840', 'https://www.mpactplastics.co.za', NULL,
  'Mpact Plastics is the Western Cape divisional office of the Mpact packaging group, supplying rigid plastic packaging from Bofors Circle in Epping.',
  NULL, NULL,
  '["https://www.webpackaging.com/en/portals/mpactplastics/assets/13082249/epping-admincentral-office/", "https://za.kompass.com/c/mpact-corrugated-epping/zan563149/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mpact-plastics-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'transcape-steels-epping', 'Transcape Steels',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '26 Nourse Avenue, Epping Industrial 2, Cape Town', '021 534 3211', 'https://transcapesteels.co.za', 'sales@transcape.co.za',
  'Transcape Steels is a steel supplier and service centre on Nourse Avenue in Epping Industrial.',
  NULL, NULL,
  '["https://transcapesteels.co.za/contact-us-2/", "https://www.sayellow.com/view/south-africa/transcape-steels-cape-town-hq-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'transcape-steels-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
