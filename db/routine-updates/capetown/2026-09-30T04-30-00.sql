INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'fairbridge-mall-brackenfell', 'Fairbridge Mall',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Cnr Old Paarl Road & Brackenfell Boulevard, Brackenfell, 7560', NULL, NULL,
  '["https://www.bizcommunity.com/Article/196/182/213423.html", "https://my-catalogue.co.za/stores/brackenfell/checkers/fairbridge-mall-cnr-old-paarl-road-brackenfell-boulevard"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-hyper-fairbridge-mall-brackenfell', 'Checkers Hyper Fairbridge Mall',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'fairbridge-mall-brackenfell'),
  'Fairbridge Mall, Cnr Old Paarl Road & Brackenfell Boulevard, Brackenfell, 7560', '021 980 8400', NULL, NULL,
  'Checkers Hyper Fairbridge Mall is a large supermarket inside Fairbridge Mall in Brackenfell, revamped with a food truck, party shop and pet shop.',
  NULL, NULL,
  '["https://www.bizcommunity.com/Article/196/182/213423.html", "https://www.tiendeo.co.za/stores/brackenfell/checkers-hyper-fairbridge-mall-cnr-old-paarl-road/53798"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-hyper-fairbridge-mall-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'medirite-pharmacy-fairbridge-mall-brackenfell', 'Medirite Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'fairbridge-mall-brackenfell'),
  'Shop 82, Fairbridge Mall, Old Paarl Road, Brackenfell, 7560', '021 982 2650', 'http://www.medirite.co.za', NULL,
  'Medirite Pharmacy is a retail pharmacy inside Fairbridge Mall in Brackenfell, part of the Medirite network operating within Checkers and Shoprite supermarkets.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=149055", "https://www.tiendeo.co.za/stores/brackenfell/medirite-fairbridge-mall-old-paarl-road/6035"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'medirite-pharmacy-fairbridge-mall-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'brackenfell-dental-brackenfell', 'Brackenfell Dental',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Suite 3, Brackenfell Medical Centre, Brackenfell Boulevard & Old Paarl Road, Brackenfell, 7560', '021 981 2934', 'https://brackenfelldental.co.za/', NULL,
  'Brackenfell Dental is a family dentistry practice at Brackenfell Medical Centre, on the corner of Brackenfell Boulevard and Old Paarl Road.',
  NULL, NULL,
  '["https://brackenfelldental.co.za/", "https://www.cylex.net.za/brackenfell/dentist.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'brackenfell-dental-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'essential-dental-brackenfell', 'Essential Dental',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Shop 2, Essential Health Building, Cnr Old Paarl Road & Jeanette Street, Brackenfell', '021 020 1057', 'http://www.essentialdental.online', NULL,
  'Essential Dental is a family dentistry practice inside the Essential Health Building on the corner of Old Paarl Road and Jeanette Street in Brackenfell.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=216567", "https://vymaps.com/ZA/Essential-Dental-100546271340087/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'essential-dental-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'essential-health-pharmacy-brackenfell', 'Essential Health Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  'Essential Health Building, Cnr Old Paarl Road & Jeanette Street, Springbokpark, Brackenfell, 7560', '021 981 1824', 'https://essentialhealth.co.za/pages/brackenfell-contact-page', NULL,
  'Essential Health Pharmacy is a retail pharmacy at the Essential Health Building on Old Paarl Road in Brackenfell, part of the Essential Health Pharmacy Group.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=86790", "https://essentialhealth.co.za/pages/brackenfell-contact-page"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'essential-health-pharmacy-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dental-wize-brackenfell', 'Dental Wize',
  (SELECT id FROM suburbs WHERE slug = 'brackenfell'),
  (SELECT id FROM shopping_centers WHERE slug = 'glengarry-shopping-centre-brackenfell'),
  'Office 1, Upper Level, Glengarry Shopping Centre, Cnr Fairtrees Road & De Bron Road, Brackenfell, 7560', '021 982 7111', NULL, NULL,
  'Dental Wize is a dentistry practice on the upper level of Glengarry Shopping Centre in Brackenfell.',
  NULL, NULL,
  '["https://sabusinesslistings.co.za/listings/dental-wize-de-manielle-f-j-and-du-toit-s/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=394699"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dental-wize-brackenfell'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
