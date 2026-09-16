-- Faerie Glen: new shopping centre (Atterbury Boulevard) + its verified tenant Cartridge Depot
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'atterbury-boulevard-shopping-centre-faerie-glen', 'Atterbury Boulevard Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'faerie-glen'),
  '385 Atterbury Road, Cnr Atterbury Road & Manitoba Drive, Faerie Glen, Pretoria, 0081', NULL, NULL,
  '["https://www.yep.co.za/biz/store/atterbury-boulevard-shopping-centre/462158", "https://za.2pos.info/4/2896", "http://atterburyboulevard.co.za/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cartridge-depot-faerie-glen', 'Cartridge Depot',
  (SELECT id FROM suburbs WHERE slug = 'faerie-glen'),
  (SELECT id FROM shopping_centers WHERE slug = 'atterbury-boulevard-shopping-centre-faerie-glen'),
  'Shop GL 9, Cnr Atterbury Road & Manitoba Drive, Atterbury Boulevard, Faerie Glen, Pretoria, 0081', '012 348 1079', 'https://www.cartridgedepot.co.za/atterbury', 'faerieglen@cartridgedepot.co.za',
  'Cartridge Depot Faerie Glen is a printer cartridge and ink retailer trading from Atterbury Boulevard Shopping Centre.',
  NULL, NULL,
  '["https://www.cartridgedepot.co.za/stores/faerie-glen-atterbury-boulevard", "https://www.facebook.com/CartridgeDepotSA/posts/visit-us-in-store-at-atterbury-boulevard-faerie-glenshop-gl-9-co-atterbury-rd-an/1119893271434308/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cartridge-depot-faerie-glen'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);
