INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eerste-river-paint-hardware-eerste-river', 'Eerste River Paint & Hardware',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  '262 Bobs Way, Eerste Rivier, Cape Town', '021 902 5009', NULL, NULL,
  'Eerste River Paint & Hardware is a hardware and paint store on Bobs Way, Eerste River.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/838131/eerste-river-painthardware", "https://www.brabys.com/za/western-cape/cape-town/eerste-rivier/hardware-retailers/eerste-river-paint-hardware"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eerste-river-paint-hardware-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ok-furniture-eerste-river', 'OK Furniture',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'eerste-rivier-mall-eerste-river'),
  'Eerste Rivier Mall, Cnr Plein & Van Riebeek Street, Eerste River, Cape Town', '021 902 8700', NULL, NULL,
  'OK Furniture is a furniture and homeware retailer in Eerste Rivier Mall, Eerste River.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/eerste-river/ok-furniture-eerste-rivier-mall-cnr-plein-van-riebeek-str/41249", "https://www.okfurniture.co.za/eerste-rivier"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ok-furniture-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mtn-store-eerste-river', 'MTN Store',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'grand-central-shopping-centre-eerste-river'),
  'Shop 5, Grand Central Shopping Centre, Plein Street, Eerste River, Cape Town, 7100', '083 869 1457', NULL, NULL,
  'MTN Store is a mobile phone and network retailer in Grand Central Shopping Centre, Eerste River.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/Mobile_Phone_Shop/MTN_Store_Grand_Central/6669505", "https://nearbyza.com/place/mtn-store-grand-central"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mtn-store-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);
