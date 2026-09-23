INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ulma-packaging-systems-killarney-gardens', 'ULMA Packaging Systems',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  '29D Mansell Road, Killarney Gardens, Cape Town, 7441', '021 556 2907', NULL, NULL,
  'ULMA Packaging Systems is a supplier and manufacturer of industrial packaging machinery and systems, based in Killarney Gardens.',
  NULL, NULL,
  '["https://www.ulmapackaging.com/en/contact/africa-middle-east/south-africa/ulma-packaging-systems-sa-pty-ltd-cape-town", "https://www.ivote.co.za/view/south-africa/ulma-packaging-systems-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ulma-packaging-systems-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'killarney-gardens-hardware-killarney-gardens', 'Killarney Gardens Hardware',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  '2 Killarney Ave, Killarney Gardens, Milnerton, Cape Town, 7441', '021 556 1080', NULL, NULL,
  'Killarney Gardens Hardware is a hardware store serving the Killarney Gardens industrial area.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/milnerton/killarney-gardens/hardware-merchants/killarney-gardens-hardware", "https://south-africa.searchinafrica.com/business/4816116/south-africa/western-cape/milnerton/killarney-gardens/killarney-ave/hardware-merchants/killarney-gardens-hardware"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'killarney-gardens-hardware-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bevlon-contractors-killarney-gardens', 'Bevlon Contractors',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  '61 Lauda Road, Killarney Gardens, Cape Town, 7441', '021 557 6720', NULL, 'bevlon@vodamail.co.za',
  'Bevlon Contractors specialises in petroleum installations, maintenance and diesel tank installations, based in Killarney Gardens.',
  NULL, NULL,
  '["https://bevlon.com/contact/", "http://inkillarneygardens.co.za/listing/bevlon-contractors/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bevlon-contractors-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'scientific-manufacturing-killarney-gardens', 'Scientific Manufacturing',
  (SELECT id FROM suburbs WHERE slug = 'killarney-gardens'),
  '3 Le Mans Avenue, Killarney Gardens, Cape Town, 7441', '021 557 5151', NULL, NULL,
  'Scientific Manufacturing is a family-run manufacturer of laboratory test equipment and light-duty stainless steel engineering, based in Killarney Gardens.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/milnerton/killarney-gardens/laboratory-scientific-equipment-supplies/scientific-manufacturing-cc", "https://www.xpose.co.za/listings/scientific-manufacturing-killarney-gardens/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'scientific-manufacturing-killarney-gardens'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
