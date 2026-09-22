INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nestle-purina-petcare-ndabeni', 'Nestle Purina Petcare',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '10 Bayete Road, Ndabeni, Cape Town, 7405', '021 530 7500', NULL, NULL,
  'Nestle Purina Petcare is a pet food manufacturing and distribution facility in Ndabeni.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/nestle-purina-pet-care/603291", "https://sabusinesslistings.co.za/listings/nestle-purina-petcare-pty-ltd-t-a-pet-products/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nestle-purina-petcare-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hybrid-composite-ndabeni', 'Hybrid Composite',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  'Unit 7, 7 Inyoni Street, Ndabeni, Cape Town, 7405', '021 510 8080', NULL, NULL,
  'Hybrid Composite is a Cape Town-based manufacturer of semi-custom composite parts for the marine industry, based in Ndabeni.',
  NULL, NULL,
  '["https://hybridcomposite.co.za/contacts/", "https://www.cylex.net.za/company/hybrid-composite-pty-ltd-23750199.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hybrid-composite-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'merrypak-and-print-ndabeni', 'Merrypak & Print',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '45 Morningside Road, Ndabeni, Cape Town, 7405', '021 531 2244', NULL, NULL,
  'Merrypak & Print is a packaging manufacturer in Ndabeni making paper carrier bags and boxes, with an on-site showroom selling packaging, party and art supplies.',
  NULL, NULL,
  '["https://www.merrypak.co.za/about-us/visit-our-showroom/", "https://www.cybo.com/ZA-biz/merrypak-print"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'merrypak-and-print-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
