INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tigers-milk-cape-town-cbd', 'Tiger''s Milk',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '44 Long Street, Cape Town', '021 422 3556', NULL, NULL,
  'Tiger''s Milk is a casual restaurant and bar on Long Street known for burgers, ribs, and craft beer, in Cape Town CBD.',
  NULL, NULL,
  '["https://www.tigersmilk.co.za/location/long-street/", "https://www.capetownccid.org/explore/eat/tigers-milk"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tigers-milk-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'royale-eatery-cape-town-cbd', 'Royale Eatery',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '273 Long Street, Cape Town', '021 422 4536', NULL, NULL,
  'Royale Eatery is a burger restaurant on Long Street known for gourmet burgers and milkshakes, in Cape Town CBD.',
  NULL, NULL,
  '["https://www.royaleeatery.com/", "https://www.capetownmagazine.com/royale-eatery"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'royale-eatery-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'truth-coffee-cape-town-cbd', 'Truth Coffee',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '36 Buitenkant Street, Cape Town', '021 201 7000', NULL, NULL,
  'Truth Coffee is a coffee roastery and cafe on Buitenkant Street known for its steampunk-themed interior, in Cape Town CBD.',
  NULL, NULL,
  '["https://truth.coffee/pages/contact-us", "https://www.eatout.co.za/venue/truth-coffee-roasting-hq/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'truth-coffee-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
