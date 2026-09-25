-- Jobs 1-2: eerste-river suburb research (ruyterwacht and wallacedene produced nothing verifiable this run)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'russells-grand-central-shopping-centre-eerste-river', 'Russells',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'grand-central-shopping-centre-eerste-river'),
  'Shop 7 & 8, Grand Central Shopping Centre, Eerste River, Cape Town, 7100', '021 902 0318', NULL, NULL,
  'Russells is a furniture and homeware retailer inside Grand Central Shopping Centre, Eerste River.',
  NULL, NULL,
  '["https://www.russells.co.za/storelocator/store/index/id/692", "https://www.tiendeo.co.za/stores/eerste-river/russells-joshua-doore-shop-grand-central-shopping-centreeerste-river/13881"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'russells-grand-central-shopping-centre-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-grand-central-shopping-centre-eerste-river', 'Shoprite',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'grand-central-shopping-centre-eerste-river'),
  'Grand Central Shopping Centre, Corner Main & Plein Street, Eerste River, Cape Town, 7100', '021 902 8160', NULL, NULL,
  'Shoprite is a supermarket inside Grand Central Shopping Centre, Eerste River.',
  NULL, NULL,
  '["https://tiendeo.co.za/stores/cape-town/shoprite-grand-central-shopping-centre-co-main-plain-str/6767", "https://mydorpie.com/m/?page=chain_shoprite_grand_central_shopping_centre_eersterivier", "https://za.africabz.com/western-cape/shoprite-eerste-river-102614"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-grand-central-shopping-centre-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-eerste-rivier-mall-eerste-river', 'KFC Eerste Rivier',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'eerste-rivier-mall-eerste-river'),
  'Plein Street, Eerste Rivier Mall, Eerste River, Cape Town, 7100', '021 904 0670', NULL, NULL,
  'KFC Eerste Rivier is a fast-food restaurant inside Eerste Rivier Mall, Eerste River.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/eersterivier/plein-st-eerste-river-cape-town-7100", "https://www.tripadvisor.com/Restaurant_Review-g312659-d25254395-Reviews-KFC_Eerste_Rivier-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-eerste-rivier-mall-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
