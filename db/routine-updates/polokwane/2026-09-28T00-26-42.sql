INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'limpopo-structures-ladanna', 'Limpopo Structures',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '37 Platinum Street, Ladanna, Polokwane, 0699', '015 297 2200', NULL, NULL,
  'Limpopo Structures is a steel structure manufacturer in Ladanna, Polokwane, supplying steel fabrication and structural work.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/limpopo-structures-polokwane", "https://www.polokwane.info/steel-manufacturers-in-polokwane/limpopo-structures-2/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'limpopo-structures-ladanna'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ndzalama-training-ladanna', 'Ndzalama Training',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '46 Platinum Street, Ladanna, Polokwane, 0700', '015 590 0732', NULL, 'info@ndzalama.org.za',
  'Ndzalama Training is an accredited education, training and development provider in Ladanna, Polokwane, running accredited facilitator and assessor training courses, operating since 2002.',
  NULL, NULL,
  '["https://ndzalama.org.za/contact-plk.html", "https://www.facebook.com/NdzalamaTraining.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ndzalama-training-ladanna'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'grandmark-international-ladanna', 'Grandmark International',
  (SELECT id FROM suburbs WHERE slug = 'ladanna'),
  '65 Silicon Street, Ladanna, Polokwane, 0699', '015 285 0400', 'https://www.grandmarkltd.com/polokwane/index.html', 'infopol@grandmark.co.za',
  'Grandmark International is a motor vehicle spare parts supplier in Ladanna, Polokwane.',
  NULL, NULL,
  '["https://www.grandmarkltd.com/polokwane/index.html", "https://www.brabys.com/za/limpopo/polokwane/ladine/motor-vehicle-parts/grandmark-international"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'grandmark-international-ladanna'),
  (SELECT id FROM categories WHERE slug = 'motor-spares'),
  1
);
