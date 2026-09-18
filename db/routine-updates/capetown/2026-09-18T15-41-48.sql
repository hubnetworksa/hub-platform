-- Suburb: green-point (jobs 1-2)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tigers-milk-green-point', 'Tiger''s Milk',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  'Shop 105-107, 47 Main Road, Green Point, Cape Town', '021 745 6624', 'https://www.tigersmilk.co.za/location/green-point/', NULL,
  'Tiger''s Milk is a restaurant and bar in Green Point serving pizzas, burgers and cocktails, part of a Cape Town-based restaurant chain.',
  NULL, NULL,
  '["https://www.tigersmilk.co.za/location/green-point/", "https://www.dining-out.co.za/restaurant-index.aspx?MemberID=11181&SiteVersion=desktop"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tigers-milk-green-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'giovannis-deliworld-green-point', 'Giovanni''s Deliworld',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '103 Main Road, Green Point, Cape Town', '021 434 6893', 'https://giovannisdeliworld.co.za', NULL,
  'Giovanni''s Deliworld is an Italian deli, coffee bar and grocery store in Green Point, trading since 1989.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d1131600-Reviews-Giovanni_s-Cape_Town_Central_Western_Cape.html", "https://giovannisdeliworld.co.za/contact"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'giovannis-deliworld-green-point'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'il-leone-mastrantonio-green-point', 'Il Leone Mastrantonio',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '22 Cobern Street, Green Point, Cape Town', '021 421 0071', NULL, 'illeone@mastrantonio.com',
  'Il Leone Mastrantonio is an Italian restaurant in Green Point, set in a heritage house on Cobern Street.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/il-leone-mastrantonio/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d2084244-Reviews-Il_Leone_Mastrantonio-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'il-leone-mastrantonio-green-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
