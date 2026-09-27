INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'midville-centre-durbanville', 'Midville Centre',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  '13 Wellington Road (Cnr Wellington & Oxford Street), Durbanville, 7550', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/checkers-midville-centre.html", "https://my-catalogue.co.za/stores/cape-town/checkers/13-wellington-rd"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'graanendal-shopping-centre-durbanville', 'Graanendal Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  'Cnr Brackenfell Boulevard & Bergrivier Street, Durbanville, 7550', NULL, NULL,
  '["https://www.graanendal.co.za/", "https://www.facebook.com/Graanendalcentre/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tosca-salon-durbanville-durbanville', 'Tosca Salon Durbanville',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'midville-centre-durbanville'),
  'Shop 8, Midville Centre, Cnr Wellington & Oxford Street, Durbanville, 7550', '021 975 9799', NULL, NULL,
  'Tosca Salon Durbanville is a hair and beauty salon inside Midville Centre, in Durbanville.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/tosca-salon-durbanville-oxford-street-cape-town-D7LD1V", "https://www.facebook.com/ToscaSalonDurbanville/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tosca-salon-durbanville-durbanville'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
