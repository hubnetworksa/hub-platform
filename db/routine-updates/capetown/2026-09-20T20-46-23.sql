-- Montague Gardens: 4 new businesses (jobs 1-2), no shopping centre in this suburb
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'decofurn-furniture-montague-gardens', 'Decofurn Furniture Montague Gardens',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  'Montague Business Park, Emerald Road, Montague Gardens, Cape Town, 7441', '021 100 3945', NULL, NULL,
  'Decofurn Furniture Montague Gardens is a furniture warehouse and factory shop at Montague Business Park, in Montague Gardens.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/decofurn-furniture-montague-park-353531", "https://www.tiendeo.co.za/stores/cape-town/decofurn-furniture-montague-business-park-emerald-road/71052"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'decofurn-furniture-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'coricraft-clearance-centre-montague-gardens', 'Coricraft Clearance Centre',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  '2A Montague Drive, Montague Gardens, Cape Town, 7441', '021 551 8940', NULL, NULL,
  'Coricraft Clearance Centre is a furniture clearance and outlet store of the Coricraft chain, in Montague Gardens.',
  NULL, NULL,
  '["https://za.readymap.info/4/27232", "https://za.africabz.com/western-cape/coricraft-cape-town-clearance-centre-26477"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'coricraft-clearance-centre-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'creative-sweets-factory-shop-montague-gardens', 'Creative Sweets Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  '10 Platinum Crescent, Montague Gardens, Cape Town, 7441', '021 555 4114', NULL, NULL,
  'Creative Sweets Factory Shop is a confectionery and sweets factory outlet store, in Montague Gardens.',
  NULL, NULL,
  '["https://www.infobel.com/en/southafrica/creative_sweets_factory_shop_milnerton/joe_slovo_park/ZA101063179-0215554114/businessdetails.aspx", "https://www.brabys.com/za/western-cape/milnerton/montague-gardens/sweet-distributors/creative-sweets-factory-shop"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'creative-sweets-factory-shop-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'buco-montague-gardens', 'BUCO Montague Gardens',
  (SELECT id FROM suburbs WHERE slug = 'montague-gardens'),
  '1 Marconi Rd, Montague Gardens, Cape Town, 7441', '021 045 1930', NULL, NULL,
  'BUCO Montague Gardens is a hardware and building materials store of the BUCO chain, in Montague Gardens.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/buco-montague-gardens-73992", "https://www.cylex.net.za/company/buco-montague-gardens-23739410.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'buco-montague-gardens'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
