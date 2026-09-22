INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'keedo-paarden-eiland', 'Keedo',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '9 Transvaal Street, Paarden Eiland, Cape Town', '021 511 2929', NULL, NULL,
  'Keedo is a children''s clothing factory shop in Paarden Eiland, designing and producing its own kidswear on site.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/keedo-international/620928", "https://www.africanadvice.com/1173381/Kids_Clothing/Cape_Town/Keedo/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'keedo-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tifgifts-paarden-eiland', 'Tifgifts Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '10 Industry Road, Paarden Eiland, Cape Town', '021 514 3106', NULL, NULL,
  'Tifgifts Factory Shop is a gift and toiletries factory shop on the corner of Perfecta and Industry Roads in Paarden Eiland.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/tifgifts-factory-shop-163134", "https://www.yoys.co.za/phone,27-215143106,Gift-Basket-Store,Cape-Town,ZA17352.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tifgifts-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-shred-coffee-shop-paarden-eiland', 'The Shred Coffee Shop',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  '68 Auckland Street, Paarden Eiland, Cape Town', '021 510 2918', NULL, NULL,
  'The Shred Coffee Shop is a retro-style coffee shop on the premises of The Shred skatepark in Paarden Eiland.',
  NULL, NULL,
  '["https://nearbyza.com/place/the-shred", "https://za.africabz.com/western-cape/the-shred-skatepark-17197"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-shred-coffee-shop-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vida-e-caffe-paarden-eiland', 'vida e caffè Paarden Eiland',
  (SELECT id FROM suburbs WHERE slug = 'paarden-eiland'),
  'Unit 13, TDC Campus, 52 Marine Drive, Paarden Eiland, Cape Town, 7405', '021 510 0622', NULL, NULL,
  'vida e caffè Paarden Eiland is an espresso bar on Marine Drive in Paarden Eiland.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/vida-e-caffe-paarden-eiland-122628", "https://www.tripadvisor.co.za/Restaurant_Review-g1722390-d14119354-Reviews-Vida_e_caffe-Cape_Town_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vida-e-caffe-paarden-eiland'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
