-- Jobs 1-2: suburb research -- paarden-eiland, ysterplaat (rugby: no qualifying businesses)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clearance-warehouse-paarden-eiland', 'Clearance Warehouse',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '17 Paarden Eiland Road, Paarden Eiland, Cape Town', '021 512 2600', NULL, NULL,
  'Clearance Warehouse is a tile and sanitaryware retailer selling at clearance prices, in Paarden Eiland.',
  NULL, NULL,
  '["https://clearancewarehouse.co.za/pages/contact-us", "https://opening-hours.co.za/02794464/Clearance_Warehouse"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clearance-warehouse-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-pole-yard-paarden-eiland', 'The Pole Yard',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '39 Paarden Eiland Road, Paarden Eiland, Cape Town', '021 510 4477', NULL, NULL,
  'The Pole Yard is a timber specialist supplying poles, fencing and garden and building timber products, in Paarden Eiland.',
  NULL, NULL,
  '["https://www.poleyard.co.za/our-branches/", "https://za.africabz.com/western-cape/the-pole-yard-73833"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-pole-yard-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steven-johnson-cars-paarden-eiland', 'Steven Johnson Cars',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  'Cnr Milner Street and Marine Drive, Paarden Eiland, Cape Town', '021 510 8222', NULL, NULL,
  'Steven Johnson Cars is a pre-owned vehicle dealership in Paarden Eiland, trading since 1983.',
  NULL, NULL,
  '["https://stevenjohnsoncars.co.za/contact/", "https://za.africabz.com/western-cape/steven-johnson-cars-cc-66596"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steven-johnson-cars-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'flooring-warehouse-paarden-eiland', 'Flooring Warehouse',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '39 Gold Street, North Gate Estate, Paarden Eiland, Cape Town', '021 511 1609', NULL, NULL,
  'Flooring Warehouse is a flooring retailer in North Gate Estate, Paarden Eiland.',
  NULL, NULL,
  '["https://www.flooringwarehouse.co.za/pages/contact", "https://northgateestate.co.za/flooring-warehouse/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'flooring-warehouse-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'builders-warehouse-ysterplaat', 'Builders Warehouse',
  (SELECT id FROM suburbs WHERE slug = 'ysterplaat'),
  'Platinum Road, Northgate Extension, Ysterplaat, Cape Town, 7405', '021 506 1001', NULL, NULL,
  'Builders Warehouse is a branch of the national hardware and building materials retail chain, in Northgate Extension, Ysterplaat.',
  NULL, NULL,
  '["https://www.jojo.co.za/distributor/builders-warehouse-ysterplaat/", "https://www.tiendeo.co.za/stores/cape-town/builders-warehouse-platinum-road-northgate-ext-ysterplaat/4871"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'builders-warehouse-ysterplaat'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
