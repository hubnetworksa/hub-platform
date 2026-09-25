INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-lansdowne-corner-lansdowne', 'Shoprite Lansdowne Corner',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  (SELECT id FROM shopping_centers WHERE slug = 'lansdowne-corner-shopping-centre-lansdowne'),
  'Corner Jan Smuts Drive & Lansdowne Road, Lansdowne Corner Shopping Centre, Lansdowne, Cape Town, 7780', '021 704 9740', NULL, NULL,
  'Shoprite Lansdowne Corner is a supermarket offering groceries, fresh produce and everyday essentials, in Lansdowne Corner Shopping Centre, Lansdowne.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Ottery/Shoprite-Lansdowne-Corner/store-details/30716", "https://www.lansdownecorner.co.za/browse-directory/2172/shoprite/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-lansdowne-corner-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'carpet-and-decor-lansdowne', 'Carpet & Decor',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  '396 Imam Haron Road, Lansdowne, Cape Town, 7780', '021 200 2522', 'https://www.carpetdecor.co.za/cape-town/', NULL,
  'Carpet & Decor is a family-owned flooring retailer selling and installing carpets and other floor coverings, in Lansdowne.',
  NULL, NULL,
  '["https://www.carpetdecor.co.za/cape-town/", "https://www.facebook.com/carpetanddecor/posts/cape-town-branch396-imam-haron-road-lansdownetel-021-200-2522capetowncarpetdecor/2667687336588900/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'carpet-and-decor-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'furniture-homeware'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-venue-company-lansdowne', 'The Venue Company',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  '345 Imam Haron Road, Lansdowne, Cape Town, 7780', '021 697 5515', 'http://thevenueco.weebly.com/', NULL,
  'The Venue Company is an event venue in Lansdowne hosting weddings, conferences and other celebrations, with catering and audio-visual services available.',
  NULL, NULL,
  '["http://thevenueco.weebly.com/", "https://hungryforhalaal.co.za/listing/the-venue-lansdowne/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-venue-company-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-towel-factory-shop-lansdowne', 'The Towel Factory Shop',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  '348 Imam Haron Road, Lansdowne, Cape Town, 7779', '021 696 6306', 'https://www.thetowelfactoryshop.co.za/', NULL,
  'The Towel Factory Shop is a retailer in Lansdowne selling towels, bedding, curtains and other linen and decor items at factory-outlet prices.',
  NULL, NULL,
  '["https://www.thetowelfactoryshop.co.za/", "https://za.africabz.com/western-cape/the-towel-factory-shop-104489"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-towel-factory-shop-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
