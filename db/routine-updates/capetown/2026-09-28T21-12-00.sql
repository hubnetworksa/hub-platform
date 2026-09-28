-- Parklands: 1 new shopping centre (Parklands Junction) with 2 tenants + 1 more Emporium Centre tenant

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'parklands-junction-parklands', 'Parklands Junction',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  'Cnr Parklands Main Road & Wood Drive, Parklands, Cape Town, 7441', NULL, NULL,
  '["https://www.sluurpy.co.za/cape-town/restaurant/5039423/mcdonald-s-parklands", "https://za.polomap.com/cape-town/5015", "https://tableviewinfo.co.za/romans-pizza-parklands/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mcdonalds-parklands', 'McDonald''s Parklands',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'parklands-junction-parklands'),
  'Shop 13, Parklands Junction Shopping Centre, Cnr Parklands Lane & Wood Drive, Parklands, Cape Town, 7441', '021 557 1131', NULL, NULL,
  'McDonald''s Parklands is a fast-food restaurant in Parklands Junction Shopping Centre.',
  NULL, NULL,
  '["https://za.polomap.com/cape-town/5925", "https://www.sluurpy.co.za/cape-town/restaurant/5039423/mcdonald-s-parklands"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mcdonalds-parklands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'romans-pizza-parklands', 'Roman''s Pizza Parklands',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'parklands-junction-parklands'),
  'Shop 6B, Parklands Junction, Cnr Parklands Main Road & Wood Drive, Parklands, Cape Town, 7441', '021 556 9800', NULL, NULL,
  'Roman''s Pizza Parklands is a pizza takeaway and delivery shop in Parklands Junction Shopping Centre.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/romans-pizza-parklands-17247", "https://tableviewinfo.co.za/romans-pizza-parklands/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'romans-pizza-parklands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-emporium-parklands', 'PostNet Emporium Parklands',
  (SELECT id FROM suburbs WHERE slug = 'parklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'emporium-centre-parklands'),
  'Shop 27, The Emporium Centre, Cnr Woodlands Way & Sandown Road, Parklands, Cape Town, 7441', '021 554 0293', 'https://www.postnet.co.za/stores/sandown', NULL,
  'PostNet Emporium Parklands is a courier, printing and mailbox-services store in the Emporium Centre, Parklands.',
  NULL, NULL,
  '["https://www.postnet.co.za/stores/sandown", "https://za.africabz.com/western-cape/postnet-table-view-sandown-178598"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-emporium-parklands'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);
