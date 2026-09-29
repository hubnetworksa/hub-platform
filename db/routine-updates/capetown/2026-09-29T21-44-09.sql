-- Jobs 1-2: Kenilworth suburb research, 5 new businesses (none in a shopping centre)
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'moksh-kenilworth', 'Moksh', (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  '309 Main Road, Kenilworth, Cape Town', '021 761 2245', NULL, NULL,
  'Moksh is an Indian restaurant in Kenilworth serving authentic North Indian cuisine, known for its clay-oven dishes and curries.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/moksh-indian-restaurant-kenilworth/", "https://www.tripadvisor.co.za/Restaurant_Review-g2427457-d13473785-Reviews-Moksh_Kenilworth-Kenilworth_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'moksh-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dimples-dumpling-house-kenilworth', 'Dimples Dumpling House', (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  '274 Main Road, Kenilworth, Cape Town, 7708', '083 448 1633', NULL, NULL,
  'Dimples Dumpling House is a gourmet dim sum takeaway in Kenilworth serving handmade dumplings and Asian-inspired dishes.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g2427457-d24039643-Reviews-Dimples_Dumpling_House-Kenilworth_Western_Cape.html", "https://www.capetownetc.com/things-to-do-cape-town/dimples-dumpling-house-where-bite-sized-bliss-steams-to-perfection/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dimples-dumpling-house-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pho-thy-kenilworth', 'Pho Thy', (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  '2 Main Road, Saratoga Court, Kenilworth, Cape Town, 7708', '074 723 2347', NULL, NULL,
  'Pho Thy is a halal, authentic Vietnamese restaurant in Kenilworth offering dine-in, takeout and delivery.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g2427457-d33103585-Reviews-Pho_Thy-Kenilworth_Western_Cape.html", "https://hungryforhalaal.co.za/listing/pho-thy-vietnamese-cuisine-kenilworth/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pho-thy-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bootlegger-coffee-company-kenilworth', 'Bootlegger Coffee Company', (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  'Shop G05, Pam Golding on Main, 323 Main Road, Kenilworth, Cape Town', '021 761 4089', NULL, NULL,
  'Bootlegger Coffee Company is a specialty coffee shop in Kenilworth open daily for all-day breakfast, lunch and brunch.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/bootlegger-coffee-company-kenilworth/", "https://ourcafes.bootlegger.coffee/FoodDrink-CapeTown-BootleggerKenilworth"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bootlegger-coffee-company-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'knead-bakery-cafe-kenilworth', 'Knead Bakery & Cafe', (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  'Pick n Pay, Pam Golding on Main, cnr Summerley & Main Road, Kenilworth, Cape Town', '021 761 4119', NULL, NULL,
  'Knead Bakery & Cafe is a bakery and cafe inside the Pick n Pay at Pam Golding on Main, Kenilworth, serving freshly baked bread and coffee.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/knead-kenilworth/", "https://propertywheel.co.za/2015/07/new-multi-use-development-pam-golding-on-main-in-kenilworth-opens-its-doors/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'knead-bakery-cafe-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);
