INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lepelle-nkumpi-local-municipality-lebowakgomo', 'Lepelle-Nkumpi Local Municipality',
  (SELECT id FROM suburbs WHERE slug = 'lebowakgomo'),
  '170 BA Civic Centre, Lebowakgomo, 0737', '015 633 4500', 'https://www.lepelle-nkumpi.gov.za/', NULL,
  'Lepelle-Nkumpi Local Municipality is the local government office for the Lepelle-Nkumpi municipal area, based at the Civic Centre in Lebowakgomo.',
  NULL, NULL,
  '["https://municipalities.co.za/contacts/1119/lepelle-nkumpi-local-municipality", "https://www.lepelle-nkumpi.gov.za/?q=address"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lepelle-nkumpi-local-municipality-lebowakgomo'),
  (SELECT id FROM categories WHERE slug = 'government-municipal-services'),
  1
);
