INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'welgemoed-plaza-welgemoed', 'Welgemoed Plaza',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  '20 Kommissaris Street, Welgemoed Greens, Cape Town, 7530', NULL, NULL,
  '["https://laundrydrycleaning4u.co.za/welgemoed-plaza/", "https://vymaps.com/ZA/Welgemoed-Plaza-161564/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pick-n-pay-welgemoed-plaza-welgemoed', 'Pick n Pay Welgemoed',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  (SELECT id FROM shopping_centers WHERE slug = 'welgemoed-plaza-welgemoed'),
  'Corner Kommissaris & Sluysken Street, Welgemoed Plaza, Welgemoed, Cape Town, 7530', '021 913 2350', NULL, NULL,
  'Pick n Pay Welgemoed is a supermarket inside Welgemoed Plaza in Welgemoed.',
  NULL, NULL,
  '["https://my-catalogue.co.za/stores/welgemoed/pick-n-pay-local/cnr-of-kommissaris-sluysken-street", "https://www.yep.co.za/biz/store/iyp/2329395_2"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pick-n-pay-welgemoed-plaza-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cafe-delicieux-welgemoed', 'Cafe Delicieux',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  (SELECT id FROM shopping_centers WHERE slug = 'welgemoed-forum-welgemoed'),
  'Shop 6, Welgemoed Forum, Corner Jip de Jager & Kommissaris Street, Welgemoed, Cape Town, 7530', '021 913 0153', NULL, NULL,
  'Cafe Delicieux is a cafe and restaurant inside Welgemoed Forum in Welgemoed.',
  NULL, NULL,
  '["http://blog.sa-venues.com/provinces/western-cape/cafe-delicieux-welgemoed/", "https://www.sa-venues.com/things-to-do/westerncape/cafe-delicieux/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cafe-delicieux-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
