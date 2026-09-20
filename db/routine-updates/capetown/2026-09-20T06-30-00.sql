INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bolton-shoes-elsies-river', 'Bolton Shoes',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '12 Malherbe Street, Elsies River, Cape Town', '021 590 7000', 'https://www.boltonshoes.co.za', NULL,
  'Bolton Shoes is a footwear factory outlet in Elsies River selling dress, casual and formal shoes for men and women.',
  NULL, NULL,
  '["https://www.boltonshoes.co.za/contact-us/", "https://www.facebook.com/BoltonFootwearSA"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bolton-shoes-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tile-factory-shop-elsies-river', 'Tile Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  '16 Coleman Street, Elsies River, Cape Town', '021 591 1981', NULL, NULL,
  'Tile Factory Shop is a tile, mosaic and cladding retailer in the Elsies River industrial area, also stocking paint and other building materials.',
  NULL, NULL,
  '["https://www.tiktok.com/@tilefactoryshopelsies/video/7434444968304987447", "https://www.cylex.net.za/company/tile-factory-shop-elsies-river-23826142.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tile-factory-shop-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'avonwood-centre-elsies-river', 'Avonwood Centre',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  'Corner 35th Avenue & Balvenie Avenue, Elsies River, Cape Town', NULL, NULL,
  '["https://atuba.co.za/project/avonwood-retail-centre/", "https://my-catalogue.co.za/stores/cape-town/cash-crusaders/avonwood-centre-corner-35th-ave-balvenie-avenue-off-avonwood-avenue-elsies-river"]',
  'shopping_centre'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-crusaders-avonwood-elsies-river', 'Cash Crusaders Avonwood',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'avonwood-centre-elsies-river'),
  'Shop 2, Avonwood Centre, Corner 35th Ave & Balvenie Avenue, Elsies River, Cape Town', '021 931 1756', NULL, NULL,
  'Cash Crusaders Avonwood is a second-hand goods and pawnbroking store in the Avonwood Centre in Elsies River, buying and selling electronics, tools and other used items.',
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
  'tops-at-spar-avonwood-elsies-river', 'Tops at Spar Avonwood',
  (SELECT id FROM suburbs WHERE slug = 'elsies-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'avonwood-centre-elsies-river'),
  'Shop 10, Avonwood Centre, Corner 35th Ave & Balvenie Avenue, Elsies River, Cape Town', '021 931 6575', NULL, NULL,
  'Tops at Spar Avonwood is a liquor store attached to the Avonwood Centre in Elsies River, part of the national Tops at Spar chain.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/avonwood/tops-at-spar/shop-5-c-o-balvenie-35-str-elsies-river", "https://www.thinklocal.co.za/biz/tops-at-spar-avonwood-south-africa"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tops-at-spar-avonwood-elsies-river'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);
