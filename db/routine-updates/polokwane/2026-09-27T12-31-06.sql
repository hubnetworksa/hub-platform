INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'max-hydraulics-futura', 'Max Hydraulics',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '61 Koper Street, Futura, Polokwane, 0699', '+27 72 315 5100', NULL, 'maxhydraulics8@gmail.com',
  'Max Hydraulics is a hydraulics engineering workshop in the Futura industrial area of Polokwane, repairing and supplying hydraulic components and systems.',
  NULL, NULL,
  '["https://www.facebook.com/maxhydraulicslimpopo/", "https://www.instagram.com/maxhydraulics22/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'max-hydraulics-futura'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pietersburg-motor-diesel-services-futura', 'Pietersburg Motor & Diesel Services',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '43 Lood Street, Futura, Polokwane, 0699', '+27 83 442 3690', 'https://pietersburgmotoranddiesel.co.za/', NULL,
  'Pietersburg Motor & Diesel Services is a commercial truck and bus repair workshop in the Futura industrial area of Polokwane, offering 24-hour breakdown service.',
  NULL, NULL,
  '["https://pietersburgmotoranddiesel.co.za/", "https://www.findmy.co.za/services/business/pietersburg-motor-diesel/58740"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pietersburg-motor-diesel-services-futura'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);
