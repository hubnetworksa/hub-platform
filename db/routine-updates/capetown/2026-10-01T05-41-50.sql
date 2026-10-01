INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-bianca-barron-steenberg', 'Dr Bianca Barron',
  (SELECT id FROM suburbs WHERE slug = 'steenberg'),
  'Shop 1B, Foodprop Centre, 545 Military Road, Steenberg, Cape Town, 7945', '021 701 7024', NULL, NULL,
  'Dr Bianca Barron is a general practitioner''s medical practice in Steenberg, offering GP consultations.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=222835", "https://www.xpose.co.za/listings/dr-bianca-barron-shop-no-1b-foodprop-centre-steenberg/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-bianca-barron-steenberg'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-m-s-jassiem-steenberg', 'Dr M S Jassiem',
  (SELECT id FROM suburbs WHERE slug = 'steenberg'),
  '541 Military Road, Steenberg, Cape Town, 7945', '021 701 5873', NULL, NULL,
  'Dr M S Jassiem is a general practitioner''s medical practice in Steenberg, offering GP consultations.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=49425", "https://meditrader.co.za/dr-m-s-jassiem-general-practitioner-steenberg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-m-s-jassiem-steenberg'),
  (SELECT id FROM categories WHERE slug = 'doctors-gps'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  '1up-cash-and-carry-steenberg', '1UP Cash & Carry',
  (SELECT id FROM suburbs WHERE slug = 'steenberg'),
  'Cnr Military Road & Coniston Avenue, Steenberg, Cape Town, 7945', '021 701 1391', NULL, NULL,
  '1UP Cash & Carry is a wholesale and retail food and non-food store in Steenberg, serving individual shoppers and small businesses.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/steenberg/1up-cash-and-carry/cnr-military-cornistan-avenue", "https://za.africabz.com/western-cape/1up-cash-carry-steenberg-367142"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '1up-cash-and-carry-steenberg'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
