INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bobos-brasserie-mouille-point', "Bobo's Brasserie",
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  'No 1 Two Oceans Beach, Bay Road, Mouille Point, Cape Town, 8001', '021 439 9027', NULL, NULL,
  "Bobo's Brasserie is a French-influenced restaurant on the Mouille Point promenade with sea views, on the site of the former Pepenero.",
  NULL, NULL,
  '["https://crushmag-online.com/bobos-brasserie-mouille-point/", "https://www.eatout.co.za/venue/bobos-brasserie/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bobos-brasserie-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-hussar-grill-mouille-point', 'The Hussar Grill',
  (SELECT id FROM suburbs WHERE slug = 'mouille-point'),
  '163 Beach Road, New Cumberland Building, Mouille Point, Cape Town', '021 433 2081', NULL, NULL,
  'The Hussar Grill is a steakhouse restaurant in the New Cumberland Building on Beach Road, Mouille Point, part of a long-running South African steakhouse chain.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d1020422-Reviews-The_Hussar_Grill_Mouille_Point-Cape_Town_Central_Western_Cape.html", "https://www.eatout.co.za/venue/hussar-grill-mouille-point/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-hussar-grill-mouille-point'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
