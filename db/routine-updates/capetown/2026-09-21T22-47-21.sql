INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'beau-constantia-constantia', 'Beau Constantia',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  '1043 Constantia Main Road, Constantia, 7806', '021 794 8632', 'https://www.beauconstantia.com/', 'reservations@beauconstantia.com',
  'Beau Constantia is a boutique wine farm at the top of Constantia Nek, offering wine tastings with views over False Bay.',
  NULL, NULL,
  '["https://constantiawineroute.com/beau-constantia/", "https://www.beauconstantia.com/", "https://www.beauconstantia.com/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'beau-constantia-constantia'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'klein-constantia-constantia', 'Klein Constantia',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  '37 Klein Constantia Road, Constantia, 7848', '021 794 5188', 'https://www.kleinconstantia.com/', 'info@kleinconstantia.com',
  'Klein Constantia is a wine estate in Constantia known for its Vin de Constance sweet wine, offering tastings daily.',
  NULL, NULL,
  '["https://www.kleinconstantia.com/contact-us/", "https://constantiawineroute.com/klein-constantia/", "https://www.kleinconstantia.com/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'klein-constantia-constantia'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eagles-nest-constantia', 'Eagles'' Nest',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  'Constantia Main Road, Constantia, 7806', '021 794 4095', 'https://www.eaglesnestwines.com/', 'info@eaglesnestwines.com',
  'Eagles'' Nest is a wine estate in Constantia producing award-winning Shiraz and other wines.',
  NULL, NULL,
  '["https://www.eaglesnestwines.com/contact-us/", "https://www.sa-venues.com/things-to-do/westerncape/eagles-nest-wine-estate/", "https://www.eaglesnestwines.com/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eagles-nest-constantia'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'constantia-glen-constantia', 'Constantia Glen',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  'Constantia Main Road, Constantia, 7800', '021 795 6100', 'https://constantiaglen.com/', NULL,
  'Constantia Glen is a family-owned boutique wine estate below Constantia Nek, offering wine tastings and scenic views.',
  NULL, NULL,
  '["https://constantiaglen.com/contact/", "https://constantiawineroute.com/constantia-glen/", "https://constantiaglen.com/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'constantia-glen-constantia'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
