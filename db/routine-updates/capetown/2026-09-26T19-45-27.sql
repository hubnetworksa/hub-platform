INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'surfside-restaurant-strand', 'Surfside Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  (SELECT id FROM shopping_centers WHERE slug = 'strand-pavilion-mall-strand'),
  'Strand Pavilion Centre, Beach Road, Strand, 7140', '021 853 2748', NULL, NULL,
  'Surfside Restaurant is a restaurant at Strand Pavilion Mall in Strand, overlooking the sea towards False Bay.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g1236998-d2516086-Reviews-Surfside_Restaurant-Strand_Western_Cape.html", "https://www.eatout.co.za/venue/surfside-bistro/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'surfside-restaurant-strand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'barts-tavern-strand', 'Bart''s Tavern',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  (SELECT id FROM shopping_centers WHERE slug = 'strand-pavilion-mall-strand'),
  'Strand Pavilion Centre, Beach Road, Strand, 7140', '021 853 4106', NULL, NULL,
  'Bart''s Tavern is a low-key pub at Strand Pavilion Mall in Strand.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/barts-tavern-78104", "https://www.eatout.co.za/venue/barts-tavern/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'barts-tavern-strand'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mark-one-hair-design-strand', 'Mark One Hair Design',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  (SELECT id FROM shopping_centers WHERE slug = 'strand-pavilion-mall-strand'),
  'Shop 16, Strand Pavilion, Beach Road, Strand, 7140', '021 853 1281', NULL, NULL,
  'Mark One Hair Design is a hair salon at Strand Pavilion Mall in Strand.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/mark-one-hair-design-western-cape-cape-town-A8P6Nb", "https://www.thinklocal.co.za/biz/mark-one-hair-design-strand"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mark-one-hair-design-strand'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'salon-suzette-strand', 'Salon Suzette',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  (SELECT id FROM shopping_centers WHERE slug = 'strand-pavilion-mall-strand'),
  'Shop 14 & 15, Strand Pavilion, Beach Road, Strand, 7140', '082 577 7551', NULL, NULL,
  'Salon Suzette is a beauty, laser and nail clinic at Strand Pavilion Mall in Strand.',
  NULL, NULL,
  '["https://www.fresha.com/a/salon-suzette-cape-town-beach-road-k55dqewu", "https://www.strandonline.co.za/item/salon-suzette/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'salon-suzette-strand'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'letitia-bloemiste-florist-strand', 'Letitia Bloemiste/Florist',
  (SELECT id FROM suburbs WHERE slug = 'strand'),
  (SELECT id FROM shopping_centers WHERE slug = 'strand-pavilion-mall-strand'),
  'Shop 18, Strand Pavilion, Beach Road, Strand, 7140', '021 854 6138', NULL, NULL,
  'Letitia Bloemiste/Florist is a florist at Strand Pavilion Mall in Strand, serving the Strand, Gordon''s Bay and Somerset West area.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/letitia-bloemiste-69824", "https://www.brabys.com/za/western-cape/strand/central/florists/letitia-bloemiste-florist"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'letitia-bloemiste-florist-strand'),
  (SELECT id FROM categories WHERE slug = 'florists'),
  1
);
