INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'barristers-grill-newlands', 'Barrister''s Grill',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'cardiff-castle-centre-newlands'),
  'Cardiff Castle, Kildare Road, Newlands, Cape Town, 7700', '+27 21 671 7907', 'http://www.barristersgrill.co.za/', NULL,
  'Barrister''s Grill is a pub and steak restaurant in the Cardiff Castle centre in Newlands Village, with a terrace and big-screen sports viewing.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/barristers-grill-cafe-newlands-4086", "http://www.barristersgrill.co.za/about-us"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barristers-grill-newlands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wine-concepts-newlands', 'Wine Concepts',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'cardiff-castle-centre-newlands'),
  'Cardiff Castle, Cnr Kildare Road & Main Street, Newlands, Cape Town, 7700', '021 671 9030', 'https://wineconcepts.co.za/stores/newlands/', NULL,
  'Wine Concepts is a specialist fine wine, spirits and beer retailer in the Cardiff Castle centre in Newlands, offering daily tastings and wine events.',
  NULL, NULL,
  '["https://wineconcepts.co.za/stores/newlands/", "https://www.thinklocal.co.za/biz/wine-concepts-newlands"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wine-concepts-newlands'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'gogos-deli-newlands', 'Gogo''s Deli',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'cardiff-castle-centre-newlands'),
  'Cardiff Castle Building, 58 Main Street, Newlands, Cape Town, 7700', '+27 72 210 4970', NULL, NULL,
  'Gogo''s Deli is a butchery and deli in the Cardiff Castle centre in Newlands, selling free-range meats, biltong and fresh produce.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/gogos-115728", "http://www.findglocal.com/ZA/Cape-Town/295863350443905/Gogos-Deli"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gogos-deli-newlands'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'italos-newlands', 'Italo''s',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'cardiff-castle-centre-newlands'),
  '51 Kildare Road, Cardiff Castle, Newlands, Cape Town, 7700', '021 683 6949', NULL, 'ciao@italos.co.za',
  'Italo''s is an Italian deli and bistro in the Cardiff Castle centre in Newlands Village.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/italos-deli/", "https://thelittlepersiancafe.com.au/133678-italos-deli/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'italos-newlands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'noodle-box-newlands', 'Noodle Box',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'cardiff-castle-centre-newlands'),
  'Cnr Main Street & Kildare Road, Cardiff Castle, Newlands, Cape Town, 7700', '+27 60 704 3499', NULL, NULL,
  'Noodle Box is an Asian noodle and bao bar in the Cardiff Castle centre in Newlands, run by the same family behind Sushi Box.',
  NULL, NULL,
  '["https://www.abillion.com/reviews/6581655f276eadf4f05129f0", "https://cardiffcastle.co.za/portfolio_page/noodle-box/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'noodle-box-newlands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kristens-kick-ass-ice-cream-newlands', 'Kristen''s Kick-Ass Ice Cream',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'cardiff-castle-centre-newlands'),
  'Shop 6, Cardiff Castle, Main Street, Newlands, Cape Town, 7700', '+27 81 481 6715', 'https://www.kristenskickass.co.za/contact-us', NULL,
  'Kristen''s Kick-Ass Ice Cream is an artisanal ice cream shop in the Cardiff Castle centre in Newlands, churning small batches on site.',
  NULL, NULL,
  '["https://www.kristenskickass.co.za/contact-us", "https://cardiffcastle.co.za/portfolio_page/art-design-blvd/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kristens-kick-ass-ice-cream-newlands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
