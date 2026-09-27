INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'kuilsriver-shopping-centre-kuils-river', 'Kuilsriver Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  'Van Riebeeck Road, Kuils River, Cape Town, 7580', NULL, NULL,
  '["https://ducatus.co.za/kuilsriver-shopping-centre/", "https://www.guzzle.co.za/malls/942/"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'access-park-kuils-river', 'Access Park',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  '1 Van Riebeeck Road, Kuils River, Cape Town, 7580', NULL, NULL,
  '["https://www.accesspark.co.za/", "https://www.yep.co.za/biz/store/iyp/2039929_2"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-kuils-river-2', 'Shoprite Kuils River',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'kuilsriver-shopping-centre-kuils-river'),
  'Van Riebeeck Road, Bosonia, Kuils River, Cape Town, 7580', '021 900 2860', NULL, NULL,
  'Shoprite Kuils River is a supermarket anchoring Kuilsriver Shopping Centre on Van Riebeeck Road, Kuils River.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Kuilsrivier/Shoprite-Kuils-River/store-details/2361", "https://za.africabz.com/western-cape/shoprite-kuils-river-58310"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-kuils-river-2'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-kuils-river-2', 'PEP',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'kuilsriver-shopping-centre-kuils-river'),
  'Shop 18-19, Shoprite Centre, Cnr Nooiensfontein & Van Riebeeck Road, Kuils River, Cape Town, 7580', '021 853 1776', NULL, NULL,
  'PEP is a discount clothing and homeware store in the Shoprite Centre at Kuilsriver Shopping Centre, Kuils River.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop--shoprite-centre-cnr-nooiensfontein-van-riebeeck-road-kuils-river-cape-town-western-cape/12273", "https://www.cybo.com/ZA-biz/pep-kuils-river-shoprite-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-kuils-river-2'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'adidas-factory-outlet-kuils-river', 'Adidas Factory Outlet',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'access-park-kuils-river'),
  'Unit A12, Access Park, 1 Van Riebeeck Road, Kuils River, Cape Town, 7580', '021 906 0659', NULL, NULL,
  'Adidas Factory Outlet is a discounted sportswear and footwear store in Access Park, Kuils River.',
  NULL, NULL,
  '["https://www.facebook.com/AccessParkBellville/posts/adidas-021-906-0659see-our-specials-in-store/3150822045022000/", "https://www.yep.co.za/biz/store/adidas-sa-pty-ltd/679032"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'adidas-factory-outlet-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'new-balance-outlet-kuils-river', 'New Balance Outlet',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'access-park-kuils-river'),
  'Shop A16, Access Park, 1 Van Riebeeck Road, Kuils River, Cape Town, 7530', '021 903 5128', NULL, NULL,
  'New Balance Outlet is a discounted footwear and activewear store in Access Park, Kuils River.',
  NULL, NULL,
  '["https://www.facebook.com/AccessParkBellville/posts/new-balance-outlet-store-021-903-5128/3132411166863088/", "https://za.africabz.com/western-cape/new-balance-access-park-88959"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'new-balance-outlet-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'shoe-stores'),
  1
);
