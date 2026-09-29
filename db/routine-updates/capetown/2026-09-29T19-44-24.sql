INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'rondebosch-village-shopping-centre-rondebosch', 'Rondebosch Village Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  '30 Klipfontein Road, Rondebosch, Cape Town, 7700', NULL, NULL,
  '["https://www.bizcommunity.com/Article/196/567/149542.html", "https://www.property24.com/articles/rondebosch-village-shopping-centre-sold-for-r202m/24571", "https://www.anvilproperty.co.za/commercial-property/retail/to-rent/rondebosch/rondebosch-village-8575/unit-9-56336"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-rondebosch-village-rondebosch', 'Woolworths (Rondebosch Village)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'rondebosch-village-shopping-centre-rondebosch'),
  'Shop 1, Rondebosch Village, 30 Klipfontein Road, Rondebosch, Cape Town, 7700', '021 659 4211', NULL, NULL,
  'Woolworths (Rondebosch Village) is a supermarket branch and the anchor tenant of Rondebosch Village Shopping Centre, Rondebosch.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/rondebosch/woolworths/shop-1-rondebosch-village-30-klipfontein-road", "https://www.gps-data-team.com/where/south_africa/store_locator/Woolworths-ZA/Woolworths-Milner-Road.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-rondebosch-village-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-rondebosch-main-centre-rondebosch', 'Woolworths (Rondebosch Main Centre)',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'rondebosch-main-centre-rondebosch'),
  'Rondebosch Main Centre, 51-81 Main Road, Rondebosch, Cape Town, 7700', '021 685 4416', NULL, NULL,
  'Woolworths (Rondebosch Main Centre) is a supermarket branch and anchor tenant of Rondebosch Main Centre, Rondebosch.',
  NULL, NULL,
  '["https://www.gps-data-team.com/where/south_africa/store_locator/Woolworths-ZA/Woolworths-Rondebosch.html", "https://za.africabz.com/western-cape/woolworths-22988"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-rondebosch-main-centre-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mr-price-rondebosch-cbd-rondebosch', 'Mr Price Rondebosch CBD',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  (SELECT id FROM shopping_centers WHERE slug = 'rondebosch-main-centre-rondebosch'),
  'Shop 6, Rondebosch Main Centre, Main Road, Rondebosch, Cape Town, 7700', '0800 212 535', NULL, NULL,
  'Mr Price Rondebosch CBD is a fashion and homeware retail branch inside Rondebosch Main Centre, Rondebosch.',
  NULL, NULL,
  '["https://www.mrp.com/en_za/store/mr-price-rondebosch-cbd", "https://www.rondeboschmain.co.za/stores/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mr-price-rondebosch-cbd-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'colour-and-copy-solutions-rondebosch', 'Colour & Copy Solutions',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  '26 Main Road, corner Grotto Road, Rondebosch, Cape Town, 7700', '021 689 9080', NULL, NULL,
  'Colour & Copy Solutions is a print shop in Rondebosch offering printing of booklets, plans, leaflets, stationery and flyers.',
  NULL, NULL,
  '["https://colourandcopy.com/contact-us/", "https://www.brabys.com/za/western-cape/cape-town/rondebosch/copying-service/colour-copy-solutions"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'colour-and-copy-solutions-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'printing-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'gamo-hair-beauty-salon-spa-rondebosch', 'Gamo Hair Beauty Salon & SPA',
  (SELECT id FROM suburbs WHERE slug = 'rondebosch'),
  '18 Main Road, Rondebosch, Cape Town, 7700', '021 685 1780', NULL, NULL,
  'Gamo Hair Beauty Salon & SPA is a unisex hair and beauty salon on Main Road in Rondebosch.',
  NULL, NULL,
  '["https://www.facebook.com/GamoHairandBeauty/", "https://www.beautynailhairsalons.com/ZA/Cape-Town/123580145001326/Gamo-Hair-Beauty-Salon-&-SPa"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'gamo-hair-beauty-salon-spa-rondebosch'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
