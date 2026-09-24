INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'faeezas-home-kitchen-bo-kaap', 'Faeeza''s Home Kitchen',
  (SELECT id FROM suburbs WHERE slug = 'bo-kaap'),
  '1 Chiappini Lane, Bo-Kaap, Cape Town', '072 120 3710', 'https://faeezashomekitchen.com', 'bookings@faeezashomekitchen.com',
  'Faeeza''s Home Kitchen is a Cape Malay cooking school and catering venue on Chiappini Lane in Bo-Kaap, running cooking classes, dinners and events.',
  NULL, NULL,
  '["https://faeezashomekitchen.com/contact-us/", "https://www.capetownetc.com/things-to-do-cape-town/get-cooking-at-faeezas-home-kitchen-in-the-bo-kaap/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'faeezas-home-kitchen-bo-kaap'),
  (SELECT id FROM categories WHERE slug = 'catering'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rose-lodge-bo-kaap', 'Rose Lodge',
  (SELECT id FROM suburbs WHERE slug = 'bo-kaap'),
  '91 Wale Street, Bo-Kaap, Cape Town', '021 424 3813', NULL, NULL,
  'Rose Lodge is a three-room guesthouse on Wale Street in Bo-Kaap, each room with a private bathroom, serving a self-serve continental breakfast.',
  NULL, NULL,
  '["https://www.sa-venues.com/visit/roselodge/", "https://bokaap.org/rose-lodge/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rose-lodge-bo-kaap'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rouge-on-rose-bo-kaap', 'Rouge on Rose Boutique Hotel',
  (SELECT id FROM suburbs WHERE slug = 'bo-kaap'),
  '25 Rose Street, Bo-Kaap, Cape Town', '021 426 0298', 'https://www.rougeonrose.co.za', NULL,
  'Rouge on Rose Boutique Hotel is a nine-suite boutique hotel on Rose Street in Bo-Kaap, open since 2008, offering a complimentary breakfast.',
  NULL, NULL,
  '["https://www.rougeonrose.co.za/bo-kaap-bed-and-breakfast/", "https://www.sa-venues.com/visit/rougeonrose/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rouge-on-rose-bo-kaap'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
