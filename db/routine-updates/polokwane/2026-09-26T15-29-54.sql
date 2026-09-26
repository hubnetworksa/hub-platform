INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rabie-panel-beaters-nirvana', 'Rabie Panel Beaters',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  '12 Mangaan Street, Unit 2, Nirvana, Polokwane, 0699', '074 441 8900', NULL, NULL,
  'Rabie Panel Beaters is a panelbeating and spray-painting workshop in Nirvana, handling repairs from minor dents to major structural bodywork.',
  NULL, NULL,
  '["https://www.facebook.com/rabiepanelbeaterspolokwane", "https://www.autoyas.com/ZA/Polokwane/1973942872890130/Rabie-Panel-Beaters"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rabie-panel-beaters-nirvana'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lafixa-it-solutions-nirvana', 'Lafixa IT Solutions',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  '9 Bombay Street, Nirvana, Polokwane, 0699', '078 912 4216', NULL, NULL,
  'Lafixa IT Solutions is a Polokwane-based IT company in Nirvana offering computer support and computer repairs, trading since 2006.',
  NULL, NULL,
  '["https://www.facebook.com/MoalafiTechnologies/", "https://www.shopshours.co.za/computer-repair/polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lafixa-it-solutions-nirvana'),
  (SELECT id FROM categories WHERE slug = 'computer-it-services'),
  1
);
