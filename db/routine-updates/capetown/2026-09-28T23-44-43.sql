-- Jobs 1-2: Hout Bay -- 3 new businesses (1 a Mainstream Mall tenant), no new shopping centres

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hout-bay-handiman-centre-hout-bay', 'Hout Bay Handiman Centre',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  '44 Victoria Avenue, Hout Bay, Cape Town, 7806', '021 790 0000', NULL, NULL,
  'Hout Bay Handiman Centre is a hardware store in Hout Bay.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/hout-bay-handiman-centre-50868", "https://www.brabys.com/za/western-cape/cape-town/hout-bay/hardware-retailers/hout-bay-handiman-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hout-bay-handiman-centre-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-town-surfing-hout-bay', 'Cape Town Surfing',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  '11 Victoria Avenue, Hout Bay, Cape Town, 7806', '063 686 7524', 'https://capetownsurfing.com/', NULL,
  'Cape Town Surfing is a surf school and surf shop in Hout Bay.',
  NULL, NULL,
  '["https://capetownsurfing.com/pages/contact-us", "https://discoverhoutbay.co.za/listing/cape-town-surfing/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-town-surfing-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'brand-collective-hout-bay', 'Brand Collective',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'mainstream-mall-hout-bay'),
  'Unit B3, Mainstream Mall, Cnr Main Road & Princess Street, Hout Bay, Cape Town, 7806', '021 791 1427', NULL, NULL,
  'Brand Collective is a fashion and outdoor-brand clothing and footwear store in Mainstream Mall, Hout Bay.',
  NULL, NULL,
  '["https://www.mainstreammall.co.za/brand-collective/", "https://www.facebook.com/brandcollective.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'brand-collective-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
