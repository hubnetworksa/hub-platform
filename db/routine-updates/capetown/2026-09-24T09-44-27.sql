INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'portside-shopping-centre-green-point', 'Portside Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  'Corner Portswood and Somerset Roads, Green Point, Cape Town', NULL, NULL,
  '["https://my-catalogue.co.za/stores/green-point/woolworths/port-side-centre-cnr-portswood-and-somerset-roads", "https://www.fresha.com/en-GB/a/boa-beauty-bar-green-point-cape-town-portside-shopping-centre-portswood-road-x9mdf1mc"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-green-point', 'Woolworths',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  (SELECT id FROM shopping_centers WHERE slug = 'portside-shopping-centre-green-point'),
  'Portside Shopping Centre, Cnr Portswood and Somerset Roads, Green Point, Cape Town, 8005', '021 430 2000', NULL, NULL,
  'Woolworths is a food and general merchandise store in Portside Shopping Centre, Green Point.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/green-point/woolworths/port-side-centre-cnr-portswood-and-somerset-roads", "https://www.yellowpages.net/phone_27-214302000_grocery-store_Cape-Town_ZA20398.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-green-point'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fnb-greenpoint-green-point', 'FNB Greenpoint',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  '35 Somerset Road, Shop 1 & 2, Media Quarter, Green Point, Cape Town, 8001', '087 345 6090', 'https://www.fnb.co.za', NULL,
  'FNB Greenpoint is a First National Bank branch on Somerset Road, in Green Point.',
  NULL, NULL,
  '["https://www.hotfrog.co.za/company/a6195bd1ae6f7a2541a5917920b67a27/fnb-greenpoint/cape-town/banking-services", "https://firmania.co.za/cape-town/fnb-greenpoint-72660"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fnb-greenpoint-green-point'),
  (SELECT id FROM categories WHERE slug = 'financial-investment-services'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'grand-diamonds-green-point', 'Grand Diamonds',
  (SELECT id FROM suburbs WHERE slug = 'green-point'),
  'Showroom 6A, Foyer B, Sovereign Quay, 34 Somerset Road, Green Point, Cape Town, 8001', '021 418 2880', 'https://granddiamonds.co.za', 'sales@granddiamonds.co.za',
  'Grand Diamonds is a jeweller specialising in diamonds and engagement rings, on Somerset Road in Green Point.',
  NULL, NULL,
  '["https://granddiamonds.co.za/contact-us/", "https://www.waze.com/live-map/directions/za/wc/cape-town/grand-diamonds?to=place.ChIJ49IfmmZnzB0RUMD_hxGcnyk"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'grand-diamonds-green-point'),
  (SELECT id FROM categories WHERE slug = 'jewellers'),
  1
);
