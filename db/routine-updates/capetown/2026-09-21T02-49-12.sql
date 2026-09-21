-- Suburb: lakeside -- 2 new shopping centres + 8 verified tenant businesses

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'lakeside-centre-lakeside', 'Lakeside Centre',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  'Main Road, Lakeside, Cape Town, 7945', NULL, NULL,
  '["https://www.lekkeslaap.co.za/attractions/lakeside-centre", "https://www.tiendeo.co.za/mall/cape-town/lakeside-centre"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'the-old-bakery-lakeside', 'The Old Bakery',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  'Corner Main Road & Lincoln Road, Lakeside, Cape Town, 7945', NULL, NULL,
  '["https://theoldbakery.co.za/", "https://www.seeff.com/news/explore-lakesides-old-bakery-shopping-centre/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-lakeside-lakeside', 'Pick n Pay Lakeside',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  (SELECT id FROM shopping_centers WHERE slug = 'lakeside-centre-lakeside'),
  'Shop 1, Lakeside Centre, Main Road, Lakeside, Cape Town, 7945', '021 788 4872', NULL, NULL,
  'Pick n Pay Lakeside is a supermarket branch anchoring Lakeside Centre on Main Road, Lakeside.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/pick-n-pay-lakeside-26909", "https://my-catalogue.co.za/stores/lakeside/pick-n-pay-supermarket/main-road"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-lakeside-lakeside'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bella-pizza-lakeside', 'Bella Pizza',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  (SELECT id FROM shopping_centers WHERE slug = 'lakeside-centre-lakeside'),
  'Lakeside Centre, 60 Main Road, Lakeside, Cape Town, 7945', '021 788 3032', NULL, NULL,
  'Bella Pizza is a pizzeria and takeaway inside Lakeside Centre, Lakeside.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/2333506_2", "https://www.bellapizza.co.za/contact-2/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bella-pizza-lakeside'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'lakeside-pharmacy-lakeside', 'Lakeside Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  (SELECT id FROM shopping_centers WHERE slug = 'lakeside-centre-lakeside'),
  '62 Main Road, Lakeside, Cape Town, 7945', '021 788 6300', NULL, NULL,
  'Lakeside Pharmacy is a pharmacy on Main Road in Lakeside, near Lakeside Centre.',
  NULL, NULL,
  '["https://www.yellosa.co.za/company/937027/lakeside-pharmacy", "https://www.brabys.com/za/western-cape/cape-town/lakeside/pharmacies/lakeside-pharmacy"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'lakeside-pharmacy-lakeside'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'postnet-lakeside-lakeside', 'PostNet Lakeside',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  (SELECT id FROM shopping_centers WHERE slug = 'lakeside-centre-lakeside'),
  'Shop 2A, Lakeside Shopping Centre, Main Road, Lakeside, Cape Town, 7945', '021 788 3358', NULL, NULL,
  'PostNet Lakeside is a branch of the PostNet retail network inside Lakeside Centre, offering courier, printing and mailing services.',
  NULL, NULL,
  '["https://www.postnet.co.za/stores/lakeside", "https://www.callupcontact.com/b/Courier_amp_Postal_Services/Postnet_Lakeside/3832"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'postnet-lakeside-lakeside'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-old-bakery-lakeside-lakeside', 'Woolworths Old Bakery Lakeside',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-old-bakery-lakeside'),
  'Shop 14, The Old Bakery, Main Road, Lakeside, Cape Town, 7945', '021 787 9060', NULL, NULL,
  'Woolworths Old Bakery Lakeside is a supermarket branch anchoring The Old Bakery shopping centre on Main Road, Lakeside.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/woolworths-old-bakery-lakeside-in-muizenberg", "https://vymaps.com/ZA/Woolworths-Old-Bakery-157540/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-old-bakery-lakeside-lakeside'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'estilo-hair-lakeside', 'Estilo Hair',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-old-bakery-lakeside'),
  'Shop 17, The Old Bakery, Main Road, Lakeside, Cape Town, 7945', '079 888 0093', NULL, NULL,
  'Estilo Hair is an owner-run unisex hair salon inside The Old Bakery, Lakeside, established in 2012.',
  NULL, NULL,
  '["https://www.fresha.com/lvp/estilo-hair-salon-lincoln-road-cape-town-gn306o", "https://www.estilohairsa.com/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'estilo-hair-lakeside'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pet-plus-lakeside-lakeside', 'Pet Plus Lakeside',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-old-bakery-lakeside'),
  'Shop 3, The Old Bakery, Cnr Lincoln Road & Main Road, Lakeside, Cape Town, 7945', '087 551 2452', NULL, NULL,
  'Pet Plus Lakeside is a pet supply store inside The Old Bakery, Lakeside.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/pet-plus-lakeside-178271", "https://www.pooh.co.za/listing/pet-plus-lakeside/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pet-plus-lakeside-lakeside'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'rouge-day-spa-lakeside', 'Rouge Day Spa Old Bakery',
  (SELECT id FROM suburbs WHERE slug = 'lakeside'),
  (SELECT id FROM shopping_centers WHERE slug = 'the-old-bakery-lakeside'),
  'The Old Bakery, Cnr Main Road & Lincoln Road, Lakeside, Cape Town, 7945', '066 244 4333', NULL, NULL,
  'Rouge Day Spa Old Bakery is a day spa and beauty salon inside The Old Bakery, Lakeside.',
  NULL, NULL,
  '["https://www.rougespa.co.za/book-now-find-us/lakeside-old-bakery", "https://www.fresha.com/lvp/rouge-old-bakery-lincoln-road-cape-town-QvRj4A"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'rouge-day-spa-lakeside'),
  (SELECT id FROM categories WHERE slug = 'spas-wellness'),
  1
);
