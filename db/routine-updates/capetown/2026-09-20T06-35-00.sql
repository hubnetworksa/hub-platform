INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'excellent-meat-market-elsies-river', 'Excellent Meat Market',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  'Corner Epping Avenue & Halt Road, Elsies River, Cape Town', '021 932 6291', NULL, NULL,
  'Excellent Meat Market is a family-run butchery in Elsies River specialising in Halaal beef, lamb and poultry, operating since 1970.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/elsies-river/butchers-wholesalers/excellent-meat-market", "https://excellentmeat.co.za/find-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'excellent-meat-market-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'weavewell-elsies-river', 'Weavewell',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '14 Coleman Street, Elsies River, Cape Town, 7490', '021 591 1181', NULL, NULL,
  'Weavewell is a manufacturer and factory outlet of industrial webbing, woven tape and decorative ribbon based in Elsies River.',
  NULL, NULL,
  '["https://weavewell.co.za/contact-weavewell/", "https://factoryshops.co.za/weavewell-factory-outlet-elsies-river/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'weavewell-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
