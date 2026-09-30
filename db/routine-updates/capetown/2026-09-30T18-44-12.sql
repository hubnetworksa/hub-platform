INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-lansdowne-corner-lansdowne', 'Clicks Lansdowne Corner',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  (SELECT id FROM shopping_centers WHERE slug = 'lansdowne-corner-shopping-centre-lansdowne'),
  'Shop 4, Lansdowne Corner, Cnr Govan Mbeki Road & Jan Smuts Drive, Lansdowne, Cape Town, 7780', '021 703 7860', NULL, NULL,
  'Clicks Lansdowne Corner is a pharmacy and health, beauty and homeware retailer, in Lansdowne Corner Shopping Centre, Lansdowne.',
  NULL, NULL,
  '["https://clicks.co.za/store/Lansdowne/1646", "https://www.guzzle.co.za/clicks/lansdowne/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-lansdowne-corner-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cashbuild-lansdowne-corner-lansdowne', 'Cashbuild Lansdowne Corner',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  (SELECT id FROM shopping_centers WHERE slug = 'lansdowne-corner-shopping-centre-lansdowne'),
  'Shop 1, Lansdowne Corner, Cnr Jan Smuts Drive & Govan Mbeki Road, Lansdowne, Cape Town, 7782', '021 704 0410', NULL, NULL,
  'Cashbuild Lansdowne Corner is a building materials and hardware store, in Lansdowne Corner Shopping Centre, Lansdowne.',
  NULL, NULL,
  '["https://stores.cashbuild.co.za/za/western-cape/cape-town/shop-1-lansdowne-corner", "https://www.tiendeo.co.za/stores/cape-town/cashbuild-corner-of-jan-smuts-and-govan-mbeki-road-lansdowne-cape-town/49264"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cashbuild-lansdowne-corner-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'caxton-books-lansdowne', 'Caxton Books',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  '406 Imam Haron Road, Lansdowne, Cape Town, 7780', '021 010 0425', NULL, NULL,
  'Caxton Books is a bookshop and stationer, in Lansdowne.',
  NULL, NULL,
  '["https://southafricafirm.com/western-cape/caxton-books-lansdowne-17918", "https://firmania.co.za/cape-town/caxton-books-lansdowne-87845"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'caxton-books-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-venue-company-lansdowne', 'The Venue Company',
  (SELECT id FROM suburbs WHERE slug = 'lansdowne'),
  '345 Imam Haron Road, Lansdowne, Cape Town', '021 697 5515', NULL, NULL,
  'The Venue Company is an event venue offering halaal-catered functions, in Lansdowne.',
  NULL, NULL,
  '["https://www.facebook.com/p/The-Venue-Company-100068343993952/", "https://hungryforhalaal.co.za/listing/the-venue-lansdowne/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-venue-company-lansdowne'),
  (SELECT id FROM categories WHERE slug = 'events-function-venues'),
  1
);
