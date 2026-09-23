INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-stables-shopping-centre-dunoon', 'PEP Stables Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'dunoon'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-stables-shopping-centre-dunoon'),
  'Shop 2B & 3B, The Stables Shopping Centre, Potsdam Rd, Dunoon, Cape Town, 7441', '021 556 4868', NULL, NULL,
  'PEP Stables Shopping Centre is a clothing, footwear and homeware retailer inside The Stables Shopping Centre, Dunoon.',
  NULL, NULL,
  '["https://www.facebook.com/PEPCtMilnertonDunoonStablesSc/", "https://nz.maptons.com/p/15356903174"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-stables-shopping-centre-dunoon'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'du-noon-community-health-centre-dunoon', 'Du Noon Community Health Centre',
  (SELECT id FROM suburbs WHERE slug = 'dunoon'),
  '236 Potsdam Rd, Dunoon, Cape Town, 7441', '021 200 4500', NULL, NULL,
  'Du Noon Community Health Centre is a public primary healthcare facility in Dunoon, offering general and emergency healthcare services.',
  NULL, NULL,
  '["https://www.westerncape.gov.za/health-wellness/facility/du-noon-chc", "https://www.xpose.co.za/listings/dunoon-community-health-centre/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'du-noon-community-health-centre-dunoon'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
