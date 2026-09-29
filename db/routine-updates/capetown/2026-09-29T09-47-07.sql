INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tonic-design-gardens', 'Tonic Design',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '87 Kloof Street, Gardens, 8001', '021 300 5031', 'https://tonicdesign.co.za/', 'info@tonicdesign.co.za',
  'Tonic Design is a furniture and homeware showroom on Kloof Street in Gardens, part of the street''s cluster of design and furniture stores.',
  NULL, NULL,
  '["https://tonicdesign.co.za/pages/contact", "https://www.sadecor.co.za/supplier/tonic-design/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tonic-design-gardens'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'workshop17-kloof-street-gardens', 'Workshop17 Kloof Street',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '32 Kloof Street, Gardens, 8000', '021 300 5884', 'https://www.workshop17.co.za/cpt-gardens-kloof', 'kloofstreet@workshop17.co.za',
  'Workshop17 Kloof Street is a coworking and serviced office space on Kloof Street in Gardens, part of the Workshop17 network of workspaces.',
  NULL, NULL,
  '["https://www.workshop17.co.za/cpt-gardens-kloof", "https://www.coworker.com/south-africa/cape-town/workshop17-kloof-street"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'workshop17-kloof-street-gardens'),
  (SELECT id FROM categories WHERE slug = 'commercial-property-office-space'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'block-and-chisel-gardens', 'Block & Chisel',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '122 Kloof Street, Gardens, 8001', '021 422 0088', 'https://www.blockandchisel.co.za/stores/p/city/Cape%20Town/store/Kloof%20Street', NULL,
  'Block & Chisel is a homeware and furniture store on Kloof Street in Gardens, part of a national furniture retail chain.',
  NULL, NULL,
  '["https://www.blockandchisel.co.za/stores/p/city/Cape%20Town/store/Kloof%20Street", "https://cfma.co.za/directory/block-and-chisel"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'block-and-chisel-gardens'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);
