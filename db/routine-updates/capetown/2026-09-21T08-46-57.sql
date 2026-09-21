INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rusthof-secondary-school-lwandle', 'Rusthof Secondary School',
  (SELECT id FROM suburbs WHERE slug = 'lwandle'),
  'Broadlands Rd, Lwandle, Strand, 7140', '021 845 7081', NULL, NULL,
  'Rusthof Secondary School is a public secondary school in Lwandle, Strand.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/strand/lwandle/schools/rusthof-secondary-school", "https://www.yellosa.co.za/company/666136/rusthof-secondary-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rusthof-secondary-school-lwandle'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lombardi-foods-lwandle', 'Lombardi Foods (Pty) Ltd',
  (SELECT id FROM suburbs WHERE slug = 'lwandle'),
  '237 Broadlands Rd, Lwandle, Strand, 7140', '021 845 7272', NULL, NULL,
  'Lombardi Foods (Pty) Ltd is a food processing company on Broadlands Road in Lwandle, Strand.',
  NULL, NULL,
  '["https://www.brabys.com/business/5067842/south-africa/western-cape/strand/lwandle/broadlands-rd/food-processors/lombardi-foods-pty-ltd", "https://www.yellosa.co.za/company/669441/lombardi-foods-pty-ltd"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lombardi-foods-lwandle'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'somerset-timbers-lwandle', 'Somerset Timbers',
  (SELECT id FROM suburbs WHERE slug = 'lwandle'),
  '257 Broadlands Rd, Lwandle, Strand, 7140', '021 845 8713', NULL, NULL,
  'Somerset Timbers is a timber merchant on Broadlands Road in Lwandle, Strand.',
  NULL, NULL,
  '["https://firmania.co.za/strand/somerset-timbers-42517", "https://www.brabys.com/za/western-cape/strand/timber-merchants"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'somerset-timbers-lwandle'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bespoke-joinery-lwandle', 'Bespoke Joinery',
  (SELECT id FROM suburbs WHERE slug = 'lwandle'),
  '253 Broadlands Rd, Lwandle, Strand, 7140', '021 845 6978', NULL, NULL,
  'Bespoke Joinery is a custom joinery and woodworking business on Broadlands Road in Lwandle, Strand, making kitchens, decking and balustrades.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/strand/lwandle/woodworking/bespoke-joinery", "https://www.yep.co.za/biz/store/iyp/15279787_3"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bespoke-joinery-lwandle'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lwandle-migrant-labour-museum-lwandle', 'Lwandle Migrant Labour Museum',
  (SELECT id FROM suburbs WHERE slug = 'lwandle'),
  'Old Community Hall, Vulindlela Street, Lwandle, 7140', '021 845 6119', NULL, NULL,
  'The Lwandle Migrant Labour Museum is a heritage museum in the Old Community Hall in Lwandle, documenting the history of migrant labour and the hostel system under apartheid.',
  NULL, NULL,
  '["https://lwandle.com/?page_id=297", "https://www.sa-venues.com/things-to-do/westerncape/lwandle-migrant-labour-museum/", "https://en.wikipedia.org/wiki/Lwandle_Migrant_Labour_Museum"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lwandle-migrant-labour-museum-lwandle'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);
