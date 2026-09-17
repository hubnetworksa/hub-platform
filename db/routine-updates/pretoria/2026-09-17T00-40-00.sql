-- Hammanskraal: new shopping centre (Renbro) + tenants + standalone business

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'renbro-shopping-centre-hammanskraal', 'Renbro Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'hammanskraal'),
  '30 Old Warmbaths Rd, Hammanskraal, 0400', NULL, NULL,
  '["https://nearbyza.com/place/renbro-center", "https://za.africabz.com/gauteng/hammanskraal-renbro-shopping-centre-371555"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'superspar-renbro-hammanskraal', 'SuperSpar Renbro',
  (SELECT id FROM suburbs WHERE slug = 'hammanskraal'),
  (SELECT id FROM shopping_centers WHERE slug = 'renbro-shopping-centre-hammanskraal'),
  'Shop 12, Renbro Shopping Centre, Old Warmbaths Road, Hammanskraal, 0407', '012 711 0240', NULL, NULL,
  'SuperSpar Renbro is a full-service supermarket in Renbro Shopping Centre, Hammanskraal.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/Supermarkets/Spar_Renbro/40579", "https://www.brabys.com/za/gauteng/hammanskraal/supermarkets/renbro-superspar"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'superspar-renbro-hammanskraal'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-hammanskraal-hammanskraal', 'PostNet Hammanskraal',
  (SELECT id FROM suburbs WHERE slug = 'hammanskraal'),
  (SELECT id FROM shopping_centers WHERE slug = 'renbro-shopping-centre-hammanskraal'),
  'Shop A26C, Renbro Shopping Centre, 30 Old Warmbaths Rd, Hammanskraal, 0407', '010 054 6215', NULL, NULL,
  'PostNet Hammanskraal is a printing, copying and courier-services franchise branch in Renbro Shopping Centre, Hammanskraal.',
  NULL, NULL,
  '["https://southafricafirm.com/gauteng/postnet-hammanskraal-76336", "https://www.postnet.co.za/stores/hammanskraal"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-hammanskraal-hammanskraal'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-hammanskraal', 'PEP',
  (SELECT id FROM suburbs WHERE slug = 'hammanskraal'),
  (SELECT id FROM shopping_centers WHERE slug = 'renbro-shopping-centre-hammanskraal'),
  'Shop A21-A22, Renbro Shopping Centre, Great North Road, Hammanskraal', '012 711 0456', NULL, NULL,
  'PEP is a discount clothing and general-merchandise retailer in Renbro Shopping Centre, Hammanskraal.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/hammanskraal/pep-stores/renbro-spar-great-north-road", "https://www.tiendeo.co.za/stores/hammanskraal/pep-stores-shop-a--a-renbro-spar-great-north-road-hammanskraal-gauteng/12091"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-hammanskraal'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-cell-hammanskraal', 'PEP Cell',
  (SELECT id FROM suburbs WHERE slug = 'hammanskraal'),
  (SELECT id FROM shopping_centers WHERE slug = 'renbro-shopping-centre-hammanskraal'),
  'Renbro Shopping Centre, Great North Road, Hammanskraal', '012 711 3367', NULL, NULL,
  'PEP Cell is a mobile phones and airtime/accessories retailer in Renbro Shopping Centre, Hammanskraal.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/hammanskraal/pep-cell/renbro-shopping-centre-great-north-road", "https://pretoria.co.za/listing/pep-cell-hammanskraal-renbro/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-cell-hammanskraal'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'aron-s-motors-hammanskraal', "Aron's Motors",
  (SELECT id FROM suburbs WHERE slug = 'hammanskraal'),
  '4490 Old Warmbaths Road, Kudube X4, Hammanskraal', '012 711 1180', NULL, NULL,
  "Aron's Motors is a fuel and service station on Old Warmbaths Road, Hammanskraal.",
  NULL, NULL,
  '["https://nearfinderza.com/en/business/gp/hammanskraal/garages/aron-s-motors-cc_243438+3.html", "https://www.thinklocal.co.za/biz/arons-motors-hammanskraal"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'aron-s-motors-hammanskraal'),
  (SELECT id FROM categories WHERE slug = 'fuel-stations'),
  1
);
