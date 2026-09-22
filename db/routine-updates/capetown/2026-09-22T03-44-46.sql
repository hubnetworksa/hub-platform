INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'groot-phesantekraal-view-durbanville', 'Groot Phesantekraal View',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  'Corner of Klipheuwel and Okavango Roads, Durbanville, Cape Town, 7550', NULL, NULL,
  '["https://novanews.co.za/tygerburger/opening-of-groot-phesantekraal-view-shopping-centre-in-durbanville/", "https://www.grootphesantekraalview.co.za/", "https://en.wikipedia.org/wiki/Groot_Phesantekraal_View"]',
  'mall'
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'cobble-walk-durbanville', 'Cobble Walk',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  'Corner of De Villiers Road and Verdi Boulevard, Sonstraal Heights, Durbanville, Cape Town, 7550', NULL, NULL,
  '["https://www.localstore.co.za/store/9238/cobble-walk/durbanville/", "https://www.mallguide.co.za/malls/view/1183/cobble-walk", "https://www.lekkeslaap.co.za/attractions/cobble-walk-mall"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shakespeares-restaurant-durbanville', 'Shakespeare''s Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  'Heritage Square, Vrede Street, Durbanville, Cape Town', '021 569 0244', 'https://www.shakespeares.co.za/', NULL,
  'Shakespeare''s Restaurant is a fine-dining restaurant in Heritage Square, Durbanville, serving heritage-inspired South African fare.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/shakespeares/", "https://www.capetownmagazine.com/shakespeares"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shakespeares-restaurant-durbanville'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-cobble-walk-durbanville', 'Woolworths',
  (SELECT id FROM suburbs WHERE slug = 'durbanville'),
  (SELECT id FROM shopping_centers WHERE slug = 'cobble-walk-durbanville'),
  'Shop 10, Cobble Walk Shopping Centre, Corner Verdi Rd & De Villiers Rd, Durbanville, Cape Town, 7550', '021 970 4900', NULL, NULL,
  'Woolworths Cobble Walk is a branch of the Woolworths food and grocery chain in the Cobble Walk shopping centre in Durbanville.',
  NULL, NULL,
  '["https://za.directmap.info/durbanville/1612", "https://www.tiendeo.co.za/stores/milnerton/woolworths-shop-cobblewalk-shopping-centre-cnr-verdi-rd-de-villiers-rd-durbanville/15090"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-cobble-walk-durbanville'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
