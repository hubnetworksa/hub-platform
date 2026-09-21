INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'faw-polokwane-nirvana', 'FAW Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  '204 Tagore Street, Nirvana, Polokwane, 0699', '015 110 0635', NULL, NULL,
  'FAW Polokwane is an authorised FAW commercial truck dealership in Nirvana, selling and servicing new and used FAW trucks.',
  NULL, NULL,
  '["https://bbfawpolokwane.co.za/contact-us/", "https://bbgroup.co.za/faw/branches/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'faw-polokwane-nirvana'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'iveco-polokwane-nirvana', 'Iveco Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  'Ext 1, Tagore Street, Nirvana, Polokwane, 0699', '015 110 0635', NULL, NULL,
  'Iveco Polokwane is an authorised Iveco commercial truck dealership in Nirvana, selling and servicing new and used Iveco trucks.',
  NULL, NULL,
  '["http://bbivecopolokwane.co.za/contact-us/", "https://bbgroup.co.za/iveco/branches/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'iveco-polokwane-nirvana'),
  (SELECT id FROM categories WHERE slug = 'car-dealerships'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'si-hardware-polokwane-nirvana', 'SI Hardware Polokwane',
  (SELECT id FROM suburbs WHERE slug = 'nirvana'),
  '38 Gypsum Street, Nirvana, Polokwane, 0699', '015 590 0497', NULL, NULL,
  'SI Hardware Polokwane is a hardware store in Nirvana supplying building materials and tools.',
  NULL, NULL,
  '["https://www.facebook.com/sihpolokwane/posts/38-gypsum-street-nirvanapolokwane015-590-0497/443584203086038/", "https://opening-hours.co.za/03848826/SI_Hardware_Polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'si-hardware-polokwane-nirvana'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
