INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dew-spa-kensington', 'Dew Spa',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  '547 Voortrekker Road, corner 9th Avenue, Kensington, Cape Town, 7405', '072 425 4716', NULL, NULL,
  'Dew Spa is a day spa in Kensington offering massages, facials and other beauty treatments.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/dew-spa-voortrekker-road-cape-town-D7LXER", "https://dewspa.co.za/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dew-spa-kensington'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'columbit-kensington', 'Columbit',
  (SELECT id FROM suburbs WHERE slug = 'kensington'),
  '70 7th Avenue, Kensington, Cape Town, 7405', '021 593 3161', NULL, NULL,
  'Columbit supplies and installs commercial meat and food processing equipment, including meat forming, skinning and slicing machinery, to processing plants across South Africa.',
  NULL, NULL,
  '["https://columbit.com/contact-us/", "https://www.yellosa.co.za/company/181272/columbit-pty-ltd"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'columbit-kensington'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
