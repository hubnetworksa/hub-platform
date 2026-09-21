INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tafelberg-furnishers-diep-river', 'Tafelberg Furnishers',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  'Mamacos House, 111 Main Road, Diep River, Cape Town, 7800', '021 715 8486', 'https://www.tafelberg.co.za', NULL,
  'Tafelberg Furnishers is a furniture retailer on Main Road in Diep River, part of the national Tafelberg Furnishers chain.',
  NULL, NULL,
  '["https://za.polomap.com/cape-town/163555", "https://www.tiendeo.co.za/stores/cape-town/tafelberg-furnishers"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tafelberg-furnishers-diep-river'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'readers-warehouse-factory-store-diep-river', 'Readers Warehouse Factory Store',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  'Unit D1, Diep River Industrial Park, 118 Princess Vlei Road, Diep River, Cape Town, 7800', '021 705 6812', 'https://www.readerswarehouse.co.za', NULL,
  'Readers Warehouse Factory Store is a discount and clearance bookstore in the Diep River Industrial Park.',
  NULL, NULL,
  '["https://www.findglocal.com/ZA/Cape-Town/606029066419340/Readers-Warehouse-Factory-Store", "https://www.waze.com/live-map/directions/za/wc/cape-town/readers-warehouse?to=place.ChIJyUmP0otDzB0RdSmeC8zEHrM"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'readers-warehouse-factory-store-diep-river'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jack-black-brewing-company-diep-river', 'Jack Black Brewing Company',
  (SELECT id FROM suburbs WHERE slug = 'diep-river'),
  '10 Brigid Road, Diep River, Cape Town', '021 286 1220', NULL, NULL,
  'Jack Black Brewing Company is an independently owned craft brewery in Diep River, with a tasting room, small food menu and retail shop, open since 2016.',
  NULL, NULL,
  '["https://constantiavalley.com/jack-black-brewing-company/", "https://www.eatout.co.za/venue/jack-blacks-brewing-co/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jack-black-brewing-company-diep-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
