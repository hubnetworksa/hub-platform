-- Suburb research: southfield

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'svg-autoworks-southfield', 'SVG Autoworks',
  (SELECT id FROM suburbs WHERE slug = 'southfield'),
  '64 Victoria Road, Southfield, Cape Town, 7800', '021 705 4665', 'https://svgautoworks.co.za', NULL,
  'SVG Autoworks is an independent BMW and MINI specialist workshop in Southfield.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/svg-autoworks-107939", "https://za.polomap.com/cape-town/29635"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'svg-autoworks-southfield'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);
