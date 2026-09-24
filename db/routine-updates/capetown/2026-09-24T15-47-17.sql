INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'be-dazzle-hair-and-beauty-salon-kenilworth', 'Be-Dazzle Hair and Beauty Salon',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  (SELECT id FROM shopping_centers WHERE slug = 'access-park-kenilworth'),
  'Shop G4, Access Park, Chichester Road, Kenilworth, Cape Town, 7708', '021 683 8444', NULL, NULL,
  'Be-Dazzle Hair and Beauty Salon is a hair, beauty and slimming salon inside Access Park, Kenilworth.',
  NULL, NULL,
  '["https://www.facebook.com/bedazzle.accesspark/", "https://www.hotfrog.co.za/company/1099860278091776/be-dazzle-hair-and-beauty-salon/kenilworth/cosmetics"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'be-dazzle-hair-and-beauty-salon-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'infinite-smiles-dental-practice-kenilworth', 'Infinite Smiles Dental Practice',
  (SELECT id FROM suburbs WHERE slug = 'kenilworth'),
  (SELECT id FROM shopping_centers WHERE slug = 'kenilworth-centre-kenilworth'),
  'Kenilworth Centre, Doncaster Road, Kenilworth, Cape Town, 7708', '021 683 2945', NULL, NULL,
  'Infinite Smiles Dental Practice is a family dental practice inside Kenilworth Centre, offering general dentistry with medical aid and discounted cash and pensioner rates.',
  NULL, NULL,
  '["https://kenilworthcentre.co.za/stores/store-list/dr-razack/", "http://www.dentistkenilworth.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'infinite-smiles-dental-practice-kenilworth'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);
