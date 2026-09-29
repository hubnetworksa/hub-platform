INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'appa-anderson-perry-partnership-architects-rosebank', 'APPA - Anderson Perry Partnership Architects',
  (SELECT id FROM suburbs WHERE slug = 'rosebank'),
  '16 Alma Road, Rosebank, Cape Town, 7700', '021 461 1844', NULL, NULL,
  'APPA is an architecture and design studio in Rosebank working on industrial, commercial and residential projects.',
  NULL, NULL,
  '["https://www.appa.za.com/contact", "https://rsa.worldorgs.com/catalog/cape-town/architect/appa-anderson-perry-partnership-architects"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'appa-anderson-perry-partnership-architects-rosebank'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'campuskey-rosebank-rosebank', 'CampusKey Rosebank',
  (SELECT id FROM suburbs WHERE slug = 'rosebank'),
  '24C Main Road, corner Rose Street, Rosebank, Cape Town, 7700', '0861 788 3368', NULL, NULL,
  'CampusKey Rosebank is a private student residence near UCT offering private rooms and social spaces.',
  NULL, NULL,
  '["https://campuskey.co.za/location/cape-town/", "https://postmatric.co.za/student-accommodation/otgl/campuskey-rosebank-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'campuskey-rosebank-rosebank'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
