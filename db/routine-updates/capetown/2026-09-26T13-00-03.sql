INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kalk-bay-books-kalk-bay', 'Kalk Bay Books',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  '62 Main Road, Kalk Bay, Cape Town, 7975', '021 788 2266', NULL, NULL,
  'Kalk Bay Books is an independent bookstore on Main Road, Kalk Bay.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/kalk-bay-books-243723", "https://www.sa-venues.com/things-to-do/westerncape/kalk-bay-books/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kalk-bay-books-kalk-bay'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'quagga-rare-books-and-art-kalk-bay', 'Quagga Rare Books & Art',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  '64 Main Road, Kalk Bay, Cape Town, 7975', '021 788 2752', 'https://quaggabooks.co.za', NULL,
  'Quagga Rare Books & Art is a dealer in rare and antiquarian books, art and collectables on Main Road, Kalk Bay.',
  NULL, NULL,
  '["https://quaggabooks.co.za/contact/", "https://www.cybo.com/ZA-biz/quagga-rare-books-and-art_1x"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'quagga-rare-books-and-art-kalk-bay'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-reef-kalk-bay', 'The Reef',
  (SELECT id FROM suburbs WHERE slug = 'kalk-bay'),
  '35 Main Road, Kalk Bay, Cape Town, 7975', '021 016 9782', NULL, NULL,
  'The Reef is a seafood restaurant on Main Road, Kalk Bay.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/The-Reef-Kalk-Bay/12046", "https://www.timeout.com/cape-town/restaurants/the-reef-kalk-bay"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-reef-kalk-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
