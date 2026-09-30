INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'harlequin-restaurant-parow', 'Harlequin Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  '281 Voortrekker Road, Parow, Cape Town, 7500', '021 939 1993', 'https://www.harlequinrestaurant.co.za', NULL,
  'Harlequin Restaurant is a long-established Italian restaurant on Voortrekker Road, in Parow.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/harlequin/", "https://www.capetownetc.com/cape-town/harlequin-restaurant-on-voortrekker-road-remains-open-for-business/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'harlequin-restaurant-parow'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'van-schaik-bookstore-parow', 'Van Schaik Bookstore',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  (SELECT id FROM shopping_centers WHERE slug = 'parow-centre-parow'),
  'Shop 120, Parow Centre, Voortrekker Road, Parow, 7500', '021 930 2480', NULL, 'vsparow@vanschaik.com',
  'Van Schaik Bookstore is a bookshop selling textbooks and general reading, in Parow Centre, Parow.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/426480/van-schaik-bookstore-parow", "https://www.brabys.com/za/western-cape/parow/parow-centre/booksellers-general/van-schaik-bookshop"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'van-schaik-bookstore-parow'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fourie-basson-and-veldtman-parow', 'Fourie Basson & Veldtman',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  'Toplinhuis, 219 Voortrekker Road, Parow, Cape Town, 7500', '021 929 2600', 'http://www.fbv.co.za', NULL,
  'Fourie Basson & Veldtman is a commercial law firm with an office on Voortrekker Road, in Parow.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/fourie-basson-and-veldtman-in-parow", "https://www.thinklocal.co.za/biz/fourie-basson-veldtman-parow"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fourie-basson-and-veldtman-parow'),
  (SELECT id FROM categories WHERE slug = 'attorneys-legal'),
  1
);
