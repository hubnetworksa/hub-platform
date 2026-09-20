INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bonteheuwel-pharmacy-bonteheuwel', 'Bonteheuwel Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'bonteheuwel'),
  '488 Bonteheuwel Avenue, Bonteheuwel, Cape Town, 7764', '021 694 7796', NULL, NULL,
  'Bonteheuwel Pharmacy is a pharmacy on Bonteheuwel Avenue in Bonteheuwel.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=88751", "https://www.cybo.com/ZA-biz/bonteheuwel-pharmacy_1M"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bonteheuwel-pharmacy-bonteheuwel'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkout-bonteheuwel-bonteheuwel', 'Checkout Bonteheuwel',
  (SELECT id FROM suburbs WHERE slug = 'bonteheuwel'),
  '172 Jakkalsvlei Avenue, Bonteheuwel, Cape Town, 7764', '021 694 4401', NULL, NULL,
  'Checkout Bonteheuwel is a supermarket on Jakkalsvlei Avenue in Bonteheuwel.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/checkout-bonteheuwel-125991", "https://www.yep.co.za/biz/store/iyp/15569262_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkout-bonteheuwel-bonteheuwel'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'modacks-superstore-bonteheuwel', 'Modack''s Superstore',
  (SELECT id FROM suburbs WHERE slug = 'bonteheuwel'),
  '176 Jakkalsvlei Avenue, Bonteheuwel, Cape Town, 7764', '021 694 4107', NULL, NULL,
  'Modack''s Superstore is a supermarket on Jakkalsvlei Avenue in Bonteheuwel.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/modack''s-supermarket-15490848.html", "https://www.thinklocal.co.za/biz/modacks-superstore-bonteheuwel"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'modacks-superstore-bonteheuwel'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
