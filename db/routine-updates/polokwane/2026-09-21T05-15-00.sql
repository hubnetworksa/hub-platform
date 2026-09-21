INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'eskulaap-hotel-polokwane-central', 'Eskulaap Hotel',
  (SELECT id FROM suburbs WHERE slug = 'polokwane-central'),
  '54 Rissik Street, Polokwane, 0700', '015 297 3288', 'https://www.eskulaap.co.za/', 'admin@eskulaap.co.za',
  'Eskulaap Hotel is a hotel and conference venue set in a hectare of landscaped gardens in central Polokwane, offering rooms and an outdoor pool.',
  NULL, NULL,
  '["https://www.eskulaap.co.za/", "https://www.yellosa.co.za/company/168625/eskulaap-park"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'eskulaap-hotel-polokwane-central'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  '77-on-burger-hospark', '77 On Burger',
  (SELECT id FROM suburbs WHERE slug = 'hospark'),
  '77B Burger Street, Hospital Park, Polokwane, 0699', '015 297 6634', NULL, NULL,
  '77 On Burger is a self-catering apartment offering guest accommodation on Burger Street, Hospital Park.',
  NULL, NULL,
  '["https://www.booking.com/hotel/za/77-on-burger.html", "https://bnbfinder.co.za/places/77-on-burger-apartments/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = '77-on-burger-hospark'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
