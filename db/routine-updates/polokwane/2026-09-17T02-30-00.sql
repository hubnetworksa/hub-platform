INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'mohlakaneng-shopping-centre-seshego', 'Mohlakaneng Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  'F26, Polokwane Drive, Seshego-B, Polokwane', NULL, NULL,
  '["https://vymaps.com/ZA/Mohlakaneng-shopping-complex-212286/", "https://sabusinesslistings.co.za/listings/unjani-clinic-n-p-c-seshego/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'topt-seshego', 'TopT',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  (SELECT id FROM shopping_centers WHERE slug = 'madiba-park-shopping-centre-seshego'),
  'Madiba Park Complex, Cnr Nelson Mandela Dr & Madiba Park Crossing, Seshego', '079 340 2881', 'https://www.topt.co.za', NULL,
  'TopT Seshego is a branch of the tile and bathroomware retail chain, selling floor and wall tiles, porcelain tiles, showers, taps and basins, in Madiba Park, Seshego.',
  NULL, NULL,
  '["https://www.topt.co.za/storefinder/store/seshego", "https://www.waze.com/live-map/directions/za/lp/polokwane/topt-seshego"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'topt-seshego'),
  (SELECT id FROM categories WHERE slug = 'building-materials-timber-merchants'),
  1
);
