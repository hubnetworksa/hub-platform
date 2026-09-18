INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'cape-quarter-de-waterkant', 'Cape Quarter Lifestyle Village',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  '27 Somerset Road, De Waterkant, Cape Town', NULL, NULL,
  '["https://capequarter.co.za/about/", "https://www.sa-venues.com/things-to-do/westerncape/cape-quarter/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'riva-de-waterkant', 'Riva',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  '24 Napier Street, De Waterkant, Cape Town', '021 418 0657', NULL, NULL,
  'Riva is an Italian fish restaurant on Napier Street, in De Waterkant.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/riva-italian-fish-restaurant/", "https://www.tripadvisor.co.za/Restaurant_Review-g312659-d14992034-Reviews-Riva_Italian_Fish_Restaurant-Cape_Town_Central_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'riva-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'ground-art-caffe-de-waterkant', 'Ground Art Caffe',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  '160 Strand Street, De Waterkant, Cape Town', '021 418 1331', NULL, NULL,
  'Ground Art Caffe is a coffee shop and art gallery on Strand Street, in De Waterkant.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/ground-art-caffe-1419", "https://insideguide.co.za/cape-town/restaurants/ground-art-caffe/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'ground-art-caffe-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lume-beauty-atelier-de-waterkant', 'Lume Beauty Atelier',
  (SELECT id FROM suburbs WHERE slug = 'de-waterkant'),
  '40 Chiappini Street, De Waterkant, Cape Town', '021 286 1201', NULL, NULL,
  'Lume Beauty Atelier is a beauty spa and salon on Chiappini Street, in De Waterkant.',
  NULL, NULL,
  '["https://www.africabizinfo.com/ZA/lume-beauty-atelier", "https://www.capetownmagazine.com/lume-beauty-atelier"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lume-beauty-atelier-de-waterkant'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);
