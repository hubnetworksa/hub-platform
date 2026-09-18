-- Jobs 1-2: three-anchor-bay suburb research (3 new businesses)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'step-brothers-restaurant-bar-three-anchor-bay', 'Step Brothers Restaurant & Bar',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '6 Bill Peters Drive, Three Anchor Bay, Cape Town', '021 569 0153', 'https://www.stepbrothers.co.za/', NULL,
  'Step Brothers Restaurant & Bar is a restaurant and bar in Three Anchor Bay.',
  NULL, NULL,
  '["https://www.restaurants10.com/ZA/Cape-Town/294186254279330/Step-Brothers-Restaurant-&-Bar", "https://www.stepbrothers.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'step-brothers-restaurant-bar-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shift-espresso-bar-three-anchor-bay', 'Shift Espresso Bar',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '229 Main Road, Three Anchor Bay, Cape Town, 8005', '+27 63 238 0112', 'https://www.shiftespresso.com/', NULL,
  'Shift Espresso Bar is a coffee shop in the Glengariff building in Three Anchor Bay, a short walk from the Sea Point Promenade.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/shift-espresso-bar-glengariff-57942", "https://www.eatout.co.za/venue/shift-espresso-bar/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shift-espresso-bar-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-eatery-at-antrim-house-three-anchor-bay', 'The Eatery at Antrim House',
  (SELECT id FROM suburbs WHERE slug = 'three-anchor-bay'),
  '23 Antrim Road, Three Anchor Bay, Cape Town', '021 433 2132', 'https://www.antrimcollection.com/the-eatery-at-antrim-house/', NULL,
  'The Eatery at Antrim House is a bistro-style restaurant serving buffet and burger fare in Three Anchor Bay.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/eatery-antrim-house/", "https://www.antrimcollection.com/the-eatery-at-antrim-house/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-eatery-at-antrim-house-three-anchor-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
