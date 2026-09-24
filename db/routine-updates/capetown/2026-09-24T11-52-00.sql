INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'maartens-guesthouse-fresnaye', 'Maartens Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'fresnaye'),
  '39 Avenue Normandie, Fresnaye, Cape Town, 8005', '083 772 9102', NULL, NULL,
  'Maartens Guesthouse is an owner-run four-star guest house, in Fresnaye.',
  NULL, NULL,
  '["https://www.maartens.co.za/contact/contact-us/", "https://www.sa-venues.com/visit/maartensguesthouse/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'maartens-guesthouse-fresnaye'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-walden-suites-fresnaye', 'The Walden Suites',
  (SELECT id FROM suburbs WHERE slug = 'fresnaye'),
  '12 Bellwood Road, Fresnaye, Cape Town, 8005', '021 434 7511', NULL, NULL,
  'The Walden Suites is a boutique bed and breakfast, in Fresnaye.',
  NULL, NULL,
  '["https://www.walden.co.za/", "https://www.tripadvisor.com/Hotel_Review-g1233430-d1510642-Reviews-The_Walden_Suites-Fresnaye_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-walden-suites-fresnaye'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
