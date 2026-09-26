INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'excentric-hair-artists-gardens', 'Excentric Hair Artists',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '39 Kloof Street, Gardens, Cape Town, 8001', '021 036 1171', NULL, NULL,
  'Excentric Hair Artists is a hair salon on Kloof Street, in Gardens.',
  NULL, NULL,
  '["https://www.excentric-hair.co.za/contact-us", "https://www.capetownetc.com/things-to-do-cape-town/excentric-hair-salon/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'excentric-hair-artists-gardens'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kiosk-gardens', 'Kiosk',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  '15 Kloof Nek Road, Gardens, Cape Town, 8001', '072 585 6016', NULL, NULL,
  'Kiosk is a café, deli and convenience store on Kloof Nek Road, in Gardens.',
  NULL, NULL,
  '["https://www.kioskcommunity.com/contact", "https://www.allyoursco.com/kiosk"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kiosk-gardens'),
  (SELECT id FROM categories WHERE slug = 'convenience-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-lifestyle-on-kloof-gardens', 'Clicks Pharmacy Lifestyle on Kloof',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'lifestyle-on-kloof-gardens'),
  'Lifestyle on Kloof Centre, 50 Kloof Street, Gardens, Cape Town, 8001', '021 488 8300', NULL, NULL,
  'Clicks Pharmacy Lifestyle on Kloof is a pharmacy and health and beauty retailer at Lifestyle on Kloof in Gardens.',
  NULL, NULL,
  '["https://clicks.co.za/store/Clicks-Pharmacy-Lifestyle-on-Kloof/2212", "https://www.goafricaonline.com/za/1222647-clicks-pharmacy-lifestyle-on-kloof"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-lifestyle-on-kloof-gardens'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-lifestyle-on-kloof-gardens', 'Woolworths',
  (SELECT id FROM suburbs WHERE slug = 'gardens'),
  (SELECT id FROM shopping_centers WHERE slug = 'lifestyle-on-kloof-gardens'),
  'LifeStyle Centre, 50 Kloof Street, Gardens, Cape Town, 8001', '021 480 3111', NULL, NULL,
  'Woolworths is a food market at Lifestyle on Kloof in Gardens.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/woolworths/lifestyle-centre-50-kloof-st", "https://www.gps-data-team.com/where/south_africa/store_locator/Woolworths-ZA/Woolworths-Kloof-Street.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-lifestyle-on-kloof-gardens'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
