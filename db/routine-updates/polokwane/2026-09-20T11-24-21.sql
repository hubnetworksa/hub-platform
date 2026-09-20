INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'limparts-limpopo-futura', 'Limparts Limpopo',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '45 Lood Street, Futura, Polokwane', '015 293 1380', 'https://limparts.co.za', NULL,
  'Limparts Limpopo is the local branch of a commercial truck and bus parts supplier, stocking mechanical and body parts for Scania, Volvo, Shacman and MAN vehicles, in Futura.',
  NULL, NULL,
  '["https://limparts.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'limparts-limpopo-futura'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'northern-forklifts-futura', 'Northern Forklifts',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '33 Chroom Street, Futura, Polokwane, 0699', '015 293 2818', NULL, NULL,
  'Northern Forklifts services, repairs and hires out forklifts and other material-handling equipment, in Futura.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/439984/northern-forklifts-pty-ltd", "https://polokwane.infoisinfo.co.za/card/northern-forklifts/563334"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'northern-forklifts-futura'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'concor-technicrete-futura', 'Concor Technicrete Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'futura'),
  '35 Emerald Street, Futura, Polokwane', '015 293 2631', 'https://www.technicrete.co.za', NULL,
  'Concor Technicrete Polokwane is a concrete block plant manufacturing precast and concrete building products for the construction and mining industries, in Futura.',
  NULL, NULL,
  '["https://www.technicrete.co.za/location/limpopo-block-plant/", "https://polokwane.infoisinfo.co.za/card/concor-technicrete/231641"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'concor-technicrete-futura'),
  (SELECT id FROM categories WHERE slug = 'building-materials-timber-merchants'),
  1
);
