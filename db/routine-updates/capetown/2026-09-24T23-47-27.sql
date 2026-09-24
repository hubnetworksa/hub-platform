INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'superspar-kuilsrivier-kuils-river', 'SuperSpar Kuilsrivier',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  'Aroma Centre, 67 Van Riebeeck Road, Kuils River, Cape Town, 7580', '021 906 1350', NULL, NULL,
  'SuperSpar Kuilsrivier is a supermarket at the Aroma Centre in Kuils River, offering groceries and everyday essentials.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/superspar-17269", "https://www.thinklocal.co.za/biz/superspar-kuilsriver-kuilsriver"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'superspar-kuilsrivier-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-converters-kuils-river', 'Cash Converters Kuils River',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  'Shop 20, Shoprite Centre, 60 Van Riebeeck Road, Kuils River, Cape Town, 7580', '021 906 0120', 'https://www.cashconverters.co.za/store/kuils-river/', NULL,
  'Cash Converters Kuils River buys and sells second-hand goods, from electronics to tools and furniture.',
  NULL, NULL,
  '["https://www.cashconverters.co.za/store/kuils-river/", "https://za.africabz.com/western-cape/cash-converters-kuils-river-91331"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-converters-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-kuils-river', 'PEP',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  'Shop 1, Voortrekker Centre, 82 Van Riebeeck Road, Kuils River, Cape Town, 7580', '021 903 4062', NULL, NULL,
  'PEP is a discount retailer at the Voortrekker Centre in Kuils River, selling affordable clothing and essentials for the whole family.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-voortrekker-centre-van-riebeeck-road-kuils-river-cape-town-western-cape/12268", "https://www.yellosa.co.za/company/777467/pep-stores-pty-ltdbrancheskuils-rivervan-riebeeck-road-82"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
