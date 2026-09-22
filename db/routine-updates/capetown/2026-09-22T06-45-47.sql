-- Suburb sweep: Southfield

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bpm-toolcraft-southfield', 'BPM Toolcraft',
  (SELECT id FROM suburbs WHERE slug = 'southfield'),
  '95 Victoria Road, Southfield, Cape Town, 7800', '021 705 1247', NULL, NULL,
  'BPM Toolcraft is a hardware shop in Southfield specialising in hand, power and lawn-care tools.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/bpm-toolcraft-23706862.html", "https://www.africabizinfo.com/ZA/bpm-toolcraft-021-705-1247"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bpm-toolcraft-southfield'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
