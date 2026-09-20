INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kwikspar-strandfontein-strandfontein', 'KWIKSPAR Strandfontein',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  'Corner Wavecrest Avenue & Benguela Avenue, Strandfontein, Cape Town, 7798', '021 205 3786', NULL, NULL,
  'KWIKSPAR Strandfontein is a Halaal-certified supermarket at the corner of Wavecrest and Benguela Avenues in Strandfontein, selling groceries and everyday essentials.',
  NULL, NULL,
  '["https://www.spar.co.za/Home/Store-View/KWIKSPAR-Strandfontein-Western-Cape", "https://za.africabz.com/western-cape/strandfontein-spar-329021"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kwikspar-strandfontein-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'strandfontein-post-office-strandfontein', 'Strandfontein Post Office',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  'Corner Benguela Street & Wave Singel, Strandfontein, Cape Town, 7798', '021 393 2542', NULL, NULL,
  'Strandfontein Post Office is a South African Post Office branch on the corner of Benguela Street and Wave Singel in Strandfontein, offering postal, mail, and parcel services.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/south-african-post-office-sapo-strandfontein-in-strandfontein", "https://www.blaauwberg.net/south-african-post-offices/1285/strandfontein-post-office", "https://postaldb.net/en/south-africa/post-office/view/1296"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'strandfontein-post-office-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lekker-dite-strandfontein', 'Lekker Dite',
  (SELECT id FROM suburbs WHERE slug = 'strandfontein'),
  '160 Dennegeur Avenue, Strandfontein, Cape Town, 7798', '079 010 4771', NULL, NULL,
  'Lekker Dite is a Halaal takeaway on Dennegeur Avenue in Strandfontein known for its Cape-style Gatsby sandwiches and other local street food.',
  NULL, NULL,
  '["https://hungryforhalaal.co.za/listing/lekker-dite-strandfontein/", "https://za.africabz.com/western-cape/lekker-dite-279666"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lekker-dite-strandfontein'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
