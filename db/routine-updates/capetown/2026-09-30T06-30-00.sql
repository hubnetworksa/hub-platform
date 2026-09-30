INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'langverwacht-plein-kuils-river', 'Langverwacht Plein',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  'Corner of Langverwacht Road & Kloof Avenue, Kuils River, Cape Town, 7580', NULL, NULL,
  '["https://foursquare.com/v/langverwacht-plein/52a2ee0911d2332961196e7d", "https://www.tiendeo.co.za/stores/kuils-river/langverwacht-plein-corner-of-langverwacht-road-and-kloof-ave/51032"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'point-s-kuilsriver-kuils-river', 'Point-S Kuilsriver',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  '47 Van Riebeeck Road, Kuils River, Cape Town, 7580', '021 903 0184', 'https://www.point-s.co.za/store-locator/western-cape/point-s-kuilsriver', NULL,
  'Point-S Kuilsriver is a tyre and vehicle service centre on Van Riebeeck Road, Kuils River.',
  NULL, NULL,
  '["https://www.point-s.co.za/store-locator/western-cape/point-s-kuilsriver", "https://www.pirelli.com/tyres/en-za/car/find-your-dealer/dealer-locator/south-africa/kuilsriver/za0002402002"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'point-s-kuilsriver-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'automotive-repairs'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'norma-jeans-beauty-salon-and-tattoo-parlor-kuils-river', 'Norma-Jean''s Beauty Salon and Tattoo Parlor',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  '43b Van Riebeeck Road, Kuils River, Cape Town, 7580', '064 514 2802', NULL, NULL,
  'Norma-Jean''s Beauty Salon and Tattoo Parlor offers beauty treatments and tattoo services on Van Riebeeck Road, Kuils River.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/norma-jeans-beauty-salon-and-tattoo-parlor-van-riebeeck-road-cape-town-RvWXn6", "https://booksy.com/en-za/39170_norma-jeans-beauty-salon-and-tattoo-studio_hair-salons_58144_kuils-river"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'norma-jeans-beauty-salon-and-tattoo-parlor-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'salon-jean-paul-kuilsriver-kuils-river', 'Salon Jean Paul Kuilsriver',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'kuilsriver-shopping-centre-kuils-river'),
  'Shop 3, Shoprite Centre, Van Riebeeck Road, Kuils River, Cape Town, 7580', '021 903 1124', NULL, NULL,
  'Salon Jean Paul Kuilsriver is a hair salon inside the Shoprite Centre on Van Riebeeck Road, Kuils River.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/salon-jean-paul-kuilsriver-van-riebeeck-road-cape-town-8Jyb2M", "https://www.brabys.com/za/western-cape/kuils-river/kuils-river-ind/unisex-hairdressers/salon-jean-paul-unisex-hair-clinic"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'salon-jean-paul-kuilsriver-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dentist-on-wenlock-inc-kuils-river', 'Dentist on Wenlock Inc',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  '1 Wenlock Street, Kuils River, Cape Town, 7582', '021 906 0380', 'http://www.dentistkuilsriver.co.za', NULL,
  'Dentist on Wenlock Inc is a dental practice on Wenlock Street, Kuils River.',
  NULL, NULL,
  '["http://www.dentistkuilsriver.co.za/", "https://www.facebook.com/kuilsriverdentist/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dentist-on-wenlock-inc-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dr-m-hattingh-grant-kuils-river', 'Dr M Hattingh Grant',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  '1 Grove Street, Alora, Kuils River, Cape Town, 7580', '021 903 7603', NULL, NULL,
  'Dr M Hattingh Grant is a dental practice in Alora, Kuils River.',
  NULL, NULL,
  '["https://www.brabys.com/za/western-cape/kuils-river/alora/dentists/dr-m-hattingh-grant", "https://www.medicalnetwork.co.za/Profile/82415/Dr-Grant-Morne-Hattingh"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dr-m-hattingh-grant-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'haasendal-dental-kuils-river', 'Haasendal Dental',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'haasendal-gables-kuils-river'),
  'Shop 13, Haasendal Gables Shopping Centre, 2 Haasendal Road, Kuils River, Cape Town, 7580', '021 903 1405', 'https://www.haasendaldental.co.za', NULL,
  'Haasendal Dental is a family dental practice inside Haasendal Gables Shopping Centre, Kuils River.',
  NULL, NULL,
  '["https://www.haasendaldental.co.za/", "https://haasendalgables.co.za/stores/100-hair-health-beauty/225-barnado-dental-at-haasendal-gables-mall-in-kuilsriver"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'haasendal-dental-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'langverwacht-dental-kuils-river', 'Langverwacht Dental',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'langverwacht-plein-kuils-river'),
  'Shop 28, Langverwacht Plein, Langverwacht Road, Kuils River, Cape Town, 7580', '021 903 2062', NULL, NULL,
  'Langverwacht Dental is a dental practice inside Langverwacht Plein, Kuils River.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/955879/langverwacht-dental", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=305057"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'langverwacht-dental-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'dentists'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-langverwacht-plein-kuils-river', 'Checkers Langverwacht Plein',
  (SELECT id FROM suburbs WHERE slug = 'kuils-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'langverwacht-plein-kuils-river'),
  'Corner Langverwacht Road & Kloof Avenue, Langverwacht Plein, Kuils River, Cape Town, 7580', '021 900 7640', 'https://www.checkers.co.za/store-directory-and-leaflets/store-details/37255', NULL,
  'Checkers is a supermarket inside Langverwacht Plein, Kuils River.',
  NULL, NULL,
  '["https://www.checkers.co.za/store-directory-and-leaflets/store-details/37255", "https://www.tiendeo.co.za/stores/kuils-river/checkers-cnr-langverwacht-and-kloof-street/5859"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-langverwacht-plein-kuils-river'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
