INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'kameeldrift-shopping-centre-kameeldrift-east', 'Kameeldrift Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'kameeldrift-east'),
  '210 Kameeldrift Rd, Kameeldrift East, Pretoria, 0035', NULL, NULL,
  '["https://www.waze.com/live-map/directions/kameeldrift-shopping-centre-kameeldrift-rd-210-kameeldrift-east,-pretoria", "https://www.fresha.com/lvp/bosveld-salon-barber-kameeldrift-road-pretoria-BovBJ2"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'retro-cafe-motel-kameeldrift-east', 'Retro Cafe & Motel',
  (SELECT id FROM suburbs WHERE slug = 'kameeldrift-east'),
  'Plot 180 Ringduif Crescent, Zeekoegat, Kameeldrift East, Pretoria, 0035', '082 850 3291', 'http://www.retrocafe.co.za', NULL,
  'Retro Cafe & Motel is a 1950s-themed cafe, motel and wedding/function venue in Kameeldrift East, Pretoria.',
  NULL, NULL,
  '["https://www.sa-venues.com/visit/retrocafe/", "https://www.sleeping-out.co.za/md/Retro-Cafe-Motel/39914", "https://www.accommodationswap.com/new%20table%20look%20master%20file/retro_cafe.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'retro-cafe-motel-kameeldrift-east'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bietjieplaas-kameeldrift-east', 'BietjiePlaas',
  (SELECT id FROM suburbs WHERE slug = 'kameeldrift-east'),
  'Plot 219 Lalapalm St, Kameeldrift East, Pretoria, 0035', '082 822 8930', NULL, NULL,
  'BietjiePlaas is a self-catering guesthouse in Kameeldrift East, Pretoria, close to the Roodeplaat Dam.',
  NULL, NULL,
  '["https://www.hotelplanner.com/Hotels/298641/Reservations-Bietjieplaas-Pretoria-Plot-219-Lalapalm-St-Kameeldrift-East-Pretoria-0035", "https://www.sa-venues.com/visit/bietjieplaas/", "https://www.facebook.com/219Lalapalm/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bietjieplaas-kameeldrift-east'),
  (SELECT id FROM categories WHERE slug = 'accommodation'),
  1
);
