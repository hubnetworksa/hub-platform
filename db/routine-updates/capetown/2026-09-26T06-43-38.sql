INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nedbank-westgate-mall-westgate', 'Nedbank',
  (SELECT id FROM suburbs WHERE slug = 'westgate'),
  (SELECT id FROM shopping_centers WHERE slug = 'westgate-mall-westgate'),
  'Shop 41C, Westgate Mall, Cnr Vanguard Drive & Morgenster Road, Westgate, Mitchells Plain, Cape Town, 7785', '021 370 1040', NULL, NULL,
  'Nedbank is a bank branch inside Westgate Mall, in Westgate, Mitchells Plain.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/nedbank-mitchells-plain-westgate", "https://nearbyza.com/place/nedbank-mitchell-s-plain-westgate-1"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nedbank-westgate-mall-westgate'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'castor-king-wetton', 'Castor King',
  (SELECT id FROM suburbs WHERE slug = 'wetton'),
  '12 Wetton Park, Dolphin Way, Wetton, Cape Town, 7780', '021 762 8610', 'https://www.castorking.co.za', NULL,
  'Castor King is a supplier of castors, wheels, ladders, skates and lifting equipment, based in Wetton.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/castor-king", "https://www.brabys.com/za/western-cape/cape-town/wetton/castors-wheels/castor-king"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'castor-king-wetton'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'byers-glass-wetton', 'Byers Glass',
  (SELECT id FROM suburbs WHERE slug = 'wetton'),
  '132 Wetton Road, Wetton, Cape Town, 7780', '021 761 1811', NULL, NULL,
  'Byers Glass is a windscreen and motor glass supplier based in Wetton.',
  NULL, NULL,
  '["https://nearfinderza.com/en/business/wc/cape-town/glass-merchants/byers-glass_390128+3.html", "http://www.mapknows.co.za/cape-town/byers-glass-57278/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'byers-glass-wetton'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);
