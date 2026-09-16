-- Gardens: job 1/2 research checkpoint

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'gardens-shopping-centre-gardens', 'Gardens Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  'Cnr Mill and Buitenkant Streets, Gardens, Cape Town', NULL, NULL,
  '["https://www.postnet.co.za/stores/gardensshoppingcentre", "https://www.sa-venues.com/things-to-do/westerncape/gardens-shopping-centre/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kloof-street-house-gardens', 'Kloof Street House',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '30 Kloof Street, Gardens, Cape Town', '021 423 4413', NULL, NULL,
  'Kloof Street House is a restaurant on Kloof Street set in a Victorian house with a large tree-shaded garden terrace, in Gardens.',
  NULL, NULL,
  '["https://www.kloofstreethouse.co.za/contact/", "https://insideguide.co.za/cape-town/restaurants/kloof-street-house/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kloof-street-house-gardens'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'our-local-gardens', 'Our Local',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '117 Kloof Street, Gardens, Cape Town', '064 642 5004', NULL, NULL,
  'Our Local is a Mediterranean-inspired restaurant on Kloof Street set inside a plant nursery and antique store, in Gardens.',
  NULL, NULL,
  '["https://www.tripadvisor.com/Restaurant_Review-g312659-d24145286-Reviews-Our_Local-Cape_Town_Central_Western_Cape.html", "https://insideguide.co.za/cape-town/restaurants/our-local/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'our-local-gardens'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cape-town-hollow-boutique-hotel-gardens', 'Cape Town Hollow Boutique Hotel',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '88 Queen Victoria Street, Gardens, Cape Town', '021 423 1260', NULL, NULL,
  'Cape Town Hollow Boutique Hotel is a boutique hotel opposite Company''s Garden and the National Gallery, in Gardens.',
  NULL, NULL,
  '["https://www.hotelplanner.com/Hotels/218934/Reservations-Cape-Town-Hollow-Boutique-Hotel-Cape-Town-88-Queen-Victoria-St-Gardens-8001", "https://www.capetownhollow.com/contact/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cape-town-hollow-boutique-hotel-gardens'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);
