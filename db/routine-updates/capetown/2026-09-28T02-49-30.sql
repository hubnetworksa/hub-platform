INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'eerste-rivier-shopping-centre-eerste-river', 'Eerste Rivier Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  'Corner Plein & Arlene Streets, Eerste Rivier, Cape Town, 7100', NULL, NULL,
  '["https://eersteriviercentre.co.za/", "https://www.footgear.co.za/stores/footgear-eerste-river/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'footgear-eerste-river', 'Footgear',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'eerste-rivier-shopping-centre-eerste-river'),
  'Shop 9, Eerste Rivier Shopping Centre, Corner Plein & Arlene Streets, Eerste Rivier, Cape Town, 7100', '087 759 6793', NULL, NULL,
  'Footgear is a branch of the national footwear retail chain in Eerste Rivier Shopping Centre, selling sneakers and shoes from brands including Adidas, Puma, Reebok, Converse and Levi''s.',
  NULL, NULL,
  '["https://eersteriviercentre.co.za/shop/", "https://www.footgear.co.za/stores/footgear-eerste-river/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'footgear-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pnp-clothing-eerste-river', 'PnP Clothing',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'eerste-rivier-shopping-centre-eerste-river'),
  'Eerste Rivier Shopping Centre, Corner Plein & Arlene Streets, Eerste Rivier, Cape Town, 7100', '087 750 7805', NULL, NULL,
  'PnP Clothing is a branch of the Pick n Pay clothing chain in Eerste Rivier Shopping Centre, selling clothing, footwear and accessories for the whole family.',
  NULL, NULL,
  '["https://eersteriviercentre.co.za/shop/pnp-clothing/", "https://yandex.com/maps/org/pnp_clothing_store_eersterivier/117759867005/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pnp-clothing-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pnp-liquor-eerste-river', 'PnP Liquor',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'eerste-rivier-shopping-centre-eerste-river'),
  'Eerste Rivier Shopping Centre, Corner Plein & Arlene Streets, Eerste Rivier, Cape Town, 7100', '087 750 7806', NULL, NULL,
  'PnP Liquor is a branch of the Pick n Pay liquor chain in Eerste Rivier Shopping Centre, selling wine, beer and spirits.',
  NULL, NULL,
  '["https://eersteriviercentre.co.za/shop/pnp-liquor/", "https://www.yellosa.co.za/company/907518/pick-n-pay-liquoreerste-river"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pnp-liquor-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pnp-supermarket-eerste-river', 'PnP Supermarket',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'eerste-rivier-shopping-centre-eerste-river'),
  'Eerste Rivier Shopping Centre, Corner Plein & Arlene Streets, Eerste Rivier, Cape Town, 7100', '087 750 7811', NULL, NULL,
  'PnP Supermarket is the anchor Pick n Pay grocery store of Eerste Rivier Shopping Centre, developed and owned by Pick n Pay Retailers.',
  NULL, NULL,
  '["https://eersteriviercentre.co.za/shop/pnp-supermarket/", "https://my-catalogue.co.za/stores/cape-town/pick-n-pay-qualisave/plein-st-eerste-rivier"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pnp-supermarket-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
