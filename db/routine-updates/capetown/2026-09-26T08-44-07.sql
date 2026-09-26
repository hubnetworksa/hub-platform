INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'birkenhead-shopping-centre-melkbosstrand', 'Birkenhead Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'melkbosstrand'),
  'Corner Birkenhead Drive & Otto du Plessis Drive, Melkbosstrand, Cape Town, 7437', NULL, NULL,
  '["https://tracks4africa.co.za/listings/item/w132004/birkenhead-shopping-centre/", "https://www.mallguide.co.za/malls/view/918/the-birkenhead-shopping-centre", "https://www.melkbosonline.co.za/cat/retailstores/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wimpy-melkbosstrand', 'Wimpy Melkbosstrand',
  (SELECT id FROM suburbs WHERE slug = 'melkbosstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'birkenhead-shopping-centre-melkbosstrand'),
  '4 Birkenhead Drive, Melkbosstrand, Cape Town, 7437', '021 553 1000', NULL, NULL,
  'Wimpy Melkbosstrand is a family restaurant in the Birkenhead Shopping Centre precinct in Melkbosstrand, Cape Town, serving breakfasts, burgers and toasted sandwiches with dine-in and takeaway options.',
  NULL, NULL,
  '["https://location.wimpy.co.za/western-cape/melkbosstrand", "https://www.yellosa.co.za/company/517229/wimpymelkbos-", "https://www.findmy.co.za/food/category-detail/Wimpy-Drive-Thru-Melkbos/26004"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wimpy-melkbosstrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-daily-coffee-cafe-melkbosstrand', 'The Daily Coffee Cafe',
  (SELECT id FROM suburbs WHERE slug = 'melkbosstrand'),
  'Shop 6, Balzac Building, Corner Beach Road & 6th Avenue, Melkbosstrand, Cape Town, 7441', '067 795 4576', 'https://thedailycoffeecafe.co.za/franchise-location-melkbosstrand/', 'melkbos2@thedailycoffeecafe.co.za',
  'The Daily Coffee Cafe Melkbosstrand is a coffee shop and breakfast/lunch cafe in the coastal village of Melkbosstrand, Cape Town.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g667022-d17748415-Reviews-The_Daily_Coffee_Cafe-Melkbosstrand_Western_Cape.html", "https://thedailycoffeecafe.co.za/franchise-location-melkbosstrand/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-daily-coffee-cafe-melkbosstrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
