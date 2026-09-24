INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'wynberg-centre-wynberg', 'Wynberg Centre',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  '123 Main Road, Wynberg, Cape Town, 7800', NULL, NULL,
  '["https://clicks.co.za/store/Clicks-Wynberg-Centre/2255", "https://www.rennieproperty.co.za/buildings/wynberg-shopping-centre-(wynberg).html", "https://www.sa-venues.com/things-to-do/westerncape/bysuburb/wynberg/category/malls-and-shopping/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-wynberg-centre-wynberg', 'Clicks',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'wynberg-centre-wynberg'),
  'Shop 14, 15A, 15B & 16, Wynberg Centre, 123 Main Road, Wynberg, Cape Town, 7800', '021 797 7127', NULL, NULL,
  'Clicks is a pharmacy and health-and-beauty retailer inside Wynberg Centre, on Main Road.',
  NULL, NULL,
  '["https://clicks.co.za/store/Clicks-Wynberg-Centre/2255", "https://my-catalogue.co.za/stores/cape-town/clicks/main-road-wynberg"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-wynberg-centre-wynberg'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'shoprite-maynard-mall-wynberg', 'Shoprite',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  (SELECT id FROM shopping_centers WHERE slug = 'maynard-mall-wynberg'),
  '55 Main Road, Maynard Mall, Wynberg, Cape Town, 7800', '021 763 5380', NULL, NULL,
  'Shoprite is a supermarket anchoring Maynard Mall on Main Road, Wynberg, with an in-store bakery, butchery and deli.',
  NULL, NULL,
  '["https://www.shoprite.co.za/Western-Cape/Cape-Town/Wynberg/Shoprite-Maynard-Mall/store-details/6569", "https://za.africabz.com/western-cape/shoprite-maynard-mall-46733"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'shoprite-maynard-mall-wynberg'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dis-chem-wynberg', 'Dis-Chem',
  (SELECT id FROM suburbs WHERE slug = 'wynberg'),
  NULL,
  '222 Main Road, Wynberg, Cape Town, 7824', '021 797 8141', NULL, NULL,
  'Dis-Chem is a pharmacy and health-and-beauty retailer on Main Road, Wynberg.',
  NULL, NULL,
  '["https://www.dischem.co.za/wynberg-cape-town", "https://www.cybo.com/ZA-biz/wynberg-pharmacy_1Q"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dis-chem-wynberg'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
