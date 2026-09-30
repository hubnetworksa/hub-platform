INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-gugulethu-square-gugulethu', 'KFC Gugulethu Square',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Shop 59, Ny1, Cnr Ny7 Road, Gugulethu Square, Gugulethu, Cape Town, 7750', '021 638 0133', NULL, NULL,
  'KFC Gugulethu Square is an outlet of the fast-food chain, serving fried chicken and other quick meals in the Gugulethu Square shopping centre.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/gugulethu/shop-59-ny1-cnr-ny-7-road-gugulethu-square-shopping-centre", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d24187899-Reviews-KFC_Gugulethu_Square-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'truworths-gugulethu-square-gugulethu', 'Truworths Gugulethu Square',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Shop 72, Gugulethu Square, Corner NY1 & NY3, Gugulethu, Cape Town, 7751', '021 638 6459', NULL, NULL,
  'Truworths Gugulethu Square is a fashion and clothing retailer in the Gugulethu Square shopping centre.',
  NULL, NULL,
  '["https://yandex.com/maps/org/truworths_gugulethu_square/123730682595/", "https://www.guzzle.co.za/malls/369/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'truworths-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-gugulethu-square-gugulethu', 'Mr Price Gugulethu Square',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Shop 55, Gugulethu Square, Corner NY1 & NY3, Gugulethu, Cape Town, 7751', '021 637 2957', NULL, NULL,
  'Mr Price Gugulethu Square is a clothing and homeware retailer in the Gugulethu Square shopping centre.',
  NULL, NULL,
  '["https://www.shopshours.co.za/mr-price/cape-town/c-57f3cabf47d677c3b27e4c82", "https://www.guzzle.co.za/malls/369/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-price-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'foschini-gugulethu-square-gugulethu', 'Foschini Gugulethu Square',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Shop 53 & 54, Gugulethu Square, Corner NY1 & NY3, Gugulethu, Cape Town, 7751', '021 630 1900', NULL, NULL,
  'Foschini Gugulethu Square is a fashion and clothing retailer in the Gugulethu Square shopping centre.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/foschini-gugulethu-cape-town-in-cape-town", "https://www.guzzle.co.za/foschini/guguletu/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'foschini-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ackermans-gugulethu-square-gugulethu', 'Ackermans Gugulethu Square',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Shop 32, Gugulethu Square, NY1, Gugulethu, Cape Town, 7750', '021 633 0984', NULL, NULL,
  'Ackermans Gugulethu Square is a fashion and clothing retailer in the Gugulethu Square shopping centre.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/guguletu/ackermans-shop-gugulethu-sqaure/15261", "https://www.facebook.com/AckermansGugulethuSquare/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ackermans-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ok-furniture-gugulethu-square-gugulethu', 'OK Furniture Gugulethu',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Shop 1 & 2, Gugulethu Square, Gugulethu, Cape Town, 7750', '021 630 2200', NULL, NULL,
  'OK Furniture Gugulethu is a furniture and homeware retailer in the Gugulethu Square shopping centre.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/ok-furniture-gugulethu-in-cape-town", "https://my-catalogue.co.za/stores/cape-town/ok-furniture/gugulethu-shopping-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ok-furniture-gugulethu-square-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vodacom-shop-express-gugulethu-gugulethu', 'Vodacom Shop Express Gugulethu',
  (SELECT id FROM suburbs WHERE slug = 'gugulethu'),
  (SELECT id FROM shopping_centers WHERE slug = 'gugulethu-square-gugulethu'),
  'Shop 40, Gugulethu Square, Gugulethu, Cape Town, 7750', '021 633 3544', NULL, NULL,
  'Vodacom Shop Express Gugulethu is a mobile phone retailer in the Gugulethu Square shopping centre, offering phones, accessories and repairs.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/vodacom-shop-express-gugulethu-in-cape-town", "https://foursquare.com/v/vodacom-express-gugulethu/5dc20df454db0400086e3e3c"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vodacom-shop-express-gugulethu-gugulethu'),
  (SELECT id FROM categories WHERE slug = 'mobile-phones'),
  1
);
