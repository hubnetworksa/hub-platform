INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'south-african-state-theatre-pretoria-central', 'South African State Theatre',
  (SELECT id FROM suburbs WHERE slug = 'pretoria-central'),
  '320 Pretorius Street, Pretoria Central, Pretoria, 0001', '012 392 4000', 'https://www.statetheatre.co.za', NULL,
  'The South African State Theatre is the largest theatre complex in Africa, with six venues and a seating capacity of around 2,700, hosting opera, ballet, musicals, drama and conferences in Pretoria Central since 1981.',
  NULL, NULL,
  '["https://en.wikipedia.org/wiki/South_African_State_Theatre", "https://www.gov.za/node/767210"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'south-african-state-theatre-pretoria-central'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'national-zoological-garden-pretoria-central', 'National Zoological Garden',
  (SELECT id FROM suburbs WHERE slug = 'pretoria-central'),
  '232 Boom Street, Pretoria Central, Pretoria, 0001', '012 339 2700', 'https://www.nzg.ac.za', NULL,
  'The National Zoological Garden, also known as Pretoria Zoo, is an 85-hectare zoo founded in 1899 with over 700 animal species and South Africa''s largest inland marine aquarium, open daily from 09:00 to 17:30.',
  NULL, NULL,
  '["https://briefly.co.za/26383-what-pretoria-zoo-entrance-fees-2021.html", "https://www.timeout.com/pretoria/things-to-do/pretoria-zoo"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'national-zoological-garden-pretoria-central'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);
