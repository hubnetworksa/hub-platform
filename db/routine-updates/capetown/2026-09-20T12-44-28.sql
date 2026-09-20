INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'rocklands-shopping-centre-rocklands', 'Rocklands Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'rocklands'),
  'Cnr Park Avenue & Caravelle Road, Rocklands, Mitchells Plain, Cape Town, 7785', NULL, NULL,
  '["https://www.rennieproperty.co.za/buildings/rocklands-shopping-centre.html", "https://billboardfinder.co.za/listing/rocklands-shopping-centre-park-mitchells-plain-western-cape/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-rocklands-rocklands', 'Shoprite Rocklands',
  (SELECT id FROM suburbs WHERE slug = 'rocklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'rocklands-shopping-centre-rocklands'),
  'Cnr Park Avenue & Caravelle Street, Rocklands Shopping Centre, Mitchells Plain, Cape Town, 7785', '021 378 1880', NULL, NULL,
  'Shoprite Rocklands is a supermarket, the anchor tenant of Rocklands Shopping Centre in Mitchells Plain.',
  NULL, NULL,
  '["https://www.callupcontact.com/b/Supermarkets/Shoprite_Rocklands/4807", "https://www.sayellow.com/shoprite-rocklands-mitchells-plain"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-rocklands-rocklands'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'caravelle-post-office-rocklands', 'Caravelle Post Office',
  (SELECT id FROM suburbs WHERE slug = 'rocklands'),
  (SELECT id FROM shopping_centers WHERE slug = 'rocklands-shopping-centre-rocklands'),
  'Rocklands Shopping Centre, Cnr Park Avenue & Caravelle Road, Rocklands, Mitchells Plain, Cape Town, 7785', '021 392 7754', NULL, NULL,
  'Caravelle Post Office is a South African Post Office branch inside Rocklands Shopping Centre, Mitchells Plain.',
  NULL, NULL,
  '["https://pathfinda.com/en/mitchells-plain/rocklands/shops-services/caravelle-post-office", "https://za.africabz.com/western-cape/caravelle-post-office-226635"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'caravelle-post-office-rocklands'),
  (SELECT id FROM categories WHERE slug = 'logistics-courier-transport'),
  1
);
