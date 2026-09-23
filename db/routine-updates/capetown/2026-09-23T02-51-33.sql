INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zaika-tandoor-crawford', 'Zaika Tandoor',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  (SELECT id FROM shopping_centers WHERE slug = 'kromboom-gardens-centre-rondebosch-east'),
  'No 8, Kromboom Gardens Centre, Corner of Kromboom Road & Burwood Road, Crawford, Cape Town, 7780', '021 697 3084', NULL, NULL,
  'Zaika Tandoor is a North Indian restaurant serving tandoor grills and curries from Kromboom Gardens Centre in Crawford.',
  NULL, NULL,
  '["https://za.polomap.com/cape-town/60485", "https://www.yep.co.za/biz/store/iyp/10427133_2", "https://www.africanadvice.com/1233077/Indian_Restaurants/Cape_Town/Zaika_Tandoor_Restaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zaika-tandoor-crawford'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'premfresh-crawford', 'PremFresh',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  (SELECT id FROM shopping_centers WHERE slug = 'kromboom-gardens-centre-rondebosch-east'),
  '4 Kromboom Gardens Centre, Kromboom Road, Crawford, Cape Town, 7780', '083 399 1450', NULL, NULL,
  'PremFresh is a seafood retailer trading from Kromboom Gardens Centre in Crawford.',
  NULL, NULL,
  '["https://premfresh.co.za/contact/", "https://www.facebook.com/IOLnews/posts/premfresh-opens-flagship-store-in-kromboom-road-crawford-cape-town-premfresh-the/981168797375502/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'premfresh-crawford'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'crawford-tops-crawford', 'Crawford Tops',
  (SELECT id FROM suburbs WHERE slug = 'crawford'),
  '2 Taronga Road, Crawford, Cape Town, 7780', '021 697 2028', NULL, NULL,
  'Crawford Tops is a liquor store on Taronga Road in Crawford.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/crawford-tops-262852", "https://www.spar.co.za/Home/Store-View/TOPS-Crawford-Tops-Western-Cape"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'crawford-tops-crawford'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);
