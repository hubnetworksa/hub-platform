INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'noordhoek-village-tack-shop-noordhoek', 'Noordhoek Village Tack Shop',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Noordhoek Farm Village, Cnr Noordhoek Main Road & Village Lane, Noordhoek, Cape Town, 7979', '021 789 1398', NULL, NULL,
  'Noordhoek Village Tack Shop is an equestrian supplies and leather goods retailer in Noordhoek Farm Village, Noordhoek.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/noordhoek-tack-shop", "https://www.africanadvice.com/1394933/Leather_Goods_-_Retail/Cape_Town/Noordhoek_Village_Tack_Shop/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'noordhoek-village-tack-shop-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'positano-noordhoek', 'Positano',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Noordhoek Farm Village, Cnr Noordhoek Main Road & Village Lane, Noordhoek, Cape Town, 7979', '082 481 7588', NULL, NULL,
  'Positano is a South African boutique selling women''s clothing and swimwear from its flagship store in Noordhoek Farm Village, Noordhoek.',
  NULL, NULL,
  '["https://positano.co.za/pages/contact", "https://thefarmvillage.co.za/positano/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'positano-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'all-things-earthly-noordhoek', 'All Things Earthly',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  '1 Village Lane, Noordhoek Farm Village, Noordhoek, Cape Town, 7979', '066 130 5380', NULL, NULL,
  'All Things Earthly is a health food and grocery store in Noordhoek Farm Village selling organic, chemical-free and locally grown produce, in Noordhoek.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/all-things-earthly-310081", "https://thefarmvillage.co.za/all-things-earthly/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'all-things-earthly-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fat-cats-and-dogs-noordhoek', 'Fat Cats and Dogs',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Shop 1, The Post House, Noordhoek Farm Village, Chapman''s Peak Drive, Noordhoek, Cape Town, 7979', '074 910 9677', NULL, NULL,
  'Fat Cats and Dogs is a pet-care store in Noordhoek Farm Village selling veterinary-approved food, treats and accessories, in Noordhoek.',
  NULL, NULL,
  '["https://www.rawlovepets.co.za/pages/fat-cats-and-dogs-noordhoek", "https://thefarmvillage.co.za/fat-cats-and-dogs/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fat-cats-and-dogs-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kristens-kick-ass-ice-cream-noordhoek', 'Kristen''s Kick Ass Ice Cream',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'noordhoek-farm-village-noordhoek'),
  'Noordhoek Farm Village, Cnr Noordhoek Main Road & Village Lane, Noordhoek, Cape Town, 7979', '021 204 3134', NULL, NULL,
  'Kristen''s Kick Ass Ice Cream is an artisanal ice-cream shop in Noordhoek Farm Village, Noordhoek.',
  NULL, NULL,
  '["https://thefarmvillage.co.za/kristens-kick-ass-ice-cream/", "https://www.eatout.co.za/venue/kristens-kick-ass-ice-cream/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kristens-kick-ass-ice-cream-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'miladys-noordhoek', 'Miladys',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Longbeach Mall, Buller Louw Boulevard, Noordhoek, Cape Town, 7975', '021 785 6774', NULL, NULL,
  'Miladys is a women''s fashion retail chain store in Longbeach Mall, Noordhoek.',
  NULL, NULL,
  '["https://www.africanadvice.com/1313063/Ladies_Fashion/Cape_Town/Miladys/", "https://za.polomap.com/cape-town/77890"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'miladys-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'absolute-pets-noordhoek', 'Absolute Pets',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Shop 2, Longbeach Mall, Buller Louw Boulevard, Noordhoek, Cape Town, 7975', '021 785 5955', NULL, NULL,
  'Absolute Pets is a pet food and supplies retail chain store in Longbeach Mall, Noordhoek.',
  NULL, NULL,
  '["https://packleader.co.za/store/absolute-pets-long-beach-mall/", "https://longbeachmall.co.za/stores/absolute-pets/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'absolute-pets-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'absa-noordhoek', 'Absa',
  (SELECT id FROM suburbs WHERE slug = 'noordhoek'),
  (SELECT id FROM shopping_centers WHERE slug = 'longbeach-mall-noordhoek'),
  'Shop 39, Longbeach Mall, Cnr Buller Louw Boulevard & Sunnydale Road, Noordhoek, Cape Town, 7975', '021 784 2300', NULL, NULL,
  'Absa is a bank branch in Longbeach Mall, Noordhoek.',
  NULL, NULL,
  '["https://bankcodesfinder.com/south-africa-bank-branch-codes/absa/longbeach_mall", "https://www.callupcontact.com/b/Banks/ABSA_LONGBEACH_MALL/46984"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'absa-noordhoek'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);
