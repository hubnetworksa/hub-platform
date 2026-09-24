-- Jobs 1-2: suburb research for lwandle, macassar, cape-town-cbd
-- (lwandle and macassar had nothing clear the 2-source + phone/address bar this run)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'infusion-on-long-cape-town-cbd', 'Infusion on Long',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '57 Long Street, Cape Town', '087 470 0504', NULL, NULL,
  'Infusion on Long is a restaurant, bar and lounge on Long Street, serving breakfast, burgers, steak, seafood, pasta and tacos, in Cape Town CBD.',
  NULL, NULL,
  '["https://infusiononlong.co.za/", "https://www.capetownmagazine.com/infusion-on-long"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'infusion-on-long-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'obi-restaurant-cape-town-cbd', 'Obi Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '14 Long Street, Cape Town', '021 418 4040', NULL, NULL,
  'Obi Restaurant is a Japanese restaurant and bar on Long Street, serving tempura, ramen and sushi, in Cape Town CBD.',
  NULL, NULL,
  '["https://obirestaurant.co.za/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d10523954-Reviews-or90-Obi-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'obi-restaurant-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rosetta-roastery-cape-town-cbd', 'Rosetta Roastery',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '97 Bree Street, Cnr Shortmarket Street, Cape Town', '021 447 4099', NULL, NULL,
  'Rosetta Roastery is a specialty coffee roastery and cafe on the corner of Bree and Shortmarket Streets, in Cape Town CBD.',
  NULL, NULL,
  '["https://www.rosettaroastery.com/", "https://www.eatout.co.za/venue/rosetta-roastery-bree-street/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rosetta-roastery-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kluk-cgdt-cape-town-cbd', 'Kluk CGDT',
  (SELECT id FROM suburbs WHERE slug = 'cape-town-cbd'),
  '43-45 Bree Street, Cape Town, 8001', '083 377 7780', NULL, NULL,
  'Kluk CGDT is a fashion boutique on Bree Street offering custom and ready-to-wear apparel, including wedding dresses, in Cape Town CBD.',
  NULL, NULL,
  '["https://klukcgdt.com/contact/", "https://www.capetownccid.org/explore/shop/kluk-cgdt"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kluk-cgdt-cape-town-cbd'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);
