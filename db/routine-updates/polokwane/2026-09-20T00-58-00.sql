INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bronkhorst-crane-hire-futura', 'Bronkhorst Crane Hire', (SELECT id FROM suburbs WHERE slug = 'futura'),
  '28 Chroom Street, Futura, Polokwane, 0699', '015 293 0927', 'https://www.bronkhorstcranehire.co.za/', NULL,
  'Bronkhorst Crane Hire is a mobile crane hire company in Futura, Polokwane, offering machine moving and rigging services.',
  NULL, NULL,
  '["https://www.findmy.co.za/services/business/bronkhorst-crane-hire/10191", "https://www.brabys.com/za/limpopo/polokwane/machine-moving-specialists/bronkhorst-crane-hire"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bronkhorst-crane-hire-futura'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lenkay-motors-futura', 'Lenkay Motors', (SELECT id FROM suburbs WHERE slug = 'futura'),
  '68 Vermikuliet Street, Futura, Polokwane, 0699', '015 781 2231', 'http://lenkaymotors.co.za/', NULL,
  'Lenkay Motors is a used-car dealership in Futura, Polokwane.',
  NULL, NULL,
  '["https://www.cars.co.za/groups/Individual-Dealers/Lenkay-Motors/4103/", "http://lenkaymotors.co.za/contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lenkay-motors-futura'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'polokwane-power-supplies-futura', 'Polokwane Power Supplies', (SELECT id FROM suburbs WHERE slug = 'futura'),
  '74 Vermikuliet Street, Futura, Polokwane, 0699', '015 293 0610', NULL, 'dwayne@powersupplies.co.za',
  'Polokwane Power Supplies is an industrial electrical and power-supplies distributor in Futura, Polokwane.',
  NULL, NULL,
  '["https://cbi-lowvoltage.co.za/content/polokwane-power-supplies-cc", "https://circuitbreakers.co.za/content/polokwane-power-supplies-cc"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'polokwane-power-supplies-futura'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
