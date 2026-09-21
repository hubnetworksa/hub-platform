INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jason-bakery-green-point', 'Jason Bakery',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '83 Main Road, Green Point, Cape Town', '021 433 0538', 'https://jasonbakery.com/', NULL,
  'Jason Bakery is an artisan bakery and breakfast cafe on Main Road known for its sourdough, pastries and coffee, in Green Point.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/jason-bakery-green-point/", "https://jasonbakery.com/pages/contact-us"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jason-bakery-green-point'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rocomamas-green-point', 'RocoMamas Green Point',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '107A Main Road, Green Point, Cape Town', '021 433 2816', 'https://www.rocomamas.com', NULL,
  'RocoMamas is a casual American-style burger and wings restaurant on Main Road, part of a national chain, in Green Point.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/rocomamas-green-point/", "https://www.wininganddining.co.za/western-cape/cape-town/green-point/rocomamas-green-point"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rocomamas-green-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'el-burro-green-point', 'El Burro',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '79 Main Road, Green Point, Cape Town', '021 433 2364', 'https://www.elburro.co.za/', NULL,
  'El Burro is a Mexican restaurant and tequila bar on Main Road serving authentic Mexican cuisine, in Green Point.',
  NULL, NULL,
  '["https://www.elburro.co.za/", "https://www.capetownmagazine.com/el-burro"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'el-burro-green-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'best-of-asia-green-point', 'Best of Asia',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '105 Main Road, Green Point, Cape Town', '021 439 4918', NULL, NULL,
  'Best of Asia is a pan-Asian restaurant on Main Road serving a range of Asian cuisine for lunch and dinner, in Green Point.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/best-of-asia-green-point/", "https://www.tripadvisor.com/Restaurant_Review-g312659-d7060627-Reviews-Best_of_Asia-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'best-of-asia-green-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-creamery-cafe-mouille-point', 'The Creamery Café',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  '2 Park Road, Mouille Point, Cape Town', '021 434 2455', 'http://www.thecreamery.co.za/', NULL,
  'The Creamery Café is an artisan ice cream and coffee cafe on Park Road near the Mouille Point promenade, known for its handmade ice cream, in Mouille Point.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d8090934-Reviews-The_Creamery_Cafe_Mouille_Point-Cape_Town_Central_Western_Cape.html", "http://www.thecreamery.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-creamery-cafe-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bobos-brasserie-mouille-point', "Bobo's Brasserie",
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  '1 Two Oceans Beach, Beach Road, Mouille Point, Cape Town', '021 439 9027', NULL, 'managers@bobos.co.za',
  "Bobo's Brasserie is a French-inspired restaurant at Two Oceans Beach with uninterrupted sea views, serving lunch and dinner daily, in Mouille Point.",
  NULL, NULL,
  '["https://www.eatout.co.za/venue/bobos-brasserie/", "https://crushmag-online.com/bobos-brasserie-mouille-point/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bobos-brasserie-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ellerman-house-bantry-bay', 'Ellerman House',
  (SELECT id FROM suburbs WHERE slug = 'bantry-bay'),
  '180 Kloof Road, Bantry Bay, Cape Town', '021 430 3200', 'https://www.ellerman.co.za/', 'info@ellerman.co.za',
  "Ellerman House is a five-star boutique hotel on Kloof Road set in a former shipping magnate's residence overlooking the Atlantic, in Bantry Bay.",
  NULL, NULL,
  '["https://www.ellerman.co.za/", "https://www.relaischateaux.com/us/hotel/ellerman-house/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ellerman-house-bantry-bay'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-clarendon-bantry-bay', 'The Clarendon Bantry Bay',
  (SELECT id FROM suburbs WHERE slug = 'bantry-bay'),
  '158 Kloof Road, Bantry Bay, Cape Town', '021 439 3224', 'https://www.clarendon.co.za/', NULL,
  "The Clarendon Bantry Bay is a boutique hotel on Kloof Road set on the slopes of Lion's Head with views over the Atlantic Ocean, in Bantry Bay.",
  NULL, NULL,
  '["https://www.clarendon.co.za/", "https://www.tripadvisor.com/Hotel_Review-g312654-d1450363-Reviews-The_Clarendon_Bantry_Bay-Bantry_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-clarendon-bantry-bay'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'o-on-kloof-bantry-bay', 'O on Kloof Boutique Hotel & Spa',
  (SELECT id FROM suburbs WHERE slug = 'bantry-bay'),
  '92 Kloof Road, Bantry Bay, Cape Town', '021 745 6648', 'https://www.oonkloof.co.za/', 'info@oonkloof.co.za',
  'O on Kloof Boutique Hotel & Spa is a boutique hotel on Kloof Road offering accommodation and spa treatments, in Bantry Bay.',
  NULL, NULL,
  '["https://www.oonkloof.co.za/", "https://www.sa-venues.com/visit/oonkloof/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'o-on-kloof-bantry-bay'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);
