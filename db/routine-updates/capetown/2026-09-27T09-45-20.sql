INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-food-constantia-emporium-constantia', 'Woolworths Food',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'constantia-emporium-constantia'),
  'Shop 6, Constantia Emporium, Ladies Mile Road, Constantia, Cape Town, 7806', '+27 21 461 3472', NULL, NULL,
  'Woolworths Food is a grocery store in Constantia Emporium selling fresh food, groceries and ready meals.',
  NULL, NULL,
  '["https://shopconstantiaemporium.com/portfolio/woolworths/", "https://rsa.worldorgs.com/catalog/cape-town/grocery-store/woolworths-constantia-emporium"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-food-constantia-emporium-constantia'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'knead-constantia-emporium-constantia', 'Knead',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'constantia-emporium-constantia'),
  'Constantia Emporium, Corner Ladies Mile Road & Spaanschemat River Road, Constantia, Cape Town', '021 213 0015', NULL, NULL,
  'Knead is an artisanal bakery and cafe chain''s branch in Constantia Emporium, serving fresh bread, pastries and light meals.',
  NULL, NULL,
  '["https://www.kneadbakery.co.za/", "https://www.abillion.com/restaurants/knead-bakery-constantia-emporium-10469771"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'knead-constantia-emporium-constantia'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'venture-workspace-constantia-emporium-constantia', 'Venture Workspace',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'constantia-emporium-constantia'),
  'First Floor, Constantia Emporium, Corner Ladies Mile Road & Spaanschemat River Road, Constantia, Cape Town, 7806', '0861 370 260', NULL, NULL,
  'Venture Workspace is a shared coworking and serviced office space on the first floor of Constantia Emporium.',
  NULL, NULL,
  '["https://ventureworkspace.co.za/coworking-constantia/", "https://www.coworkingcafe.com/coworking-property/za/wc/cape-town/venture-workspace-constantia/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'venture-workspace-constantia-emporium-constantia'),
  (SELECT id FROM categories WHERE slug = 'commercial-property-office-space'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'home-constantia-village-constantia', '@home',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  (SELECT id FROM shopping_centers WHERE slug = 'constantia-village-constantia'),
  'Shop 24, Constantia Village, Constantia Road, Constantia, Cape Town', '021 795 5300', NULL, NULL,
  '@home is a homeware and decor retailer''s branch in Constantia Village, selling furniture, decor and lifestyle goods.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/at-home-constantia-village-constantia-road/66193", "https://www.callupcontact.com/b/Homeware/Home_Constantia_Village/5411"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'home-constantia-village-constantia'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'constantia-veterinary-hospital-constantia', 'Constantia Veterinary Hospital',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  '62 Old Kendal Road, Constantia, Cape Town, 7806', '+27 21 794 5080', NULL, NULL,
  'Constantia Veterinary Hospital is a small-animal veterinary practice in Constantia.',
  NULL, NULL,
  '["https://www.pooh.co.za/listing/constantia-veterinary-hospital/", "https://www.meditrader.co.za/constantia-veterinary-hospital-veterinary-clinic-constantia"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'constantia-veterinary-hospital-constantia'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'alphen-veterinary-hospital-constantia', 'Alphen Veterinary Hospital',
  (SELECT id FROM suburbs WHERE slug = 'constantia'),
  'Constantia Main Road, Constantia, Cape Town, 7806', '021 794 1522', NULL, NULL,
  'Alphen Veterinary Hospital is a well-established small-animal veterinary practice on Constantia Main Road, opposite Constantia Village.',
  NULL, NULL,
  '["https://www.alphenvet.co.za/", "https://za.africabz.com/western-cape/alphen-veterinary-hospital-73406"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'alphen-veterinary-hospital-constantia'),
  (SELECT id FROM categories WHERE slug = 'vets-animal-care'),
  1
);
