INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'glencairn-shopping-centre-glencairn', 'Glencairn Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'glencairn'),
  'Cnr Birkenhead Road & Glencairn Freeway, Glencairn, Cape Town, 7975', NULL, NULL,
  '["https://www.tiendeo.co.za/stores/simons-town/kwikspar-cnr-birkenhead-glencairn-freeway-glencairn/48994", "https://www.yellosa.co.za/company/908426/kwik-spar-glencairn-shopping-centre"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kwikspar-glencairn-glencairn', 'Kwikspar Glencairn',
  (SELECT id FROM suburbs WHERE slug = 'glencairn'),
  (SELECT id FROM shopping_centers WHERE slug = 'glencairn-shopping-centre-glencairn'),
  'Glencairn Shopping Centre, Cnr Birkenhead Road & Glencairn Freeway, Glencairn, Cape Town, 7975', '021 782 5711', NULL, NULL,
  'Kwikspar Glencairn is a supermarket with a butchery, deli, bakery and fresh produce section, inside Glencairn Shopping Centre, Glencairn.',
  NULL, NULL,
  '["https://www.thinklocal.co.za/biz/kwikspar-glencairn-glencairn", "https://za.africabz.com/western-cape/kwikspar-glencairn-2437"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kwikspar-glencairn-glencairn'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pizza-khaya-glencairn', 'Pizza Khaya',
  (SELECT id FROM suburbs WHERE slug = 'glencairn'),
  (SELECT id FROM shopping_centers WHERE slug = 'glencairn-shopping-centre-glencairn'),
  'Shop 1, Glencairn Shopping Centre, Birkenhead Road, Glencairn, Cape Town, 7975', '068 206 0777', NULL, NULL,
  'Pizza Khaya is a pizza and burger takeaway inside Glencairn Shopping Centre, Glencairn.',
  NULL, NULL,
  '["https://www.mrd.com/delivery/restaurant/the-khaya-pizza-burger-joint-glencairn/30583", "https://www.facebook.com/PizzaKhaya/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pizza-khaya-glencairn'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'absolute-dental-glencairn', 'Absolute Dental',
  (SELECT id FROM suburbs WHERE slug = 'glencairn'),
  (SELECT id FROM shopping_centers WHERE slug = 'glencairn-shopping-centre-glencairn'),
  'Shop 4, Glencairn Shopping Centre, Birkenhead Road, Glencairn, Cape Town, 7975', '021 782 0439', NULL, NULL,
  'Absolute Dental is a dental practice inside Glencairn Shopping Centre, Glencairn.',
  NULL, NULL,
  '["https://www.sayellow.com/absolute-dental-dr-c-terblanche-simons-town", "https://www.absolutedental.co.za/contact-us/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'absolute-dental-glencairn'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
