-- Jobs 1-2: Rondebosch suburb research (3 new businesses, 1 a Riverside Mall tenant)

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'van-schaik-bookstore-rondebosch', 'Van Schaik Bookstore',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'riverside-mall-rondebosch'),
  'Shop No LG7A, Riverside Mall, Cnr Main & Belmont Rd, Rondebosch, Cape Town', '+27 21 689 4112', NULL, NULL,
  'Van Schaik Bookstore is a bookstore and stationery retailer in Riverside Mall, Rondebosch.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/426485/van-schaik-bookstore-rondebosch", "https://za.africabz.com/western-cape/van-schaik-bookstore-rondebosch-84178"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'van-schaik-bookstore-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-pantry-rondebosch', 'The Pantry',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  'Corner Belvedere Road & Wyndover Road, Rondebosch, Cape Town', '+27 21 672 0437', NULL, NULL,
  'The Pantry is a bakery and quick-service cafe in Rondebosch, Cape Town.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/the-pantry-311513", "https://www.facebook.com/thepantryrondebosch/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-pantry-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rondebosch-veterinary-hospital-rondebosch', 'Rondebosch Veterinary Hospital',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  '111 Campground Road, Rondebosch, Cape Town', '+27 21 685 5558', NULL, NULL,
  'Rondebosch Veterinary Hospital is a veterinary hospital in Rondebosch, Cape Town.',
  NULL, NULL,
  '["https://rondeboschvet.com/contact/", "https://savet.co.za/vet/rondebosch-veterinary-hospital"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rondebosch-veterinary-hospital-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);
