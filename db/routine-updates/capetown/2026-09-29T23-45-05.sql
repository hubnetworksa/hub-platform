INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'spar-bergvliet-bergvliet', 'SPAR Bergvliet',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  '151 Main Road, Bergvliet, Cape Town, 7945', '021 713 1117', 'https://www.spar.co.za/home/store-view/kwikspar-bergvliet-western-cape', NULL,
  'SPAR Bergvliet is a supermarket on Main Road, Bergvliet, selling groceries, fresh produce and baked goods.',
  NULL, NULL,
  '["https://www.spar.co.za/home/store-view/kwikspar-bergvliet-western-cape", "https://southafricafirm.com/western-cape/kwikspar-bergvliet-9281"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'spar-bergvliet-bergvliet'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pharmacy-at-spar-bergvliet-bergvliet', 'Pharmacy at Spar - Bergvliet',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  (SELECT id FROM shopping_centers WHERE slug = 'harry-goemans-centre-bergvliet'),
  'Shop 8, Harry Goemans Centre, 151 Main Road, Bergvliet, Cape Town, 7945', '021 205 0308', NULL, NULL,
  'Pharmacy at Spar - Bergvliet is a pharmacy in the Harry Goemans Centre on Main Road, Bergvliet.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=385391", "https://www.sayellow.com/view/south-africa/bergvliet-pharmacy-at-spar-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pharmacy-at-spar-bergvliet-bergvliet'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'st-francis-veterinary-clinic-bergvliet', 'St Francis Veterinary Clinic',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  '157 Main Road, Bergvliet, Cape Town', '021 712 0357', NULL, NULL,
  'St Francis Veterinary Clinic is a veterinary practice on Main Road, Bergvliet.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/st-francis-veterinary-clinic-82188", "https://savet.co.za/vet/st-francis-veterinary-hospital-wp"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'st-francis-veterinary-clinic-bergvliet'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'louis-on-the-block-bergvliet', 'Louis'' On The Block',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  'Corner Children''s Way & Hiddingh Road, Bergvliet, Cape Town, 7945', '021 715 6693', 'https://www.louis-on-the-block.co.za/', NULL,
  'Louis'' On The Block is a family grill and pizza restaurant on the corner of Children''s Way and Hiddingh Road, Bergvliet.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g6857443-d2706567-Reviews-Louis_On_The_Block-Bergvliet_Western_Cape.html", "https://www.seeff.com/news/spotlight-on-louis-on-the-block-family-restaurant-in-bergvliet/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'louis-on-the-block-bergvliet'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bergvliet-pet-centre-bergvliet', 'Bergvliet Pet Centre',
  (SELECT id FROM suburbs WHERE slug = 'bergvliet'),
  (SELECT id FROM shopping_centers WHERE slug = 'sherwood-shopping-centre-bergvliet'),
  'Sherwood Centre, Corner Children''s Way and Dreyersdal Road, Bergvliet, Cape Town, 7945', '072 289 6920', NULL, 'bergpetcentre@gmail.com',
  'Bergvliet Pet Centre is a pet food and pet products store in the Sherwood Centre, Bergvliet.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=1864050", "https://www.mrd.com/delivery/store/bergvliet-pet-centre-bergvliet/30378"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bergvliet-pet-centre-bergvliet'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);
