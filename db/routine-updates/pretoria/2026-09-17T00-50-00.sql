-- Hatfield: 3 new standalone businesses (bars/restaurants)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'aandklas-hatfield', 'Aandklas',
  (SELECT id FROM suburbs WHERE slug = 'hatfield'),
  '494 Hilda St, Hatfield, Pretoria, 0028', '012 362 3712', NULL, NULL,
  'Aandklas is a rock-and-roll themed pub and live-music venue in Hatfield, Pretoria.',
  NULL, NULL,
  '["https://za.readymap.info/8/27192", "https://za.near-place.com/aandklas-494-hilda-street-hatfield-pretoria"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'aandklas-hatfield'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cool-runnings-hatfield', 'Cool Runnings',
  (SELECT id FROM suburbs WHERE slug = 'hatfield'),
  '1071 Burnett Street, Hatfield, Pretoria, 0083', '012 362 0100', NULL, NULL,
  'Cool Runnings is a reggae and Rastafarian-themed pub and live-music venue in Hatfield, Pretoria.',
  NULL, NULL,
  '["https://vymaps.com/ZA/Cool-Runnings-Hatfield-T31132908/", "https://www.cylex.net.za/company/cool-runnings-cafe-hatfield-17512572.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cool-runnings-hatfield'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'zanzou-bar-lounge-hatfield', 'ZanZou Bar & Lounge',
  (SELECT id FROM suburbs WHERE slug = 'hatfield'),
  '525 Jan Shoba St, Hatfield, Pretoria, 0083', '012 364 5238', NULL, NULL,
  'ZanZou Bar & Lounge is a dance lounge and shisha bar in Hatfield, Pretoria.',
  NULL, NULL,
  '["https://www.waze.com/live-map/directions/za/gp/pretoria/zanzou-bar-and-lounge?to=place.ChIJJ7LXMuNhlR4RmX31I1KleOU", "https://www.cybo.com/ZA-biz/zanzou-bar-lounge"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'zanzou-bar-lounge-hatfield'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
