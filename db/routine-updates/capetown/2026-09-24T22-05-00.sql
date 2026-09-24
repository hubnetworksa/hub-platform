-- Jobs 1-2: Goodwood
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steers-goodwood', 'Steers Goodwood',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  '100 Voortrekker Road, Goodwood, Cape Town, 7460', '021 591 3765', NULL, NULL,
  'Steers Goodwood is a fast-food restaurant serving flame-grilled burgers and chicken, on Voortrekker Road in Goodwood.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d17787987-Reviews-Steers_Goodwood-Cape_Town_Central_Western_Cape.html", "https://location.steers.co.za/goodwood"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steers-goodwood'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spice-it-up-goodwood', 'Spice It Up',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  '120 Voortrekker Road, Goodwood, Cape Town, 7460', '021 591 1723', NULL, NULL,
  'Spice It Up is a halaal takeaway restaurant on Voortrekker Road in Goodwood, with an adjoining spice shop.',
  NULL, NULL,
  '["https://za.readymap.info/6828/23288", "https://za.polomap.com/cape-town/18660"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spice-it-up-goodwood'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-goodwood-mall-goodwood', 'Pick n Pay Goodwood Mall',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'goodwood-mall-goodwood'),
  'Goodwood Mall, Dingle Road, Goodwood Estate, Cape Town, 7460', '021 591 9255', NULL, NULL,
  'Pick n Pay is the anchor supermarket at Goodwood Mall, offering groceries and everyday household essentials.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/908118/pick-n-pay-goodwood-mall", "https://www.cataloguespecials.co.za/stores/pick-n-pay/locations/goodwood"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-goodwood-mall-goodwood'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cash-crusaders-goodwood-mall-goodwood', 'Cash Crusaders Goodwood Mall',
  (SELECT id FROM suburbs WHERE slug = 'goodwood'),
  (SELECT id FROM shopping_centers WHERE slug = 'goodwood-mall-goodwood'),
  'Shop 14B, Goodwood Mall, Corner Voortrekker & McDonald Road, Goodwood, Cape Town, 7460', '021 592 6150', NULL, NULL,
  'Cash Crusaders Goodwood Mall buys, sells and lends against second-hand goods including electronics, tools and jewellery.',
  NULL, NULL,
  '["https://cashcrusaders.co.za/locate-a-store/store/114/goodwood", "https://www.cybo.com/ZA-biz/cash-crusaders-goodwood"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cash-crusaders-goodwood-mall-goodwood'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
