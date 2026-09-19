-- Jobs 1-2: Claremont / Newlands / Kenilworth suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bardellis-kenilworth', 'Bardelli''s',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  '51 Kenilworth Road, Cnr Wessels Road, Kenilworth, Cape Town, 7708', '021 683 1423', NULL, NULL,
  'Bardelli''s is an Italian pizzeria and restaurant on Kenilworth Road serving pizzas, pasta and steaks since 1992.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g2427457-d4269308-Reviews-Bardelli_s-Kenilworth_Western_Cape.html", "https://bardellis.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bardellis-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wildsprout-kenilworth', 'Wildsprout',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  '278 Main Road, Kenilworth, Cape Town', '068 649 6147', NULL, NULL,
  'Wildsprout is a health-focused cafe and grocery store on Main Road in Kenilworth, serving breakfasts, salads and wraps with vegan and gluten-free options.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/wild-sprout", "https://za.africabz.com/western-cape/wild-sprout-60038"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wildsprout-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

-- New shopping centre discovered via Newlands suburb research
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'dean-street-arcade-newlands', 'Dean Street Arcade',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  'Cnr Dean Street & Main Road, Newlands, Cape Town', NULL, NULL,
  '["https://deanstreetarcade.co.za/", "https://za.africabz.com/western-cape/dean-street-arcade-17449"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mamma-roma-newlands', 'Mamma Roma',
  (SELECT id FROM suburbs WHERE slug = 'newlands'),
  (SELECT id FROM shopping_centers WHERE slug = 'dean-street-arcade-newlands'),
  '5 Dean Street, Newlands, Cape Town, 7700', '021 689 1975', NULL, NULL,
  'Mamma Roma is a family-run Italian restaurant in the Dean Street Arcade in Newlands, serving traditional Italian dishes since 1986.',
  NULL, NULL,
  '["https://www.mammaroma.co.za/", "https://www.tripadvisor.com/ShowUserReviews-g312582-d3583716-r446517899-Mamma_Roma-Newlands_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mamma-roma-newlands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rocomamas-kenilworth', 'RocoMamas',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  (SELECT id FROM shopping_centers WHERE slug = 'kenilworth-centre-kenilworth'),
  'Shop 116, Kenilworth Centre, Doncaster Road, Kenilworth, Cape Town', '021 672 0995', NULL, NULL,
  'RocoMamas is a burger and milkshake restaurant chain outlet inside the Kenilworth Centre on Doncaster Road.',
  NULL, NULL,
  '["https://rocomamas.com/za/restaurants/western-cape/rocomamas-kenilworth", "https://kenilworthcentre.co.za/stores/store-list/rocomamas/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rocomamas-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'game-kenilworth', 'GAME',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  (SELECT id FROM shopping_centers WHERE slug = 'kenilworth-centre-kenilworth'),
  'Shop 62 & 63, Kenilworth Centre, Doncaster Road, Kenilworth, Cape Town, 7708', '086 142 6043', NULL, NULL,
  'GAME is a general merchandise and electronics retailer inside the Kenilworth Centre on Doncaster Road.',
  NULL, NULL,
  '["https://kenilworthcentre.co.za/stores/store-list/game/", "https://za.africabz.com/western-cape/game-46351"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'game-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
