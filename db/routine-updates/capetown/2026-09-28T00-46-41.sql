-- Jobs 1-2: suburb research -- thornton, epping, ndabeni (7 new businesses)

-- Thornton
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'technoline-projects-thornton', 'Technoline Projects',
  (SELECT id FROM suburbs WHERE slug = 'thornton'),
  'Unit 49/50, Viking Business Place, Thor Circle, Thornton, Cape Town', '021 531 8502', 'https://technoline.co.za', NULL,
  'Technoline Projects is an engineering design, project management and contracting company providing services to the cellular and telecommunications industry, based in Thornton.',
  NULL, NULL,
  '["https://technoline.co.za/contact-us/", "https://www.africanadvice.com/1234067/Telecommunications/Cape_Town/Technoline_Projects_(PTY)_Ltd/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'technoline-projects-thornton'),
  (SELECT id FROM categories WHERE slug = 'engineering-surveying'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'a-j-north-thornton', 'A J North (Pty) Ltd',
  (SELECT id FROM suburbs WHERE slug = 'thornton'),
  '38 Thor Circle, Thornton, Cape Town', '021 532 2113', NULL, NULL,
  'A J North is a South African manufacturer of toiletries and toothbrushes, based in Thornton.',
  NULL, NULL,
  '["https://botswana.searchinafrica.com/business/5791738/south-africa/western-cape/cape-town/thornton/thor-cir/toiletries/a-j-north-pty-ltd", "https://www.africanadvice.com/1006113/Toiletries/Cape_Town/A_J_North_(PTY)_Ltd/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'a-j-north-thornton'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

-- Epping
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'classic-wholesalers-epping', 'Classic Wholesalers',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '15-17 Packer Avenue, Epping, Cape Town', '021 505 5623', 'https://www.classicwholesalers.co.za', NULL,
  'Classic Wholesalers is a wholesale supplier based in Epping, Cape Town.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/epping-industria/wholesale/classic-wholesalers", "https://za.africabz.com/western-cape/classic-wholesalers-236743"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'classic-wholesalers-epping'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'golden-arrow-bus-services-epping', 'Golden Arrow Bus Services',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '103 Bofors Circle, Epping, Cape Town, 7490', '021 507 8800', 'https://www.gabs.co.za', NULL,
  'Golden Arrow Bus Services is a public transport bus operator, with its Epping depot also serving as the company''s head office.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/cape-town/epping-industria/bus-services/golden-arrow-bus-services-pty-ltd", "https://www.gabs.co.za/legal/GABS_PAIA_MANUAL.pdf"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'golden-arrow-bus-services-epping'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ctp-cartons-and-labels-epping', 'CTP Cartons & Labels',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  'Cnr Bofors Circle & Dacres Avenue, Epping, Cape Town', '021 507 4300', 'https://ctppackaging.co.za', NULL,
  'CTP Cartons & Labels manufactures cartons and labels for the packaging industry from its plant on Bofors Circle in Epping.',
  NULL, NULL,
  '["https://ctppackaging.co.za/", "https://za.kompass.com/c/ctp-cartons-labels-epping/zan1692979/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ctp-cartons-and-labels-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  '1up-cash-and-carry-epping', '1UP Cash & Carry',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  '127 Bofors Circle, Epping, Cape Town, 7475', '021 534 6227', 'https://www.1uponline.co.za', NULL,
  '1UP Cash & Carry is a wholesale cash-and-carry store based on Bofors Circle in Epping.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/1-up-cash-carry-32410", "https://my-catalogue.co.za/stores/epping/1up-cash-and-carry/127-bofors-circle"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '1up-cash-and-carry-epping'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

-- Ndabeni
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cabstrut-ndabeni', 'Cabstrut',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  'Unit 2A, Ndabeni Business Park, Cnr Inyoni Street & Old Mill Road, Ndabeni, Cape Town', '021 530 3560', 'https://www.cabstrut.co.za', NULL,
  'Cabstrut is a cable management systems manufacturer and supplier, based in Ndabeni.',
  NULL, NULL,
  '["https://www.cabstrut.co.za/contact", "https://www.africanadvice.com/1067089/Cable_Manufacturers_And_Suppliers/Cape_Town/Cabstrut/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cabstrut-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
