-- Cape Town routine: Muizenberg suburb research (3 new businesses)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tigers-milk-muizenberg', 'Tiger''s Milk',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  'Cnr Beach Road & Sidmouth Road, Muizenberg, Cape Town, 7950', '021 788 1860', NULL, 'muizenberg@tigersmilk.co.za',
  'Tiger''s Milk Muizenberg is a branch of the Tiger''s Milk restaurant and bar chain, serving burgers, pizza and grills at Surfers Corner overlooking the beach.',
  NULL, NULL,
  '["https://www.tigersmilk.co.za/location/muizenberg/", "https://specialsza.co.za/restaurant/tigers-milk-muizenberg/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tigers-milk-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'knead-bakery-muizenberg', 'Knead Bakery',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '82 Beach Road, Muizenberg, Cape Town, 7945', '021 213 0014', NULL, 'muizenberg@kneadbakery.co.za',
  'Knead Bakery is an artisan bakery and cafe at Surfers Corner, baking bread on site and serving cafe-style light meals, woodfired pizzas and coffee.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/knead-bakery-15502", "https://crave.co.za/establishment.asp?est=18544"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'knead-bakery-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bluebottle-guesthouse-muizenberg', 'Bluebottle Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '18 Mount Road, Muizenberg, Cape Town', '083 501 0762', NULL, 'bluebottle@wol.co.za',
  'Bluebottle Guesthouse is a seven-room bed and breakfast on the slopes of the Muizenberg mountains, overlooking False Bay, open since 2002.',
  NULL, NULL,
  '["https://www.blue-bottle.co.za/accommodation", "https://www.thegsa.co.za/game-lodges/948-bluebottle-guest-house"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bluebottle-guesthouse-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
