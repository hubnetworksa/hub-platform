INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'roamwork-zonnebloem', 'Roamwork',
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  '2nd Floor, The Harrington, 50 Harrington Street, Zonnebloem, Cape Town, 7925', '021 300 6677', 'https://roam.work/', NULL,
  'Roamwork is a serviced coworking space with private offices, meeting rooms and event space, in Zonnebloem.',
  NULL, NULL,
  '["https://za.polomap.com/cape-town/159185", "https://www.wesgro.co.za/long-stay/work/roam-work-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'roamwork-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'commercial-property-office-space'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'vintage-with-love-zonnebloem', 'Vintage with Love',
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  '46A Canterbury Street, Zonnebloem, Cape Town, 7925', '083 997 5767', 'https://www.vintagewithlove.co.za', NULL,
  'Vintage with Love is a secondhand and vintage clothing store whose proceeds support a South African literacy initiative, in Zonnebloem.',
  NULL, NULL,
  '["https://www.vintagewithlove.co.za/retailstore", "https://wanderlog.com/place/details/9587314/vintage-with-love"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'vintage-with-love-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'swan-cafe-zonnebloem', 'Swan Cafe',
  (SELECT id FROM suburbs WHERE slug = 'zonnebloem'),
  'Corner Buitenkant and Barrack Street, Zonnebloem, Cape Town', '079 454 4758', 'https://swancafe.co.za', NULL,
  'Swan Cafe is a French-style creperie and coffee shop on the corner of Buitenkant and Barrack Street, in Zonnebloem.',
  NULL, NULL,
  '["https://swancafe.co.za/", "https://www.eatout.co.za/venue/swan-cafe/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'swan-cafe-zonnebloem'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
