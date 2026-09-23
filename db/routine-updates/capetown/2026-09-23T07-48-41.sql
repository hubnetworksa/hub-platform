INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'opulence-events-function-venue-philippi-horticultural', 'Opulence Events & Function Venue',
  (SELECT id FROM suburbs WHERE slug = 'philippi-horticultural'),
  '8 4th Avenue, Schaap Road, Schaapkraal, Philippi Horticultural Area, Cape Town, 7941', '079 580 9442', NULL, NULL,
  'Opulence Events & Function Venue is a function and events venue in Schaapkraal, Philippi Horticultural Area.',
  NULL, NULL,
  '["https://www.facebook.com/opulenceFV/", "https://www.waze.com/live-map/directions/za/wc/cape-town/opulence-function-venue"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'opulence-events-function-venue-philippi-horticultural'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'chamomile-farming-philippi-horticultural', 'Chamomile Farming',
  (SELECT id FROM suburbs WHERE slug = 'philippi-horticultural'),
  'Corner of Boom and Middel Avenue, Schaap Road, Schaapkraal, Philippi Horticultural Area, Cape Town, 8000', '073 714 3377', NULL, NULL,
  'Chamomile Farming is a family-run vegetable and egg-laying farm in Schaapkraal, Philippi Horticultural Area, established in 2003.',
  NULL, NULL,
  '["https://chamomilefarming.co.za/", "https://www.facebook.com/chamomilefarmingsa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'chamomile-farming-philippi-horticultural'),
  (SELECT id FROM categories WHERE slug = 'agricultural-farming-supplies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sunrise-farm-philippi-horticultural', 'Sunrise Farm',
  (SELECT id FROM suburbs WHERE slug = 'philippi-horticultural'),
  '745 Kraal Road, Schaapkraal, Philippi Horticultural Area, Cape Town, 7941', '021 703 3823', NULL, NULL,
  'Sunrise Farm is a livestock farm and slaughtering, cutting and packaging facility in Schaapkraal, Philippi Horticultural Area, established in 1987.',
  NULL, NULL,
  '["https://www.sunrisefarmlivestock.com/", "https://www.thinklocal.co.za/biz/sunrise-farm-philippi"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sunrise-farm-philippi-horticultural'),
  (SELECT id FROM categories WHERE slug = 'butcheries'),
  1
);
