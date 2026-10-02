INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'millside-mica-ndabeni', 'Millside Mica',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  'Unit B2, Millside Park, 1 Old Mill Road, Ndabeni, Cape Town, 7405', '021 493 7400', NULL, NULL,
  'Millside Mica is a Mica paint and hardware store offering paint tinting and mixing, power tools, pre-cut timber and building materials, garden supplies and key cutting, in Ndabeni.',
  NULL, NULL,
  '["https://www.mica.co.za/store-location/western-cape/millside-mica/", "https://www.pinelandsportal.co.za/listings/millside-mica"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'millside-mica-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
