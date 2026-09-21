INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'stanhope-centre-claremont', 'Stanhope Centre',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  '227 Main Rd, Claremont, Cape Town, 7708', NULL, NULL,
  '["https://www.anvilproperty.co.za/commercial-property/retail/to-rent/claremont-upper/stanhope-centre-claremont-cape-town-2881/unit-4-91921", "https://nearbyza.com/store/all/stanhope-building-227-main-road-claremont-cape-town"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'panarottis-claremont', 'Panarottis Claremont',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  (SELECT id FROM shopping_centers WHERE slug = 'stanhope-centre-claremont'),
  'Shop 11, Stanhope Centre, 227 Main Rd, Claremont, Cape Town, 7708', '021 683 2215', NULL, NULL,
  'Panarottis Claremont is an Italian restaurant serving pizza and pasta, in Stanhope Centre, Claremont.',
  NULL, NULL,
  '["https://crave.co.za/establishment.asp?est=16938", "https://2pos.co.za/2/22420"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'panarottis-claremont'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'starlings-locale-claremont', 'Starlings Locale',
  (SELECT id FROM suburbs WHERE slug = 'claremont'),
  '4 Mark Rd, Claremont, Cape Town, 7708', '076 368 1704', NULL, NULL,
  'Starlings Locale is a cafe in Claremont, serving breakfast and lunch.',
  NULL, NULL,
  '["https://www.sluurpy.co.za/claremont/restaurant/5032164/starlings-locale", "https://insideguide.co.za/cape-town/restaurants/starlings-locale/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'starlings-locale-claremont'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
