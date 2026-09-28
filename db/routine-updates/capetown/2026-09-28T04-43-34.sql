INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hungry-lion-langa-junction-langa', 'Hungry Lion Langa Junction',
  (SELECT id FROM suburbs WHERE slug = 'langa'),
  (SELECT id FROM shopping_centers WHERE slug = 'langa-junction-langa'),
  'Shop 7, Langa Junction, Brinton Street, Langa, Cape Town, 7456', '021 492 8400', NULL, NULL,
  'Hungry Lion Langa Junction is a fast-food outlet serving fried chicken, inside Langa Junction, Langa.',
  NULL, NULL,
  '["https://hungrylionmenu.co.za/locations/hungry-lion-langa-mallshop-7-langa-junctionbrinton-streetlangacape-town7456/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d27088922-Reviews-Hungry_Lion_Langa_Mall-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hungry-lion-langa-junction-langa'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-langa-junction-langa', 'PEP Langa Junction',
  (SELECT id FROM suburbs WHERE slug = 'langa'),
  (SELECT id FROM shopping_centers WHERE slug = 'langa-junction-langa'),
  'Shop 8, Langa Junction, Brinton Street, Langa, Cape Town, 7456', '021 695 0134', NULL, NULL,
  'PEP Langa Junction is a clothing and general merchandise retailer, inside Langa Junction, Langa.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-langa-junction-brinton-street-langa-cape-town-western-cape/69658", "https://za.polomap.com/cape-town/35090"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-langa-junction-langa'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lelapa-restaurant-langa', 'Lelapa Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'langa'),
  '49 Harlem Avenue, Langa, Cape Town, 7456', '021 694 2681', 'https://lelapa.co.za', NULL,
  'Lelapa Restaurant is a traditional township-cuisine restaurant in Langa, established in 1999 and catering for groups, events and functions by reservation.',
  NULL, NULL,
  '["https://lelapa.co.za/contact-us/", "https://www.waze.com/live-map/directions/za/wc/cape-town/lelapa-restaurant?to=place.ChIJqVlzGKBczB0RpaUbgpXTMtg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lelapa-restaurant-langa'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
