INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'maitland-square-maitland', 'Maitland Square',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  '278 Voortrekker Road, Maitland, Cape Town, 7405', NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/cash-crusaders/maitland-square-278-voortrekker-road-maitland", "https://nearbyza.com/shopping/store/maitland-square-278-voortrekker-rd-cape-town-7405-south-africa"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-maitland-square-maitland', 'Pick n Pay Maitland Square',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  (SELECT id FROM shopping_centers WHERE slug = 'maitland-square-maitland'),
  '278 Voortrekker Road, Maitland Square, Maitland, Cape Town, 7405', '021 510 1509', NULL, NULL,
  'Pick n Pay Maitland Square is a supermarket anchoring Maitland Square, in Maitland.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/langa/pick-n-pay-voortrekker-road-maitland-square-shopping-centre/43956", "https://promotheus.co.za/maitland/pick-n-pay-qualisave/278-voortrekker-road-maitland-square-shopping-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-maitland-square-maitland'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-crusaders-maitland-maitland', 'Cash Crusaders Maitland',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  (SELECT id FROM shopping_centers WHERE slug = 'maitland-square-maitland'),
  'Shop 15, Maitland Square, 278 Voortrekker Road, Maitland, Cape Town, 7405', '021 510 8033', 'https://www.cashcrusaders.co.za/', NULL,
  'Cash Crusaders Maitland is a second-hand goods store in Maitland Square, buying, selling and lending electronics, tools and other items.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/cash-crusaders-maitland-13476", "https://my-catalogue.co.za/stores/cape-town/cash-crusaders/maitland-square-278-voortrekker-road-maitland"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-crusaders-maitland-maitland'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'food-concept-maitland-maitland', 'Food_concept Maitland',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  '190 Voortrekker Road, Maitland, Cape Town, 7405', '081 439 6823', NULL, NULL,
  'Food_concept Maitland is a takeaway restaurant on Voortrekker Road serving burgers, chicken, sushi and salads.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d23912150-Reviews-Food_concept_Maitland-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'food-concept-maitland-maitland'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'morning-star-foods-maitland', 'Morning Star Foods',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  'Unit 20B1, Maitland Park, 733 Voortrekker Road, Maitland, Cape Town', '084 526 6168', NULL, 'info@morningstarfoods.co.za',
  'Morning Star Foods is a factory shop in Maitland Park selling healthy snacks and food ingredients.',
  NULL, NULL,
  '["https://www.factoryshopssa.co.za/directory/morningstar-foods-maitland/", "https://www.facebook.com/morningstarfoodsSA/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'morning-star-foods-maitland'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
