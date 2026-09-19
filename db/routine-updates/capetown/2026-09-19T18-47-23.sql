INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'safety-protective-clothing-epping', 'Safety Protective Clothing',
  (SELECT id FROM suburbs WHERE slug = 'epping'),
  'Unit 9, Magnum Park, 108 Bofors Circle, Epping Industria, Cape Town', '021 535 5522', 'https://safepro.co.za', NULL,
  'Safety Protective Clothing (Safepro) is a distributor of protective workwear and safety equipment, including footwear, gloves, coveralls and hard hats, based in Epping Industria.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1448401229697024/safety-protective-clothing-pty-ltd/cape-town/security-safety-products", "https://za.africabz.com/western-cape/safepro-safety-protective-clothing-295222"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'safety-protective-clothing-epping'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-biologix-ndabeni', 'Cape Biologix',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  'Unit 3, The Powder Mill, 5 Sunrise Circle, Ndabeni, Cape Town, 7405', '021 286 2835', 'https://capebiologix.com', 'sales@capebiologix.com',
  'Cape Biologix is a biotechnology company based in Ndabeni that develops and supplies antibodies and other biologic research reagents.',
  NULL, NULL,
  '["https://capebiologix.com/contact/", "https://www.facebook.com/CapeBiologixTechnologies/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-biologix-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ellies-electronics-cape-ndabeni', 'Ellies Electronics Cape',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '47 Morningside Road, Ndabeni, Cape Town, 7405', '021 532 2225', 'https://www.ellies.co.za', NULL,
  'Ellies Electronics Cape is the Cape Town branch of Ellies, a South African manufacturer, importer, wholesaler and distributor of lighting, electrical and electronic products, based in Ndabeni.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/ellies-electronics-17503526.html", "https://www.yellosa.co.za/company/175825/ellies-electronics-cape"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ellies-electronics-cape-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'nampak-flexible-packaging-ndabeni', 'Nampak Flexible Packaging',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '4 Bayete Street, Ndabeni, Cape Town, 7405', '021 507 5300', NULL, NULL,
  'Nampak Flexible Packaging is a plastic packaging manufacturing facility in Ndabeni, part of the Nampak packaging group.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/nampak-flexible-packaging-cape", "https://www.vconnect.com/zar/nampak-flexible-cape-cape_town_b1615742"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'nampak-flexible-packaging-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);
