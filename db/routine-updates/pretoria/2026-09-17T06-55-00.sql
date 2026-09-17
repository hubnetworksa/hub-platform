INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'heatherview-boulevard-heatherview', 'Heatherview Boulevard',
  (SELECT id FROM suburbs WHERE slug = 'heatherview'),
  'Willem Cruywagen Street, Heatherview X24, Pretoria, 0182', NULL, NULL,
  '["https://www.heatherviewboulevard.co.za", "https://south-africa.worldplaces.me/real-estate-in-pretoria/52788519-heatherview-boulevard.html"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-blaauw-village-heatherview', 'PostNet Blaauw Village',
  (SELECT id FROM suburbs WHERE slug = 'heatherview'),
  (SELECT id FROM shopping_centers WHERE slug = 'blaauw-village-heatherview'),
  'Shop 005 Blaauw Village, 282 Ben Viljoen Street, Pretoria North, 0182', '076 880 9143', 'https://postnet.co.za/stores/blaauwvillage', NULL,
  'PostNet Blaauw Village is a branch of the printing, courier and business-services franchise, located in Blaauw Village shopping centre.',
  NULL, NULL,
  '["https://postnet.co.za/stores/blaauwvillage", "https://www.ivote.co.za/view/south-africa/postnet-blaauw-village-in-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-blaauw-village-heatherview'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);
