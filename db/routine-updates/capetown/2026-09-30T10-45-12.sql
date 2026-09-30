-- Ndabeni: 2 new businesses
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tsiba-business-school-ndabeni', 'TSIBA Business School',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '51 Old Mill Road, Ndabeni, Cape Town, 7405', '021 532 2750', 'https://www.tsiba.ac.za', NULL,
  'TSIBA Business School is a private business school offering undergraduate and postgraduate business qualifications, in Ndabeni.',
  NULL, NULL,
  '["https://www.tsiba.ac.za/contact-us/", "https://www.waze.com/live-map/directions/za/wc/cape-town/tsiba-business-school"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tsiba-business-school-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'barno-plastics-ndabeni', 'Barno Plastics',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  'Inyoni Street, Ndabeni, Cape Town, 7405', '021 531 7571', 'https://www.barno.co.za', NULL,
  'Barno Plastics manufactures PVC, polypropylene and leather promotional and stationery products, in Ndabeni.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/491416/barno-plastics-pty-ltd", "https://barno.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barno-plastics-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
