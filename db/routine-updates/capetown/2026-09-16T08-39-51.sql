-- Tamboerskloof: job 1/2 research checkpoint

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cafe-puka-tamboerskloof', 'Cafe Puka',
  (SELECT id FROM suburbs WHERE slug = 'tamboerskloof'),
  'Cnr Brunswick & Tamboerskloof Roads, Tamboerskloof', '021 423 6715', NULL, NULL,
  'Cafe Puka is a neighbourhood cafe known for its all-day breakfasts and lunches, in Tamboerskloof.',
  NULL, NULL,
  '["https://nearbyza.com/place/cafe-puka-1", "http://www.cafepuka.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cafe-puka-tamboerskloof'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dinkel-bakery-tamboerskloof', 'Dinkel Bakery',
  (SELECT id FROM suburbs WHERE slug = 'tamboerskloof'),
  '91 Kloof Nek Road, Tamboerskloof', '021 424 3217', NULL, NULL,
  'Dinkel Bakery is a German-style bakery and cafe on Kloof Nek Road popular with hikers heading up to Table Mountain, in Tamboerskloof.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/15650495_2", "https://za.africabz.com/western-cape/dinkel-bakery-27538"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dinkel-bakery-tamboerskloof'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-cape-milner-tamboerskloof', 'The Cape Milner',
  (SELECT id FROM suburbs WHERE slug = 'tamboerskloof'),
  '2a Milner Road, Tamboerskloof, Cape Town', '021 426 1101', NULL, NULL,
  'The Cape Milner is a hotel on Milner Road offering rooftop city and mountain views, in Tamboerskloof.',
  NULL, NULL,
  '["https://capemilner.com/contact/", "https://www.meetings-conventions.com/Meeting-Event-Venues/Tamboerskloof-South-Africa/Convention-Hotel/The-Cape-Milner-p2494518"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-cape-milner-tamboerskloof'),
  (SELECT id FROM categories WHERE slug = 'hotels'),
  1
);
