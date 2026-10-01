INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kwena-transportation-services-serala-view', 'Kwena Transportation Services',
  (SELECT id FROM suburbs WHERE slug = 'serala-view'),
  '10 Komodo Street, Serala View, Polokwane, 0699', '072 313 1056', 'https://www.kwenatravels.co.za', NULL,
  'Kwena Transportation Services is a women-led bus, coach and tour transport company, in Serala View.',
  NULL, NULL,
  '["https://za.near-place.com/kwena-transportation-services-10-komodo-street-serala-view-polokwane", "https://rsa.worldorgs.com/catalog/polokwane/bus-tour-agency/kwena-transportation-services"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kwena-transportation-services-serala-view'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);
