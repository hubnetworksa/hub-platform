-- Jobs 1-2: Simon's Town suburb research

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'simons-town-pharmacy-at-spar-simons-town', 'Simon''s Town Pharmacy at SPAR',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  '102 St George''s Street, Simon''s Town, Cape Town, 7995', '021 786 2133', NULL, NULL,
  'Simon''s Town Pharmacy at SPAR is a retail pharmacy inside the SPAR supermarket on St George''s Street, Simon''s Town.',
  NULL, NULL,
  '["http://wecarepharmacy.co.za/pharmacy-at-spar-simons-town/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=88963"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'simons-town-pharmacy-at-spar-simons-town'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'seaforth-restaurant-simons-town', 'Seaforth Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  'Seaforth Beach, Seaforth Road, Simon''s Town, Cape Town, 7975', '021 786 4810', 'https://www.seaforthrestaurant.co.za/', NULL,
  'Seaforth Restaurant is a beachfront restaurant on Seaforth Beach with views of mountains, sea and resident penguins, in Simon''s Town.',
  NULL, NULL,
  '["https://www.seaforthrestaurant.co.za/contact-us", "https://www.sa-venues.com/things-to-do/westerncape/seaforth-restaurant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'seaforth-restaurant-simons-town'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'saveur-restaurant-simons-town', 'Saveur Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  'Shop WC2A, Simon''s Town Boardwalk Centre, Wharf Street, Simon''s Town, Cape Town, 7975', '021 786 1919', NULL, NULL,
  'Saveur Restaurant is a waterfront restaurant offering a modern European-inspired menu and harbour views, at Simon''s Town Boardwalk Centre on Wharf Street.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g319718-d7195583-Reviews-Saveur_Restaurant-Simon_s_Town_Western_Cape.html", "https://www.eatout.co.za/venue/saveur-restaurant-simons-town/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'saveur-restaurant-simons-town'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'south-african-naval-museum-simons-town', 'South African Naval Museum',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  'St George''s Street, Simon''s Town, Cape Town, 7995', '021 787 4686', 'https://sanavymuseum.co.za/', NULL,
  'South African Naval Museum is a maritime heritage museum on St George''s Street run by the South African Navy, in Simon''s Town.',
  NULL, NULL,
  '["https://sanavymuseum.co.za/contact/", "https://www.tripadvisor.com/Attraction_Review-g319718-d4115586-Reviews-South_African_Naval_Museum-Simon_s_Town_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'south-african-naval-museum-simons-town'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'warrior-toy-museum-simons-town', 'Warrior Toy Museum',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  '1067 King George Way, Simon''s Town, Cape Town, 7975', '021 786 1395', NULL, NULL,
  'Warrior Toy Museum is a vintage toy museum on King George Way displaying model cars, dolls, dolls houses, railways and lead soldiers, in Simon''s Town.',
  NULL, NULL,
  '["https://www.capetownmagazine.com/vintage-toy-museum", "https://www.sa-venues.com/things-to-do/westerncape/warrior-toy-museum/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'warrior-toy-museum-simons-town'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'simons-town-museum-simons-town', 'Simon''s Town Museum',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  'The Residency, Court Road, Simon''s Town, Cape Town, 7975', '078 218 7762', NULL, NULL,
  'Simon''s Town Museum is a community heritage museum at The Residency on Court Road, documenting the history of Simon''s Town.',
  NULL, NULL,
  '["https://www.capetownmuseum.org.za/simons-town", "https://samuseums.co.za/museums/simons-town-museum/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'simons-town-museum-simons-town'),
  (SELECT id FROM categories WHERE slug = 'museums-heritage-sites'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'craftart-emporium-simons-town', 'Craftart Emporium',
  (SELECT id FROM suburbs WHERE slug = 'simons-town'),
  '128 St George''s Street, Simon''s Town, Cape Town, 7995', '021 786 1997', NULL, NULL,
  'Craftart Emporium is a gallery and gift shop on St George''s Street selling locally produced and African crafts, in Simon''s Town.',
  NULL, NULL,
  '["https://www.simonstown.com/shop/craftart", "http://www.modernoverland.com/south-africa/cape-town/simons-town/craftart-gallery/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'craftart-emporium-simons-town'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
