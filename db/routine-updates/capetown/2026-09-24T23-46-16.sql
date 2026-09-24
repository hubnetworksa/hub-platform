INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'sakura-beauty-bar-welgemoed', 'Sakura Beauty Bar',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  'Shop 4, Welgemoed Centre, Kommissaris Street, Welgemoed, Cape Town, 7530', '083 262 9220', NULL, NULL,
  'Sakura Beauty Bar is a beauty salon in Welgemoed offering skincare, nail, and beauty treatments.',
  NULL, NULL,
  '["https://sakurabeautybar.co.za/", "https://www.fresha.com/lvp/sakura-beauty-bar-kommissaris-street-cape-town-8Jy8JW"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'sakura-beauty-bar-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'dry-cleaning-4u-welgemoed-plaza-welgemoed', 'Dry Cleaning 4U',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  (SELECT id FROM shopping_centers WHERE slug = 'welgemoed-plaza-welgemoed'),
  '20 Kommissaris Street, Welgemoed Plaza, Welgemoed, Cape Town, 7530', '067 282 9074', NULL, NULL,
  'Dry Cleaning 4U is a laundry and dry-cleaning outlet inside Welgemoed Plaza.',
  NULL, NULL,
  '["https://laundrydrycleaning4u.co.za/welgemoed-plaza/", "https://za.polomap.com/cape-town/164030"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'dry-cleaning-4u-welgemoed-plaza-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'cleaning-services'),
  1
);
