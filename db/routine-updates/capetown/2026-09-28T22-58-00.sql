-- Montague Gardens: 6 new businesses

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'montague-gardens-hardware-and-steel-montague-gardens', 'Montague Gardens Hardware and Steel',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  '20 Montague Drive, Montague Gardens, Cape Town, 7441', '021 552 4103', 'https://mghw.co.za/', NULL,
  'Montague Gardens Hardware and Steel is a hardware and building supplies store in Montague Gardens.',
  NULL, NULL,
  '["https://mghw.co.za/contact-us/", "https://www.cylex.net.za/company/montague-gardens-hardware-cc-23748986.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'montague-gardens-hardware-and-steel-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'timbercity-montague-gardens', 'Timbercity Montague Gardens',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  '15 Montague Drive, Montague Gardens, Cape Town, 7441', '021 529 4100', 'https://timbercity.co.za/montague-gardens/', NULL,
  'Timbercity Montague Gardens is a timber and hardware store in Montague Gardens.',
  NULL, NULL,
  '["https://timbercity.co.za/montague-gardens/", "https://www.brabys.com/za/western-cape/milnerton/montague-gardens/board-suppliers/timbercity"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'timbercity-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'logica-beauty-supplies-montague-gardens', 'Logica Beauty Supplies',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  'Unit 8, Montigo Park, 3 Marconi Road, Montague Gardens, Cape Town, 7441', '021 552 6999', 'https://www.logicabeauty.com/', NULL,
  'Logica Beauty Supplies is a wholesale supplier of professional beauty and hair products in Montague Gardens.',
  NULL, NULL,
  '["https://www.logicabeauty.com/pages/contact-us", "https://www.probeautydirectory.co.za/western-cape/montague-gardens/what-you-supply/logica-beauty-supplies"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'logica-beauty-supplies-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-factory-shop-montague-gardens', 'The Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  'Unit 3, 9 Montague Drive, Montague Gardens, Cape Town, 7441', '021 204 0182', NULL, 'info@alliancefoods.co.za',
  'The Factory Shop is a discount variety and clearance store in Montague Gardens.',
  NULL, NULL,
  '["https://www.factoryshopssa.co.za/directory/the-factory-shop/", "https://magicpin.com/south-africa/Montague-Gardens/Montague-Gardens/Other/The-Factory-Shop/store/2901537"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-factory-shop-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mtn-store-montague-gardens', 'MTN Store',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  'Unit 4, 21 Montague Drive, Montague Gardens, Cape Town, 7441', '083 869 1559', NULL, NULL,
  'MTN Store is a mobile phone and MTN network store in Montague Gardens.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/Mobile_Phone_Shop/MTN_Store_Walkin_Centre_Cape_Town/6669496", "https://nearbyza.com/place/mtn-store-walkin-centre-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mtn-store-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-town-appliances-montague-gardens', 'Cape Town Appliances',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  'Unit 1, 29 Montague Drive, Montague Gardens, Cape Town, 7441', '021 552 6648', 'https://capetownappliances.co.za', 'sales@capetownappliances.co.za',
  'Cape Town Appliances is a home appliance retailer in Montague Gardens.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/cape-town-appliances-81842", "https://leaderr.co/directory/cape-town-appliances-7449/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-town-appliances-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'electronics-appliances'),
  1
);
