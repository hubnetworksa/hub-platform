INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'g-e-m-boxing-and-fitness-lyttelton-manor', 'G.E.M Boxing & Fitness',
  (SELECT id FROM suburbs WHERE slug = 'lyttelton-manor'),
  '262 Cradock Ave, Lyttelton Manor, Centurion, 0157', '076 882 5272', NULL, NULL,
  'G.E.M Boxing & Fitness is a boxing and bootcamp-style fitness studio on Cradock Avenue in Lyttelton Manor, Centurion, offering personal training, group boxing classes and conditioning sessions.',
  NULL, NULL,
  '["https://pretoria.co.za/place/gem-boxing-and-fitness-1", "https://www.waze.com/live-map/directions/za/gp/pretoria/g.e.m-boxing-and-fitness?to=place.ChIJhYhyAhBllR4RrDxL21QVpZA"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'g-e-m-boxing-and-fitness-lyttelton-manor'),
  (SELECT id FROM categories WHERE slug = 'fitness-gyms'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mega-paints-and-hardware-lyttelton-lyttelton-manor', 'Mega Paints and Hardware Lyttelton',
  (SELECT id FROM suburbs WHERE slug = 'lyttelton-manor'),
  'Shop 1C, Lyttelton Commercial Park, 27 Botha Ave, Lyttelton Manor, Centurion, 0157', '012 664 0075', NULL, NULL,
  'Mega Paints and Hardware Lyttelton is a paint and hardware shop stocking tools and building supplies, in Lyttelton Commercial Park on Botha Avenue, Lyttelton Manor, Centurion, open weekdays from 7am to 4:30pm.',
  NULL, NULL,
  '["https://pretoria.co.za/place/mega-paints-and-hardware-lyttelton", "https://showme.co.za/pretoria/industry/construction-diy/mega-paints-centurion/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mega-paints-and-hardware-lyttelton-lyttelton-manor'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-lyttelton-2-lyttelton-manor', 'Clicks Lyttelton 2',
  (SELECT id FROM suburbs WHERE slug = 'lyttelton-manor'),
  (SELECT id FROM shopping_centers WHERE slug = 'lyttelton-shopping-centre-lyttelton-manor'),
  'Cnr Cantonments Rd & Botha Ave, Lyttelton Manor, Centurion, 0157', '012 644 1961', NULL, NULL,
  'Clicks Lyttelton 2 is a branch of the Clicks pharmacy and health and beauty retail chain, in the Lyttelton Shopping Centre on the corner of Cantonments Road and Botha Avenue, Lyttelton Manor, Centurion, open daily from 8am to 6pm.',
  NULL, NULL,
  '["https://pretoria.co.za/listing/clicks-lyttelton-2/", "https://clicks.co.za/store/Lyttelton-2/1990"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-lyttelton-2-lyttelton-manor'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
