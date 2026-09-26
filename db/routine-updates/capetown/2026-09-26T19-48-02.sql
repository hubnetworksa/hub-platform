INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-pharmacy-gordons-bay', 'Clicks Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'gordons-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'gordons-bay-mall-gordons-bay'),
  'Shop 16, Gordon''s Bay Mall, Sir Lowry''s Pass Road, Gordon''s Bay, 7140', '021 856 2006', NULL, NULL,
  'Clicks Pharmacy is a pharmacy and health and beauty retailer at Gordon''s Bay Mall in Gordon''s Bay.',
  NULL, NULL,
  '["https://clicks.co.za/store/Gordons-Bay/1871", "https://www.tiendeo.co.za/stores/cape-town/clicks-steenbras-shopping-centre-shop-steenbras-shopping-centre/56002"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-pharmacy-gordons-bay'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'specsavers-gordons-bay', 'Specsavers',
  (SELECT id FROM suburbs WHERE slug = 'gordons-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'gordons-bay-mall-gordons-bay'),
  'Shop 15, Gordon''s Bay Mall, Sir Lowry''s Pass Road, Gordon''s Bay, 7140', '0860 766 930', NULL, NULL,
  'Specsavers is an optometry practice at Gordon''s Bay Mall in Gordon''s Bay.',
  NULL, NULL,
  '["https://www.specsavers.co.za/store/gordons-bay/contact", "https://za.africabz.com/western-cape/spec-savers-gordons-bay-198774"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'specsavers-gordons-bay'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'mountain-view-shopping-centre-gordons-bay', 'Mountain View Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'gordons-bay'),
  'Cnr Avondrus Street & Sir Lowry''s Pass Road, Winslow, Gordon''s Bay, 7140', NULL, NULL,
  '["https://www.anvilproperty.co.za/commercial-property/office-space/to-rent/gordon-s-bay/mountain-view-shopping-centre-6915", "https://www.gordonsbayonline.co.za/item/woolworths-gordons-bay/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-gordons-bay', 'Woolworths',
  (SELECT id FROM suburbs WHERE slug = 'gordons-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'mountain-view-shopping-centre-gordons-bay'),
  'Mountain View Shopping Centre, Cnr Avondrus Street & Sir Lowry''s Pass Road, Gordon''s Bay, 7140', '021 856 8500', NULL, NULL,
  'Woolworths is a supermarket at Mountain View Shopping Centre in Gordon''s Bay.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/woolworths-gordons-bay-33493", "https://www.gordonsbayonline.co.za/item/woolworths-gordons-bay/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-gordons-bay'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pna-gordons-bay', 'PNA',
  (SELECT id FROM suburbs WHERE slug = 'gordons-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'mountain-view-shopping-centre-gordons-bay'),
  'Mountain View Shopping Centre, Sir Lowry''s Pass Road, Gordon''s Bay, 7140', '021 224 0970', NULL, NULL,
  'PNA is a stationery, books and arts and crafts retailer at Mountain View Shopping Centre in Gordon''s Bay.',
  NULL, NULL,
  '["https://pna.co.za/store-locator/pna-gordons-bay/", "https://www.sayellow.com/view/south-africa/pna-gordons-bay-in-gordons-bay-cape-town"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pna-gordons-bay'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'the-crazy-store-gordons-bay', 'The Crazy Store',
  (SELECT id FROM suburbs WHERE slug = 'gordons-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'mountain-view-shopping-centre-gordons-bay'),
  'Shop 5, Mountain View Shopping Centre, Avondrus Street, Gordon''s Bay, 7140', '021 856 0697', NULL, NULL,
  'The Crazy Store is a variety and discount goods retailer at Mountain View Shopping Centre in Gordon''s Bay.',
  NULL, NULL,
  '["https://www.sayellow.com/view/south-africa/the-crazy-store-mountainview-centre-in-gordons-bay-cape-town", "https://www.cybo.com/ZA-biz/the-crazy-store-gordons-bay"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'the-crazy-store-gordons-bay'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);
