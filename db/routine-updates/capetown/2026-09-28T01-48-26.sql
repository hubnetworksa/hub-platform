-- Jobs 1-2: pinelands suburb research (Howard Centre + Central Square tenant discovery), plus one bonus Ndabeni catch

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-pinelands', 'The Crazy Store',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Shop G44-G45, Howard Centre, Howard Drive, Pinelands, Cape Town, 7405', '087 135 8340', NULL, NULL,
  'The Crazy Store is a discount variety store inside Howard Centre, Pinelands.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/the-crazy-store-pinelands-188149", "https://www.shopshours.co.za/crazy-store/cape-town/c-57f3cabc47d677c3b27e3f59"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-crazy-store-pinelands'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pizzeria-villaggio-pinelands', 'Pizzeria Villaggio',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Shop G37, Howard Centre, Logan Way, Pinelands, Cape Town', '021 531 4473', NULL, NULL,
  'Pizzeria Villaggio is an Italian restaurant inside Howard Centre, Pinelands, serving pizza, pasta and burgers.',
  NULL, NULL,
  '["https://www.novacircle.com/spots/africa/south-africa/western-cape/city-of-cape-town/cape-town/pizzeria-villaggio-e985fe", "https://www.sluurpy.co.za/pinelands/restaurant/5030747/pizzeria-villaggio"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pizzeria-villaggio-pinelands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'peacock-tea-and-coffee-pinelands', 'Peacock Tea and Coffee',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Shop G11, Howard Centre, Corner Howard & Forest Drive, Pinelands, Cape Town', '021 531 8596', NULL, NULL,
  'Peacock Tea and Coffee is a specialist tea and coffee retailer inside Howard Centre, Pinelands, established in 1966.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/peacock-tea-and-coffee-25979", "https://www.peacockteaandcoffee.co.za/stores/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'peacock-tea-and-coffee-pinelands'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'simply-asia-pinelands', 'Simply Asia',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Shop G43/43b, Howard Centre, Forest Drive, Pinelands, Cape Town, 7405', '021 531 2422', NULL, NULL,
  'Simply Asia is a Thai and Asian food restaurant inside Howard Centre, Pinelands.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/simply-asia-pinelands/", "https://stores.simplyasia.co.za/details/pinelands"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'simply-asia-pinelands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'joe-fish-seafood-cafe-pinelands', 'Joe Fish Seafood Cafe',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Shop 39, Howard Centre, Logan Way, Pinelands, Cape Town', '021 531 2974', NULL, NULL,
  'Joe Fish Seafood Cafe is a small seafood restaurant inside Howard Centre, Pinelands.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md-menu/Joe-Fish-Seafood-Cafe/3502", "https://joefish.net/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'joe-fish-seafood-cafe-pinelands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-pinelands', 'SPAR Pinelands',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'central-square-pinelands'),
  'Shop 1, Central Square, Pinelands, Cape Town, 7405', '021 531 6561', NULL, NULL,
  'SPAR Pinelands is a supermarket inside Central Square, Pinelands.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/pinelands-spar-23487", "https://my-catalogue.co.za/stores/pinelands/spar/shop-1-central-square"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-pinelands'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steers-pinelands', 'Steers Pinelands',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'central-square-pinelands'),
  'Central Building, Shop 11, Corner Central Square & Mead Way, Pinelands, Cape Town, 7405', '021 531 9233', NULL, NULL,
  'Steers Pinelands is a flame-grilled burger and chicken takeaway inside Central Square, Pinelands.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/steers-pinelands/", "https://location.steers.co.za/pinelands"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steers-pinelands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hoghouse-brewing-company-ndabeni', 'Hoghouse Brewing Company',
  (SELECT id FROM suburbs WHERE slug = 'ndabeni'),
  '42 Morningside Road, Ndabeni, Cape Town', '021 810 4545', NULL, NULL,
  'Hoghouse Brewing Company is a brewery, barbecue restaurant and bakery in Ndabeni.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/restaurants-cape-town/texan-barbeque-grub-at-hoghouse-brewing-co-and-restaurant-in-cape-town/27_22_19848", "https://www.eatout.co.za/venue/hoghouse-brewing-company/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hoghouse-brewing-company-ndabeni'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
