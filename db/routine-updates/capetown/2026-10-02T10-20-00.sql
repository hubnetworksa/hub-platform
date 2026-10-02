INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'l-and-l-motors-parow', 'L & L Motors',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  '67 Voortrekker Road, Parow, 7500', '021 930 1507', 'https://llmotors.co.za', NULL,
  'L & L Motors is a used car dealership established in 1942, in Parow.',
  NULL, NULL,
  '["https://llmotors.co.za/", "https://www.cars.co.za/groups/Individual-Dealers/L-and-L-Motors/6304/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'l-and-l-motors-parow'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'v5-auto-traders-parow', 'V5 Auto Traders',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  '120 Voortrekker Road, Parow, 7500', '021 911 0837', 'https://v5auto.co.za', 'info@v5auto.co.za',
  'V5 Auto Traders is a second-hand car dealership on Voortrekker Road, in Parow.',
  NULL, NULL,
  '["https://v5auto.co.za/contact-us/", "https://ngenala.co.za/business/v5-auto-traders-cape-town/5f5c947496475fc10457d485"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'v5-auto-traders-parow'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);
