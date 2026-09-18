INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'stud-the-burger-shop-sea-point', 'Stud. The Burger Shop',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '315 Main Road, Sea Point, Cape Town', '087 470 0474', NULL, NULL,
  'Stud. The Burger Shop is a casual burger restaurant on Main Road in Sea Point.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g15134971-d25180343-Reviews-Stud-Sea_Point_Western_Cape.html", "https://www.foodandhome.co.za/entertaining/stud-the-burger-shop-sea-point"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'stud-the-burger-shop-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'goldies-deli-sea-point', 'Goldies Deli',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '176 Main Road, Sea Point, Cape Town', '021 434 1116', NULL, NULL,
  'Goldies Deli is a kosher deli and bakery on Main Road in Sea Point.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/goldies-deli/", "https://www.yep.co.za/biz/store/goldies-deli/287188"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'goldies-deli-sea-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'the-point-sea-point', 'The Point',
  (SELECT id FROM suburbs WHERE slug = 'sea-point'),
  '76 Regent Road, Sea Point, Cape Town', NULL, NULL,
  '["https://www.property24.com/articles/r300m-the-point-centre-leads-sea-points-regeneration/22116", "https://commercialspace.co.za/properties/the-point-regent-road-sea-point-officesretail-to-let/"]',
  'mall'
);
