INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'red-sofa-cafe-vredehoek', 'Red Sofa Cafe',
  (SELECT id FROM suburbs WHERE slug = 'vredehoek'),
  '21 Derry Street, Vredehoek, Cape Town', '021 461 7274', 'http://www.redsofacafe.co.za/', NULL,
  'Red Sofa Cafe is a coffee shop and cafe on the corner of Derry and Exner Streets, in Vredehoek.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/red-sofa-cafe/409633", "https://www.redsofacafe.co.za/our-story.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'red-sofa-cafe-vredehoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'deer-park-cafe-vredehoek', 'Deer Park Cafe',
  (SELECT id FROM suburbs WHERE slug = 'vredehoek'),
  '2 Deer Park Drive, Vredehoek, Cape Town', '083 265 6630', 'https://deerparkcafe.co.za/', NULL,
  'Deer Park Cafe is a neighbourhood cafe on the upper slopes of Vredehoek, just below the Deer Park gateway into the Table Mountain reserve.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/deer-park-cafe-and-deli-3098", "https://www.facebook.com/deerpark.cafe/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'deer-park-cafe-vredehoek'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kwikspar-vredehoek', 'KwikSpar Vredehoek',
  (SELECT id FROM suburbs WHERE slug = 'vredehoek'),
  '37 Derry Street, Vredehoek, Cape Town', '021 461 4455', NULL, NULL,
  'KwikSpar Vredehoek is a neighbourhood supermarket on Derry Street, in Vredehoek.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/kwikspar-10027", "https://www.thinklocal.co.za/biz/kwikspar-vredehoek-vredehoek"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kwikspar-vredehoek'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
