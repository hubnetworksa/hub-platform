-- Jobs 1-2: eerste-river

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'prima-hire-builders-plant-eerste-river', 'Prima Hire Builders Plant',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  '8 Bosman St, Eerste River, Cape Town, 7100', '021 902 0204', NULL, NULL,
  'Prima Hire Builders Plant is a builders'' plant and machinery hire company, in Eerste River.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/prima-hire-builders-plant-23702210.html", "https://tlb.co.za/company/prima-hire-builders-plant/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'prima-hire-builders-plant-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'building-construction'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'much-asphalt-eerste-river', 'Much Asphalt',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  '3 Ryneveld Street corner Stasie Rd, Penhill, Eerste River, Cape Town, 7103', '021 900 4400', 'https://www.muchasphalt.com', NULL,
  'Much Asphalt is an asphalt manufacturing and supply company, with a plant in Eerste River.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/much-asphalt-eerste-river-in-cape-town", "https://tlb.co.za/company/much-asphalt-eerste-river/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'much-asphalt-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'industrial-suppliers-manufacturing'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'sanbury-square-eerste-river', 'Sanbury Square',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  'Corner Old Faure Road & Baden Powell Drive, Eerste River, Cape Town, 7100', NULL, NULL,
  '["https://www.sanburysquare.co.za/", "https://www.facebook.com/sanburysquare/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-sanbury-square-eerste-river', 'Clicks Sanbury Square',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'sanbury-square-eerste-river'),
  'Shop 13, Sanbury Square Shopping Centre, Old Faure Rd, Eerste River, Cape Town, 7100', '021 488 8020', NULL, NULL,
  'Clicks Sanbury Square is a health, beauty and pharmacy retailer, in Sanbury Square, Eerste River.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/eerste-river/clicks-sanbury-square-shop-sanbury-square-shopping-centre/75603", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1784786"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-sanbury-square-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-sanbury-square-eerste-river', 'PEP Sanbury Square',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'sanbury-square-eerste-river'),
  'Shop 13, Sanbury Square, Corner Old Faure Road & Baden Powell Drive, Eerste River, Cape Town, 7100', '021 902 5430', NULL, NULL,
  'PEP Sanbury Square is a clothing, footwear and homeware retailer, in Sanbury Square, Eerste River.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop-sanbury-square-cnr-old-faure-road-baden-powell-eerste-river-cape-town-western-cape/76943", "https://www.facebook.com/PEPEersteRiverSanburySquare/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-sanbury-square-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'fashion-clothing'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-sanbury-square-eerste-river', 'Pick n Pay Sanbury Square',
  (SELECT id FROM suburbs WHERE slug = 'eerste-river'),
  (SELECT id FROM shopping_centers WHERE slug = 'sanbury-square-eerste-river'),
  'Sanbury Square Shopping Centre, Corner Old Faure Road & Baden Powell Drive, Eerste River, Cape Town, 7100', '087 750 7854', NULL, NULL,
  'Pick n Pay Sanbury Square is a supermarket anchoring Sanbury Square in Eerste River.',
  NULL, NULL,
  '["https://www.medpages.info/sf/index.php?page=organisation&orgcode=1837815", "https://www.tiendeo.co.za/stores/eerste-river/pick-n-pay-co-baden-powell-drive-and-old-faure-road/65377"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-sanbury-square-eerste-river'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
