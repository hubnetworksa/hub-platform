INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-liquorshop-sun-valley-sunnydale', 'Checkers LiquorShop Sun Valley',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  (SELECT id FROM shopping_centers WHERE slug = 'sun-valley-mall-sunnydale'),
  'Shop 10, Sun Valley Mall, Cnr Noordhoek Main Road & Buller Louw Blvd, Sunnydale, Cape Town, 7975', '021 784 2960', NULL, NULL,
  'Checkers LiquorShop Sun Valley is a liquor store in Sun Valley Mall, Sunnydale.',
  NULL, NULL,
  '["https://www.yellowpages.net.za/amp/phone-27-217842960-liquor-store-Cape-Town-ZA23101.html", "https://za.africabz.com/western-cape/checkers-liquorshop-sun-valley-54379"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-liquorshop-sun-valley-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'liquor-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sorbet-salon-sun-valley-sunnydale', 'Sorbet Salon Sun Valley',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  (SELECT id FROM shopping_centers WHERE slug = 'sun-valley-mall-sunnydale'),
  'Sun Valley Mall, Cnr Ou Kaapse Weg & Buller Louw Blvd, Sunnydale, Cape Town, 7975', '021 785 2767', NULL, NULL,
  'Sorbet Salon Sun Valley is a beauty and hair salon in Sun Valley Mall, Sunnydale.',
  NULL, NULL,
  '["http://textmap.co.za/3/22308", "https://www.sayellow.com/view/south-africa/sorbet-sun-valley-noordhoek-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sorbet-salon-sun-valley-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-sun-valley-sunnydale', 'PostNet Sun Valley',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  (SELECT id FROM shopping_centers WHERE slug = 'sun-valley-mall-sunnydale'),
  'Shop G08, Sun Valley Mall, Buller Louw Blvd, Sunnydale, Cape Town, 7975', '021 785 3812', 'https://sunvalley.postnet.co.za', NULL,
  'PostNet Sun Valley is a courier, printing and mailing services outlet in Sun Valley Mall, Sunnydale.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/postnet-186097", "https://homeappliancerepairs.co.za/3201361243762509150/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-sun-valley-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bierman-strauss-optometrists-sunvalley-sunnydale', 'Bierman Strauss Optometrists Sunvalley',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  (SELECT id FROM shopping_centers WHERE slug = 'sun-valley-mall-sunnydale'),
  'Sun Valley Mall, 3 Buller Louw Drive, Sunnydale, Cape Town, 7975', '021 785 3141', 'https://biermangroup.co.za/stores/bierman-strauss-optometrists-sunvalley/', NULL,
  'Bierman Strauss Optometrists Sunvalley is an optometry practice in Sun Valley Mall, Sunnydale.',
  NULL, NULL,
  '["https://biermangroup.co.za/stores/bierman-strauss-optometrists-sunvalley/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=362530"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bierman-strauss-optometrists-sunvalley-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'about-cats-and-dogs-sun-valley-sunnydale', 'About Cats & Dogs Sun Valley',
  (SELECT id FROM suburbs WHERE slug = 'sunnydale'),
  (SELECT id FROM shopping_centers WHERE slug = 'sun-valley-mall-sunnydale'),
  'Shop 17, Sun Valley Mall, Sunnydale, Cape Town, 7975', '021 880 2809', 'https://aboutcatsanddogs.co.za/listing/noordhoek/', NULL,
  'About Cats & Dogs Sun Valley is a pet food and supplies store in Sun Valley Mall, Sunnydale.',
  NULL, NULL,
  '["https://www.xpose.co.za/listings/about-cats-dogs-pet-shop-sun-valley-mall/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=372208"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'about-cats-and-dogs-sun-valley-sunnydale'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);
