INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-welgemoed-guesthouse-welgemoed', 'The Welgemoed Guesthouse',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  '79 Kommissaris Street, Welgemoed, Cape Town, 7530', '021 913 2690', 'https://www.thewelgemoedguesthouse.co.za', NULL,
  'The Welgemoed Guesthouse is a guest house on Kommissaris Street, Welgemoed.',
  NULL, NULL,
  '["https://www.thewelgemoedguesthouse.co.za/", "https://www.lekkeslaap.co.za/accommodation/the-welgemoed-guest-house"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-welgemoed-guesthouse-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-z-oliver-welgemoed', 'Dr Z Oliver',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  '36 Kommissaris Street, Welgemoed, Cape Town, 7530', '021 913 3480', 'http://www.zolivertandarts.co.za', NULL,
  'Dr Z Oliver is a dental practice on Kommissaris Street, Welgemoed.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/bellville/welgemoed/dentists/dr-z-oliver", "https://www.meditrader.co.za/dr-z-oliver-dentist-dental-surgeon-welgemoed-western-cape"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-z-oliver-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-c-podges-incorporated-welgemoed', 'Dr C Podges Incorporated',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  '25 Sluysken Street, Welgemoed, Cape Town, 7530', '021 493 3633', 'https://cpdental.co.za', NULL,
  'Dr C Podges Incorporated is a dental practice on Sluysken Street, Welgemoed.',
  NULL, NULL,
  '["https://cpdental.co.za/", "https://www.recomed.co.za/dentist/western-cape/dr-c-podges-incorporated/46724/56614/?service=51"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-c-podges-incorporated-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
