INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'flamingo-square-table-view', 'Flamingo Square',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  '212 Blaauwberg Road, Table View, 7441', NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/woolworths/flamingo-square-shopping-centre-cnr-blaauwberg-study-roads", "https://tableviewinfo.co.za/flamingo-square/", "https://www.postnet.co.za/stores/tableviewflamingosquare"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kwik-spar-flamingo-square-table-view', 'Kwik Spar Flamingo Square',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'flamingo-square-table-view'),
  'Shop 15, Flamingo Square Centre, cnr Study & Blaauwberg Road, Table View, 7441', '021 557 4711', NULL, NULL,
  'Kwik Spar Flamingo Square is a supermarket branch inside Flamingo Square, Table View.',
  NULL, NULL,
  '["https://www.spar.co.za/home/store-view/kwikspar-tableview-western-cape", "https://my-catalogue.co.za/stores/table-view/spar/flamingo-square-centre"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kwik-spar-flamingo-square-table-view'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'absolute-pets-flamingo-square-table-view', 'Absolute Pets Flamingo Square',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'flamingo-square-table-view'),
  'Flamingo Square, Blaauwberg Road, Table View, 7441', '021 556 4626', NULL, NULL,
  'Absolute Pets Flamingo Square is a pet supplies store inside Flamingo Square, Table View.',
  NULL, NULL,
  '["https://packleader.co.za/store/absolute-pets-flamingo-square/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=332657"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'absolute-pets-flamingo-square-table-view'),
  (SELECT id FROM categories WHERE slug = 'pet-stores'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-flamingo-square-table-view', 'Clicks Flamingo Square',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'flamingo-square-table-view'),
  '15 Flamingo Square, Flamingo Crescent, Table View, 7441', '021 556 8673', NULL, NULL,
  'Clicks Flamingo Square is a pharmacy and health & beauty retailer inside Flamingo Square, Table View.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/cape-town/clicks/15-flamingo-square-shopping-centre-n-a-flamingo-crescent-blouberg-tableview", "https://clicks.co.za/store/Flamingo/1666"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-flamingo-square-table-view'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'tonys-roma-flamingo-square-table-view', 'Tony''s Roma',
  (SELECT id FROM suburbs WHERE slug = 'table-view'),
  (SELECT id FROM shopping_centers WHERE slug = 'flamingo-square-table-view'),
  'Flamingo Square, corner Study and Blaauwberg Road, Table View', '021 556 0054', NULL, NULL,
  'Tony''s Roma is a bar and restaurant inside Flamingo Square, Table View, serving breakfast, lunch and dinner with sports on big screens.',
  NULL, NULL,
  '["https://www.dining-out.co.za/md/Tonys-Roma/6242", "https://www.food-blog.co.za/tonys-roma/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'tonys-roma-flamingo-square-table-view'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
