INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'hair-ambitions-plattekloof-village-plattekloof', 'Hair Ambitions',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-village-shopping-centre-plattekloof'),
  'Plattekloof Village, Plattekloof Road, Plattekloof, Cape Town, 7500', '021 558 3496', NULL, NULL,
  'Hair Ambitions is a hairdressing salon in Plattekloof Village Shopping Centre, Plattekloof.',
  NULL, NULL,
  '["http://plattekloofvillage.azurewebsites.net/shop/hair-ambitions/", "https://heyhairsalons.co.za/0685710/Hair_Ambitions"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'hair-ambitions-plattekloof-village-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'petshop-science-plattekloof-shopping-centre-plattekloof', 'Petshop Science',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-shopping-centre-plattekloof'),
  'Shop 16, Plattekloof Shopping Centre, Corner Olienhout & Plattekloof Streets, Plattekloof, Cape Town, 7500', '021 929 2040', NULL, NULL,
  'Petshop Science is a specialist pet shop selling pet products and food, a Checkers subsidiary, in Plattekloof Shopping Centre.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/petshop-science-plattekloof-639468", "https://www.medpages.info/sf/index.php?page=listing&servicecode=870&suburbcode=5468"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'petshop-science-plattekloof-shopping-centre-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-village-vetshop-plattekloof-village-plattekloof', 'The Village Vetshop',
  (SELECT id FROM suburbs WHERE slug = 'plattekloof'),
  (SELECT id FROM shopping_centers WHERE slug = 'plattekloof-village-shopping-centre-plattekloof'),
  'Shop 10b, Plattekloof Village Centre, Corner Plattekloof Road & Baronetcy Boulevard, Plattekloof, Cape Town, 7500', '021 558 0346', NULL, NULL,
  'The Village Vetshop is a pet shop and veterinary supplies store in Plattekloof Village Shopping Centre, Plattekloof.',
  NULL, NULL,
  '["http://plattekloofvillage.azurewebsites.net/shop/village-vetshop/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=289686"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-village-vetshop-plattekloof-village-plattekloof'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);
