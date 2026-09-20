INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'eden-on-the-bay-bloubergstrand', 'Eden on the Bay',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  'Corner of Sir David Baird Drive and Otto du Plessis Drive, Big Bay, Bloubergstrand, Cape Town, 7441', NULL, NULL,
  '["https://www.edenonthebaymall.co.za/", "https://www.facebook.com/edenonthebaymall/", "https://www.wheretostay.co.za/topic/6524-eden-on-the-bay-shopping-mall-big-bay-cape-town"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-eden-on-the-bay-bloubergstrand', 'Pick n Pay Eden on the Bay',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'eden-on-the-bay-bloubergstrand'),
  'Shop No 1, Eden on the Bay, 633 Otto Du Plessis Drive, Big Bay, Bloubergstrand, Cape Town, 7441', '021 712 0802', NULL, NULL,
  'Pick n Pay Eden on the Bay is a supermarket branch of the Pick n Pay chain and anchor tenant of Eden on the Bay, Bloubergstrand.',
  NULL, NULL,
  '["https://www.edenonthebaymall.co.za/pick-n-pay/", "https://www.yep.co.za/biz/store/big-bay-family-store-pty-ltd-t-or-a-pick-n-pay/493445"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-eden-on-the-bay-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'snoekies-big-bay-bloubergstrand', 'Snoekies Big Bay',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'eden-on-the-bay-bloubergstrand'),
  '0B Otto du Plessis Drive, Big Bay, Bloubergstrand, Cape Town, 7441', '021 554 9626', NULL, NULL,
  'Snoekies Big Bay is a fish-and-chips restaurant at Eden on the Bay, Bloubergstrand, part of the Snoekies chain founded in 1951.',
  NULL, NULL,
  '["https://www.edenonthebaymall.co.za/snoekies-big-bay/", "http://www.snoekies.co.za/wp-2017/wp-content/uploads/2019/01/menu.pdf", "https://za.africabz.com/western-cape/snoekies-104601"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'snoekies-big-bay-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'louise-and-anna-blouberg-bloubergstrand', 'Louise & Anna Blouberg',
  (SELECT id FROM suburbs WHERE slug = 'bloubergstrand'),
  (SELECT id FROM shopping_centers WHERE slug = 'eden-on-the-bay-bloubergstrand'),
  'Shop 16a, Eden on the Bay, Otto Du Plessis Drive, Bloubergstrand, Cape Town, 7441', '021 569 9378', NULL, NULL,
  'Louise & Anna Blouberg is a restaurant at Eden on the Bay, Bloubergstrand.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g6736900-d25053844-Reviews-Louise_Anna_Blouberg-Bloubergstrand_Western_Cape.html", "https://www.novacircle.com/spots/africa/south-africa/western-cape/city-of-cape-town/cape-town/louise-anna-blouberg-b18049"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'louise-and-anna-blouberg-bloubergstrand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
