-- Melkbosstrand: 3 new businesses (2 Birkenhead Shopping Centre tenants + 1 standalone restaurant)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-melkbosstrand', 'KFC Melkbosstrand',
  (SELECT id FROM suburbs WHERE slug = 'melkbosstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'birkenhead-shopping-centre-melkbosstrand'),
  'Shop 22, Birkenhead Shopping Centre, Melkbosstrand, Cape Town, 7441', '021 553 1405', NULL, NULL,
  'KFC Melkbosstrand is a fried chicken and burger takeaway in Birkenhead Shopping Centre, Melkbosstrand.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/vredekloof/shop-22-birkenhead-centre", "https://za.africabz.com/western-cape/kfc-melkbos-98211"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-melkbosstrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steers-melkbosstrand', 'Steers Melkbosstrand',
  (SELECT id FROM suburbs WHERE slug = 'melkbosstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'birkenhead-shopping-centre-melkbosstrand'),
  'Shop 19B, Birkenhead Shopping Centre, Cnr Otto du Plessis & Birkenhead Road, Melkbosstrand, Cape Town, 7441', '021 879 0883', 'https://location.steers.co.za/melkbosstrand', NULL,
  'Steers Melkbosstrand is a flame-grilled burger takeaway in Birkenhead Shopping Centre, Melkbosstrand.',
  NULL, NULL,
  '["https://location.steers.co.za/melkbosstrand", "https://www.tripadvisor.co.za/Restaurant_Review-g667022-d17788069-Reviews-Steers-Melkbosstrand_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steers-melkbosstrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'damhuis-restaurant-melkbosstrand', 'Damhuis Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'melkbosstrand'),
  '32 Beach Road, Melkbosstrand, Cape Town, 7441', '021 553 0093', 'https://www.diedamhuis.co.za', NULL,
  'Damhuis Restaurant is a seafood and South African cuisine restaurant housed in a heritage building on the Melkbosstrand beachfront.',
  NULL, NULL,
  '["https://www.diedamhuis.co.za/contact/", "https://www.tripadvisor.com/Restaurant_Review-g667022-d2535230-Reviews-or75-Damhuis_Restaurant-Melkbosstrand_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'damhuis-restaurant-melkbosstrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
