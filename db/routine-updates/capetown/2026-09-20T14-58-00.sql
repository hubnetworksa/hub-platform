INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wetton-hardware-wetton', 'Wetton Hardware',
  (SELECT id FROM suburbs WHERE slug = 'wetton'),
  '27 Dolphin Way, Wetton, Cape Town', '021 761 1775', 'https://buildandsave.co/', NULL,
  'Wetton Hardware (trading as Build & Save Wetton) is a family-owned hardware and building-materials store on Dolphin Way in Wetton, serving the building and DIY community since 1982.',
  NULL, NULL,
  '["https://buildandsave.co/", "https://sabusinesslistings.co.za/listings/wetton-hardware/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wetton-hardware-wetton'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'safetop-wetton', 'SafeTop',
  (SELECT id FROM suburbs WHERE slug = 'wetton'),
  'Pride Park, Corner Dolphin & Wetwyn Road, Wetton, Cape Town', '021 797 3520', 'https://www.safetopdiy.co.za/', NULL,
  'SafeTop is a fastener and hardware supplier based at Pride Park in Wetton, stocking a large range of trade and DIY hardware products.',
  NULL, NULL,
  '["https://www.safetopdiy.co.za/contact/", "https://www.facebook.com/SafeTopdiy/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'safetop-wetton'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wellington-fruit-growers-wetton', 'Wellington Fruit Growers',
  (SELECT id FROM suburbs WHERE slug = 'wetton'),
  'Unit C3, 141 Wetton Road, Wetton, Cape Town', '021 704 1800', 'https://wellingtonfruitgrowers.co.za/', NULL,
  'Wellington Fruit Growers is a dried fruit, nut and confectionery retailer and distributor operating since 1904, based on Wetton Road in Wetton.',
  NULL, NULL,
  '["https://wellingtonfruitgrowers.co.za/", "https://www.brabys.com/za/western-cape/cape-town/wetton/dry-fruit/wellington-fruit-growers-head-office"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wellington-fruit-growers-wetton'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
