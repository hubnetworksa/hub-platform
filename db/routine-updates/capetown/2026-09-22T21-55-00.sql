-- Athlone: Vangate Mall tenant discovery (job 2, existing centre) + general suburb research (job 1)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sleepmasters-vangate-mall-athlone', 'Sleepmasters Vangate Mall',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  (SELECT id FROM shopping_centers WHERE slug = 'vangate-mall-athlone'),
  'Shop 28, Vangate Mall, Jakes Gerwel Drive, Athlone, Cape Town, 7764', '021 133 0131', NULL, NULL,
  'Sleepmasters Vangate Mall is a branch of the national bedding and furniture retailer, in Vangate Mall, Athlone.',
  NULL, NULL,
  '["https://www.sleepmasters.co.za/storelocator/store/index/id/1460", "https://www.tiendeo.co.za/stores/cape-town/sleepmasters-shop-vangate-mall-jakes-gerwel-drive-athlone/78048"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sleepmasters-vangate-mall-athlone'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'totalsports-vangate-mall-athlone', 'Totalsports Vangate Mall',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  (SELECT id FROM shopping_centers WHERE slug = 'vangate-mall-athlone'),
  'Shop 23, Vangate Mall, Jakes Gerwel Drive, Athlone, Cape Town, 7764', '021 638 1504', NULL, NULL,
  'Totalsports Vangate Mall is a branch of the national sportswear and sneaker retailer, in Vangate Mall, Athlone.',
  NULL, NULL,
  '["https://www.cybo.com/ZA-biz/totalsports-vangate-mall", "https://za.polomap.com/cape-town/79395"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'totalsports-vangate-mall-athlone'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-vangate-mall-athlone', 'Mr Price Vangate Mall',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  (SELECT id FROM shopping_centers WHERE slug = 'vangate-mall-athlone'),
  'Shop 46, Vangate Mall, Vanguard Drive, Athlone, Cape Town, 7764', '021 633 8209', NULL, NULL,
  'Mr Price Vangate Mall is a branch of the national value fashion and homeware retailer, in Vangate Mall, Athlone.',
  NULL, NULL,
  '["https://www.mrp.com/en_za/store/mr-price-vangate-mall", "https://www.guzzle.co.za/mr-price/athlone/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-price-vangate-mall-athlone'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'markham-vangate-mall-athlone', 'Markham Vangate Mall',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  (SELECT id FROM shopping_centers WHERE slug = 'vangate-mall-athlone'),
  'Shop 87, Vangate Mall, Vanguard Drive, Athlone, Cape Town, 7764', '021 684 2044', NULL, NULL,
  'Markham Vangate Mall is a branch of the national men''s fashion retailer, in Vangate Mall, Athlone.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/markham-vangate-city-athlone-in-cape-town", "https://www.tiendeo.co.za/stores/Athlone-Cape-Town/markham-vangate-mall-jakes-gerwel-drive/8939"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'markham-vangate-mall-athlone'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'honest-hardware-athlone', 'Honest Hardware',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  '57 Pooke Road, Athlone, Cape Town, 7764', '021 891 7786', NULL, NULL,
  'Honest Hardware is a hardware store in Athlone selling electrical, plumbing, solar and building supplies.',
  NULL, NULL,
  '["https://wa.me/Honest_Hardware", "https://www.tiktok.com/@honest_hardware"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'honest-hardware-athlone'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'campwell-hardware-athlone', 'Campwell Hardware',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  '57 Belgravia Road, Athlone, Cape Town, 7764', '021 696 5167', NULL, NULL,
  'Campwell Hardware is a hardware store in Athlone.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/24359_2", "https://www.africanadvice.com/1070196/Hardware_Stores/Western_Cape/Campwell_Hardware/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'campwell-hardware-athlone'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wembley-meat-market-athlone', 'Wembley Meat Market',
  (SELECT id FROM suburbs WHERE slug = 'athlone'),
  'Wembley Building, 21 Belgravia Road, Athlone, Cape Town, 7764', '021 697 1433', NULL, NULL,
  'Wembley Meat Market is a butchery in Athlone, part of the Wembley Group of Companies.',
  NULL, NULL,
  '["https://www.wembley.co.za/meat-market/", "https://www.thinklocal.co.za/biz/wembley-meat-market-athlone"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wembley-meat-market-athlone'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
