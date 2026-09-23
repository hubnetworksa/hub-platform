INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'avonwood-square-elsies-river', 'Avonwood Square',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  'Cnr 35th Avenue & Balvenie Avenue (off Avonwood Avenue), Elsies River, Cape Town', NULL, NULL,
  '["https://mspd.co.za/project/avonwood-square/", "https://atuba.co.za/project/avonwood-retail-centre/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-crusaders-avonwood-elsies-river', 'Cash Crusaders Avonwood', (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'avonwood-square-elsies-river'),
  'Shop 2, Avonwood Square, Cnr 35th Avenue & Balvenie Avenue, Elsies River, Cape Town', '021 931 1756', NULL, NULL,
  'Cash Crusaders Avonwood is a branch of the secondhand goods, buy-and-sell and pawnbroking retail chain, in Avonwood Square, Elsies River.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/cash-crusaders/avonwood-centre-corner-35th-ave-balvenie-avenue-off-avonwood-avenue-elsies-river", "https://www.cylex.net.za/company/cash-crusaders-elsies-river-23688318.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-crusaders-avonwood-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-avonwood-elsies-river', 'SPAR Avonwood', (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'avonwood-square-elsies-river'),
  'Avonwood Square, Cnr 35th Avenue & Balvenie Avenue, Elsies River, Cape Town', '021 931 8267', 'http://www.spar.co.za', NULL,
  'SPAR Avonwood is the anchor supermarket of Avonwood Square in Elsies River, part of the SPAR grocery retail chain.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/907251/spar-avonwood", "https://www.netpages.co.za/Elsies+River/Spar+Avonwood+-447718.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-avonwood-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'romatex-factory-shop-elsies-river', 'Romatex Factory Shop', (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '183 Epping Avenue, Elsies River, Cape Town, 7460', '021 933 9822', 'http://www.romatex.co.za', NULL,
  'Romatex Factory Shop is a home textiles factory outlet in Elsies River, selling duvets, pillows, sheeting, duvet covers and blankets.',
  NULL, NULL,
  '["https://www.romatex.co.za/our-shops/factory-shop/", "https://www.thinklocal.co.za/biz/romatex-factory-shop-elsies-river"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'romatex-factory-shop-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tile-factory-shop-elsies-river', 'Tile Factory Shop', (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '16 Coleman Street, Elsies River Industrial, Cape Town', '021 591 1981', NULL, NULL,
  'Tile Factory Shop is a factory outlet in Elsies River Industrial selling tiles, cladding, mosaics, paving and tiling accessories.',
  NULL, NULL,
  '["https://www.facebook.com/tilefactoryshop/", "https://www.cylex.net.za/company/tile-factory-shop-elsies-river-23826142.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tile-factory-shop-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bolton-shoes-elsies-river', 'Bolton Shoes', (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '12 Malherbe Street, Elsies River, Cape Town, 7460', '021 590 7000', 'https://www.boltonshoes.co.za', 'query@boltonshoes.co.za',
  'Bolton Shoes is a footwear factory shop in Elsies River, selling dress, casual and formal shoes for men and women.',
  NULL, NULL,
  '["https://www.boltonshoes.co.za/shop/", "https://za.kompass.com/c/bolton-footwear-pty-ltd/zan021720/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bolton-shoes-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);
