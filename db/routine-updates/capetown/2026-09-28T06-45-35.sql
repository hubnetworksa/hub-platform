INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-lansdowne-corner-lansdowne', 'Shoprite', (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  (SELECT id FROM shopping_centers WHERE slug = 'lansdowne-corner-shopping-centre-lansdowne'),
  'Cnr Jan Smuts Drive and Lansdowne Road, Lansdowne Corner Shopping Centre, Lansdowne, Cape Town, 7800', '021 704 9740', NULL, NULL,
  'Shoprite is a supermarket, with a bakery, deli and butchery counter, in Lansdowne Corner Shopping Centre, Lansdowne.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Ottery/Shoprite-Lansdowne-Corner/store-details/30716", "https://za.africabz.com/western-cape/shoprite-lansdowne-corner-41406"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-lansdowne-corner-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mcdonalds-lansdowne-corner-lansdowne', 'McDonald''s', (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  (SELECT id FROM shopping_centers WHERE slug = 'lansdowne-corner-shopping-centre-lansdowne'),
  'Cnr Jan Smuts Drive and Lansdowne Road, Lansdowne Corner Shopping Centre, Lansdowne, Cape Town, 7700', '021 703 1202', NULL, NULL,
  'McDonald''s is a fast-food restaurant with a drive-thru, in Lansdowne Corner Shopping Centre, Lansdowne.',
  NULL, NULL,
  '["https://www.findmy.co.za/food/category-detail/McDonalds-Ottery-Drive-Thru/24364", "https://www.tripadvisor.ca/Restaurant_Review-g3493949-d17545794-Reviews-McDonald_s_Lansdowne-Lansdowne_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mcdonalds-lansdowne-corner-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mohammeds-meat-hyper-lansdowne', 'Mohammed''s Meat Hyper',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  '568 Lansdowne Road, Lansdowne, Cape Town, 7780', '021 761 6209', NULL, NULL,
  'Mohammed''s Meat Hyper is a halal butchery on Lansdowne Road, Lansdowne.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/wc/cape-town/mohameds-meat-hyper", "https://www.cylex.net.za/company/mohammed''s-meat-hyper-23708910.html", "https://www.thinklocal.co.za/biz/mohammeds-meat-hyper-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mohammeds-meat-hyper-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
