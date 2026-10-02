INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-kuilsriver-kuils-river', 'PostNet Kuilsriver',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  'Shop 7, Kerkplein Centre, 53 Van Riebeeck Road, Kuils River, Cape Town', '021 903 0491', 'https://www.postnet.co.za/stores/kuilsriver', 'kuilsriver@postnet.co.za',
  'PostNet Kuilsriver is a PostNet store offering copying, printing and document and parcel services, in Kuils River.',
  NULL, NULL,
  '["https://www.postnet.co.za/stores/kuilsriver", "https://za.africabz.com/western-cape/postnet-kuilsriver-161425"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-kuilsriver-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mmh-law-kuils-river', 'MMH Law',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  'Marais Muller Building, 58 Van Riebeeck Road, Kuils River, 7580', '021 900 5300', 'https://mmh.law', NULL,
  'MMH Law is a law firm, established in 1945, offering property, labour, litigation and family law services from its Kuils River branch.',
  NULL, NULL,
  '["https://mmh.law/contact-us/", "https://za.africabz.com/western-cape/marais-muller-hendricks-inc-74283"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mmh-law-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);
