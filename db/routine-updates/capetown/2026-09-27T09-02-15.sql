INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'oakhurst-farmstall-kenilworth', 'Oakhurst Farmstall',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  '284A Main Road, Kenilworth, Cape Town', '+27 21 762 1827', NULL, NULL,
  'Oakhurst Farmstall is a farm stall, deli and coffee shop in Kenilworth offering fresh produce, baked goods and light meals, with a catering service on the side.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/oakhurst-farmstall-27098", "http://oakhurstfarmstallk.co.za/contact_us.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'oakhurst-farmstall-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hair-freedom-kenilworth', 'Hair Freedom',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  (SELECT id FROM shopping_centers WHERE slug = 'kenilworth-centre-kenilworth'),
  'Shop 43, Kenilworth Centre, Doncaster Road, Kenilworth, Cape Town, 7708', '021 671 4213', NULL, NULL,
  'Hair Freedom is a hair salon in Kenilworth Centre offering precision cuts, colour services including balayage, keratin treatments and specialist curl care.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/hair-freedom-227233", "https://kenilworthcentre.co.za/stores/store-list/hair-freedom/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hair-freedom-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sorbet-salon-kenilworth-on-main-kenilworth', 'Sorbet Salon Kenilworth on Main',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  'Shop G004, Pam Golding on Main, Corner Main Road & Summerley Road, Kenilworth, Cape Town', '+27 21 761 4576', NULL, NULL,
  'Sorbet Salon Kenilworth on Main is a beauty salon offering manicures, pedicures, massages, threading, tinting and waxing.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/sorbet-kenilworth-207307", "https://stores.salonssorbet.co.za/western-cape/cape-town/pam-golding-on-main-shop-g004"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sorbet-salon-kenilworth-on-main-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);
