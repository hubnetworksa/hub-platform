INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'engen-bonteheuwel-tyre-service-centre-bonteheuwel', 'Engen Bonteheuwel Tyre & Service Centre',
  (SELECT id FROM suburbs WHERE slug = 'bonteheuwel'),
  'Cnr Jakkalsvlei Avenue & Kiaat Road, Bonteheuwel, Cape Town, 7764', '021 694 5006', NULL, NULL,
  'Engen Bonteheuwel Tyre & Service Centre is a 24-hour fuel and tyre service station in Bonteheuwel.',
  NULL, NULL,
  '["https://za.polomap.com/cape-town/36475", "https://nearbyza.com/place/engen-bonteheuwel-tyre-service-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'engen-bonteheuwel-tyre-service-centre-bonteheuwel'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);
