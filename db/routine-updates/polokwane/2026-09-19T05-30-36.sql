INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'absa-bank-polokwane-central', 'Absa Bank',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '70 Hans van Rensburg Street, Polokwane, 0700', '015 295 6165', NULL, NULL,
  'Absa is a South African bank offering personal and business banking, loans and transactional services, with a branch on Hans van Rensburg Street, Polokwane Central.',
  NULL, NULL,
  '["https://foursquare.com/v/absa/4ec600ba9a52756c53eeaeb7", "https://www.tiendeo.co.za/stores/polokwane/absa-bank-absa-forum-building-hans-van-rensburg-street-pietersburg-central/56348"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'absa-bank-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'capitec-bank-polokwane-central', 'Capitec Bank',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  'Shop 12, 101 Bok Street, Polokwane Central, Polokwane, 0700', '0860 102 043', NULL, NULL,
  'Capitec is South Africa''s largest retail bank by customer base, offering transactional accounts, savings, credit cards and personal loans, with a branch in Polokwane Central on Bok Street.',
  NULL, NULL,
  '["https://vymaps.com/ZA/Capitec-Bank-Polokwane-City-Centre-T165884/", "https://www.africabizinfo.com/ZA/capitec-bank-polokwane-city-centre-0860-102-043"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'capitec-bank-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'banks-atms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'oak-tree-flower-market-polokwane-central', 'Oak Tree Flower Market',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '102 Schoeman Street, Shop 3, Polokwane, 0700', '079 876 7343', NULL, NULL,
  'Oak Tree Flower Market is a florist offering fresh flower arrangements and floral services for weddings, funerals and other events, in Polokwane Central.',
  NULL, NULL,
  '["https://www.facebook.com/p/Oak-Tree-Flower-Market-Polokwane-100077211397782/", "https://www.onlineflowershop.co.za/florists/07286-polokwane/fccedfcccieddhadabi.htm"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'oak-tree-flower-market-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'florists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rays-florist-polokwane-central', 'Rays Florist',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '42a Grobler Street, Uhuru Lifestyle Emporium, Polokwane, 0700', '072 885 4748', NULL, NULL,
  'Rays Florist is a florist offering fresh flower arrangements and delivery for weddings, functions and other occasions, based at Uhuru Lifestyle Emporium, Polokwane Central.',
  NULL, NULL,
  '["https://raysflorist.co.za/", "https://www.instagram.com/raysflorist_sa/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rays-florist-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'florists'),
  1
);
