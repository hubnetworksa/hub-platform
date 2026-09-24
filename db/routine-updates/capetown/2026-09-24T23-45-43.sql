INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'knead-bakery-panorama', 'Knead Bakery',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  'Panorama Healthcare Centre, Cnr Rothschild Boulevard & Hennie Winterbach Street, Panorama, Cape Town, 7500', '021 911 3526', NULL, NULL,
  'Knead Bakery is an artisan bakery and cafe inside the Panorama Healthcare Centre, baking bread by hand daily using natural yeasts and time-honoured methods.',
  NULL, NULL,
  '["https://www.kneadbakery.co.za/knead-panorama", "https://www.panoramahcc.co.za/tenants/knead-bakery/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'knead-bakery-panorama'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'intercare-panorama', 'Intercare Panorama',
  (SELECT id FROM suburbs WHERE slug = 'panorama'),
  'Shop 9, Panorama Healthcare Centre, Rothschild Boulevard, Panorama, Cape Town, 7500', '021 879 0400', NULL, NULL,
  'Intercare Panorama is a family medical practice inside the Panorama Healthcare Centre, offering general practitioner care with a focus on children''s health and sports medicine.',
  NULL, NULL,
  '["https://www.intercare.co.za/facilities/intercare-panorama", "https://www.panoramahcc.co.za/tenants/intercare-medical-centre/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'intercare-panorama'),
  (SELECT id FROM categories WHERE slug = 'clinics-healthcare'),
  1
);
