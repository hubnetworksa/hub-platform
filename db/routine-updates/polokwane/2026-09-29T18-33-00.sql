INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rev-m-p-malatjie-primary-school-seshego', 'Rev M.P. Malatjie Primary School',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  '711 Zone 8, Seshego, Polokwane, 0742', '015 223 5039', NULL, NULL,
  'Rev M.P. Malatjie Primary School is a public, no-fee primary school in Zone 8, Seshego.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/rev-m-p-malatjie/", "https://skools.co.za/listings/rev-m-p-malatjie-primary-school/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rev-m-p-malatjie-primary-school-seshego'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'alf-makaleng-primary-school-seshego', 'Alf Makaleng Primary School',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  '557 Helen Joseph St, Zone 2, Seshego, Polokwane, 0742', '015 223 1871', NULL, NULL,
  'Alf Makaleng Primary School is a public primary school in Zone 2, Seshego.',
  NULL, NULL,
  '["https://schoolsdigest.co.za/listings/alf-makaleng/", "https://www.waze.com/live-map/directions/alf-makaleng-primary-school-helen-joseph-st-557-seshego,-polokwane"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'alf-makaleng-primary-school-seshego'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hairby-ntshunxeko-seshego', 'Hairby Ntshunxeko',
  (SELECT id FROM suburbs WHERE slug = 'seshego'),
  'House 1057, 17 141st Street, Zone 8, Seshego, Polokwane, 0742', '078 248 1424', NULL, NULL,
  'Hairby Ntshunxeko is an appointment-only hair braiding and styling salon in Zone 8, Seshego, specialising in cornrows and hair installations.',
  NULL, NULL,
  '["https://www.facebook.com/p/Hairby-Ntshunxeko-100072040531565/", "https://www.instagram.com/hairbyntshunxeko/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hairby-ntshunxeko-seshego'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
