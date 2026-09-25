INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'usave-colorado-colorado', 'Usave Colorado',
  (SELECT id FROM suburbs WHERE slug = 'colorado'),
  'C/o Highlands Drive & Weltevreden Parkway, Colorado Park, Mitchells Plain, 7785', '021 370 1080', NULL, NULL,
  'Usave Colorado is a discount grocery store on the corner of Highlands Drive and Weltevreden Parkway in Colorado Park, Mitchells Plain, part of the Shoprite Usave chain.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/mitchells-plain/usave-co-highlands-drive-weltevreden-way/62184", "https://za.africabz.com/western-cape/usave-colorado-267999"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'usave-colorado-colorado'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'colorado-city-centre-colorado', 'Colorado City Centre',
  (SELECT id FROM suburbs WHERE slug = 'colorado'),
  '38 Ceasars Drive, Colorado Park, Mitchells Plain, 7785', NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/15664082_2", "https://magicpin.com/south-africa/Cape-Town/Mitchells-Plain/Beauty/Rycole-Hair-And-Beauty-Salon/store/233b245"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'amazing-store-colorado', 'Amazing Store',
  (SELECT id FROM suburbs WHERE slug = 'colorado'),
  (SELECT id FROM shopping_centers WHERE slug = 'colorado-city-centre-colorado'),
  'Shop No. 6, Colorado City Centre, Ceasars Drive, Colorado Park, Mitchells Plain, 7785', '021 374 5756', NULL, NULL,
  'Amazing Store is a general dealer in Colorado City Centre on Ceasars Drive, Colorado Park, Mitchells Plain, selling kitchenware, toys and snacks.',
  NULL, NULL,
  '["https://www.yep.co.za/biz/store/iyp/15664082_2", "https://vymaps.com/ZA/Amazing-Store-503078976525063/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'amazing-store-colorado'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
