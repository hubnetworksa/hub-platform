INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'belvedere-folly-oranjezicht', 'Belvedere Folly',
  (SELECT id FROM suburbs WHERE slug = 'oranjezicht'),
  '43 Belvedere Avenue, Oranjezicht, Cape Town, 8001', '082 579 3987', 'https://thefolly.co.za/', 'belvederefolly@gmail.com',
  'Belvedere Folly is guesthouse accommodation on Belvedere Avenue in Oranjezicht, set in a 1920s-revamped Victorian building with Romanesque arches and Art Deco features on its facade.',
  NULL, NULL,
  '["https://thefolly.co.za/about/", "https://www.hotelplanner.com/Hotels/311405/Reservations-Belvedere-Folly-Cape-Town-43-Belvedere-Ave-8001"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'belvedere-folly-oranjezicht'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'oranjezicht-yoga-centre-oranjezicht', 'The Oranjezicht Yoga Centre',
  (SELECT id FROM suburbs WHERE slug = 'oranjezicht'),
  '7 Cairnmount Avenue, Oranjezicht, Cape Town, 8001', '083 442 7261', 'https://yogacentre.co.za/', NULL,
  'The Oranjezicht Yoga Centre is a small, intimate yoga studio on Cairnmount Avenue in Oranjezicht that has offered classical yoga classes since 1999.',
  NULL, NULL,
  '["https://yogacentre.co.za/", "https://www.localgymsandfitness.com/ZA/Cape-Town/347997118987682/The-Oranjezicht-Yoga-Centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'oranjezicht-yoga-centre-oranjezicht'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);
