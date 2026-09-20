INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'table-bay-mall-milnerton', 'Table Bay Mall',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  'Cnr R27 (West Coast Road) & Berkshire Boulevard, Milnerton, Cape Town, 7441', NULL, NULL,
  '["https://www.tablebaymall.co.za/", "https://www.holidayapartments.co.za/Western-Cape/Cape-Town/Milnerton/activities/Table-Bay-Mall?id=409"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-table-bay-mall-milnerton', 'Woolworths Table Bay Mall',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  (SELECT id FROM shopping_centers WHERE slug = 'table-bay-mall-milnerton'),
  'Table Bay Mall, Cnr West Coast Road (R27) & Berkshire Boulevard, Milnerton, Cape Town', '021 554 8040', NULL, NULL,
  'Woolworths Table Bay Mall is a department store branch of the Woolworths chain in Table Bay Mall, Milnerton, selling groceries, food, and clothing.',
  NULL, NULL,
  '["https://tablebaymall.co.za/stores/woolworths", "https://vymaps.com/ZA/Woolworths-Table-Bay-Mall-T50126995/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-table-bay-mall-milnerton'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'checkers-table-bay-mall-milnerton', 'Checkers Table Bay Mall',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  (SELECT id FROM shopping_centers WHERE slug = 'table-bay-mall-milnerton'),
  'Table Bay Mall, Cnr West Coast Road & Sandown Road, Milnerton, Cape Town', '021 554 8550', NULL, NULL,
  'Checkers Table Bay Mall is a supermarket branch of the Checkers chain in Table Bay Mall, Milnerton.',
  NULL, NULL,
  '["https://www.tablebaymall.co.za/shop/checkers", "https://www.sayellow.com/view/south-africa/checkers-table-bay-mall-in-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'checkers-table-bay-mall-milnerton'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-table-bay-mall-milnerton', 'Clicks Table Bay Mall',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  (SELECT id FROM shopping_centers WHERE slug = 'table-bay-mall-milnerton'),
  'Shop G78, Table Bay Mall, West Coast Road, Milnerton, Cape Town, 7441', '021 521 8509', NULL, NULL,
  'Clicks Table Bay Mall is a pharmacy, health and beauty branch of the Clicks chain in Table Bay Mall, Milnerton.',
  NULL, NULL,
  '["https://clicks.co.za/store/Table-Bay-Mall/1818", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=385813"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-table-bay-mall-milnerton'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pharmcor-milnerton-milnerton', 'Pharmcor Milnerton',
  (SELECT id FROM suburbs WHERE slug = 'milnerton'),
  'Cnr Koeberg Road & Racecourse Road, Milnerton, Cape Town', '021 529 9340', NULL, NULL,
  'Pharmcor Milnerton is an independent pharmacy at the corner of Koeberg and Racecourse Roads in Milnerton, next to Mediclinic Milnerton.',
  NULL, NULL,
  '["https://www.primecure.co.za/provider/pharmcor-milnerton/", "https://cape-town.infoisinfo.co.za/card/pharmcor-milnerton/321116"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pharmcor-milnerton-milnerton'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);
