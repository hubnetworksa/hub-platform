INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rocomamas-rondebosch-rondebosch', 'RocoMamas Rondebosch',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverside-mall-rondebosch'),
  'Shop 37, Riverside Mall, Main Road, Rondebosch, Cape Town, 7700', '021 207 7222', NULL, NULL,
  'RocoMamas Rondebosch is a burger and ribs restaurant in Riverside Mall, Rondebosch.',
  NULL, NULL,
  '["https://rocomamas.com/za/restaurants/western-cape/rocomamas-rondebosch", "https://restaurantguru.com/RocoMamas-Cape-Town-7"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'rocomamas-rondebosch-rondebosch'), (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'), 1);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'luitingh-and-associates-rondebosch-rondebosch', 'Luitingh & Associates (Rondebosch)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  'Suite 5, Athos Chambers, cnr Campground Road & Austwick Avenue, Rondebosch, Cape Town, 7700', '021 686 3452', 'https://www.luitingh.com', NULL,
  'Luitingh & Associates is a law firm with a Rondebosch office, in Rondebosch.',
  NULL, NULL,
  '["https://www.luitingh.com/", "https://www.attorneys.co.za/CompanyHomePage.asp?CompanyID=298"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'luitingh-and-associates-rondebosch-rondebosch'), (SELECT id FROM categories WHERE slug = 'attorneys-legal'), 1);
INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rondebosch-medical-centre-rondebosch', 'Rondebosch Medical Centre',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  '85 Klipfontein Road, Rondebosch, Cape Town, 7700', '021 680 5920', 'https://rondeboschmedicalcenter.co.za', NULL,
  'Rondebosch Medical Centre is a private hospital with a 24-hour accident and emergency unit, in Rondebosch.',
  NULL, NULL,
  '["https://rondeboschmedicalcenter.co.za/Contact.html", "https://www.africahealthcare.co.za/hospitals/rondebosch-medical-centre/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES ((SELECT id FROM businesses WHERE slug = 'rondebosch-medical-centre-rondebosch'), (SELECT id FROM categories WHERE slug = 'clinics-healthcare'), 1);
