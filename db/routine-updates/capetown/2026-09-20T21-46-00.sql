INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'nautilus-centre-muizenberg', 'Nautilus Centre',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  'Spurwing Circle, Baden Powell Drive, Capricorn Beach, Muizenberg, Cape Town, 7945', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/nautilus.html", "https://za.africabz.com/western-cape/nautilus-16195", "https://www.hotfrog.co.za/company/1099860513148928"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'surfstore-africa-muizenberg', 'Surfstore Africa',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'nautilus-centre-muizenberg'),
  'Unit 8, Nautilus Centre, Cnr Sanderling Road & Baden Powell Drive, Muizenberg, Cape Town, 7945', '021 788 5055', 'https://surfstore.co.za', NULL,
  'Surfstore Africa is a kitesurfing and stand-up paddle shop in the Nautilus Centre at Capricorn Beach, Muizenberg, selling and renting kites, kiteboards, wetsuits and SUP boards.',
  NULL, NULL,
  '["https://kitesurfcapetown.co.za/kitesurf-shops/surfstore-africa/", "https://capetown-watersports.com/kiteboarding-directory-muizenberg/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'surfstore-africa-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-smoking-croaker-muizenberg', 'The Smoking Croaker',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'nautilus-centre-muizenberg'),
  'Nautilus Centre, Baden Powell Drive, Capricorn Beach, Muizenberg, Cape Town', '066 150 6073', NULL, NULL,
  'The Smoking Croaker is a restaurant and bar in the Nautilus Centre at Capricorn Beach, Muizenberg.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/the-smoking-croaker-266444", "https://www.facebook.com/thesmokingcroaker/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-smoking-croaker-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'manhattan-laundry-cleaning-services-muizenberg', 'Manhattan Laundry & Cleaning Services',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'nautilus-centre-muizenberg'),
  'No. 5 Nautilus Centre, Spurwing Circle, Baden Powell Drive, Muizenberg, Cape Town, 7945', '021 788 2757', NULL, NULL,
  'Manhattan Laundry & Cleaning Services is a laundromat and dry-cleaning drop-off in the Nautilus Centre, Muizenberg.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/1099860513148928", "https://za.africabz.com/western-cape/manhattan-laundry-cleaning-services-cc-145862"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'manhattan-laundry-cleaning-services-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'cleaning-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tigers-milk-muizenberg', "Tiger's Milk Muizenberg",
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  'Corner of Beach Road & Sidmouth Road, Muizenberg, Cape Town', '021 788 1860', NULL, NULL,
  "Tiger's Milk Muizenberg is a casual restaurant and bar on the corner of Beach and Sidmouth Roads, part of the Tiger's Milk chain.",
  NULL, NULL,
  '["https://za.africabz.com/western-cape/tigers-milk-muizenberg-8141", "https://insideguide.co.za/cape-town/restaurants/tigers-milk-muizenberg/"]',
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
  'carlas-mozambique-restaurant-muizenberg', "Carla's Mozambique Restaurant",
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '9 York Road, Muizenberg, Cape Town, 7950', '021 788 6860', NULL, NULL,
  "Carla's Mozambique Restaurant is a small Mozambican restaurant on York Road, Muizenberg, known for Mozambique-style prawns.",
  NULL, NULL,
  '["https://za.africabz.com/western-cape/carlas-mozambique-restaurant-42226", "https://za.polomap.com/cape-town/21545"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'carlas-mozambique-restaurant-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'knead-bakery-muizenberg', 'Knead Bakery Muizenberg',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  'Surfers Corner, Cnr Clarendon & Beach Roads, Muizenberg, Cape Town, 7945', '021 788 2909', 'https://www.kneadbakery.co.za', NULL,
  'Knead Bakery Muizenberg is an artisanal bakery and cafe at Surfers Corner on Beach Road, part of the Knead bakery chain.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g1509162-d2367407-Reviews-Knead_Bakery-Muizenberg_Western_Cape.html", "https://www.kneadbakery.co.za/"]',
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
  'tortuga-loca-muizenberg', 'Tortuga Loca',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '141 Main Road, Muizenberg, Cape Town', '087 095 5733', NULL, NULL,
  'Tortuga Loca is a Mexican and Latin American-inspired restaurant on Main Road, Muizenberg.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/tortuga-loca-336033", "https://www.tripadvisor.com/Restaurant_Review-g1509162-d23865039-Reviews-Tortuga_Loca-Muizenberg_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tortuga-loca-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'learn-2-surf-muizenberg', 'Learn 2 Surf Cape Town',
  (SELECT id FROM suburbs WHERE slug = 'muizenberg'),
  '165 Main Road, Muizenberg, Cape Town, 7945', '083 414 0567', NULL, NULL,
  'Learn 2 Surf Cape Town is a surf school based on Main Road, Muizenberg, offering surf lessons at Muizenberg Beach for beginners and intermediate surfers.',
  NULL, NULL,
  '["https://textmap.co.za/3/39495", "https://www.tripadvisor.co.za/Attraction_Review-g1509162-d3701037-Reviews-Learn_2_Surf_Cape_Town-Muizenberg_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'learn-2-surf-muizenberg'),
  (SELECT id FROM categories WHERE slug = 'schools-education'),
  1
);
