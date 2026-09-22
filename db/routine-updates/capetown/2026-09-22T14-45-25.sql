INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'elvey-security-technologies-brooklyn', 'Elvey Security Technologies',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  '2 Northgate Estate, 4 Gold Street, Brooklyn, Cape Town, 7405', '021 448 6390', NULL, NULL,
  'Elvey Security Technologies is a security equipment supplier and distributor with a branch in Northgate Estate, Brooklyn.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/elvey-security-technologies-177715", "https://elvey.co.za/find-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'elvey-security-technologies-brooklyn'),
  (SELECT id FROM categories WHERE slug = 'security-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ctm-northgate-brooklyn', 'CTM Northgate',
  (SELECT id FROM suburbs WHERE slug = 'brooklyn'),
  '3 Platinum Drive, Northgate Estate, Brooklyn, Cape Town, 7405', '021 510 3307', NULL, NULL,
  'CTM Northgate is a tile, bathroom and building materials retailer in Northgate Estate, Brooklyn.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/ctm-paarden-eiland-northgate", "https://za.africabz.com/western-cape/ctm-paarden-eiland-43949"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ctm-northgate-brooklyn'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
