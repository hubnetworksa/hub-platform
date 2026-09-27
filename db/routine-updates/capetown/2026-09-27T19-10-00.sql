INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-food-welgemoed', 'Woolworths Food Welgemoed',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  (SELECT id FROM shopping_centers WHERE slug = 'welgemoed-forum-welgemoed'),
  'Shop 5A, Welgemoed Forum, 24 Kommissaris Street, Welgemoed, Cape Town, 7530', '021 912 1011', NULL, NULL,
  'Woolworths Food Welgemoed is a supermarket in Welgemoed Forum, Welgemoed.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/woolworths-food---welgemoed-19629089.html", "https://my-catalogue.co.za/stores/cape-town/woolworths/welgemoed-forum-commissaris-st-jip-de-jager-welgemoed"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-food-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'steers-welgemoed', 'Steers Welgemoed',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  (SELECT id FROM shopping_centers WHERE slug = 'welgemoed-forum-welgemoed'),
  'Welgemoed Forum, Cnr Kommissaris & Jip De Jager Avenue, Welgemoed, Cape Town, 7530', '021 913 2102', NULL, NULL,
  'Steers Welgemoed is a fast-food burger restaurant in Welgemoed Forum, Welgemoed.',
  NULL, NULL,
  '["https://www.cylex.net.za/company/steers-23692157.html", "https://www.tiendeo.co.za/stores/cape-town/steers-welgemoed-shopping-forum-cnr-kommisaris-jip-de-jager-avenue/36037"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'steers-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'neovision-welgemoed', 'Neovision Welgemoed',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  (SELECT id FROM shopping_centers WHERE slug = 'welgemoed-forum-welgemoed'),
  'Shop 18A, Welgemoed Forum, Cnr Jip De Jager & Kommissaris Street, Welgemoed, Cape Town, 7530', '021 140 8743', 'https://www.neovision.co.za/stores/welgemoed-forum/', NULL,
  'Neovision Welgemoed is an optometry practice in Welgemoed Forum, Welgemoed.',
  NULL, NULL,
  '["https://www.neovision.co.za/stores/welgemoed-forum/", "https://www.medpages.info/sf/index.php?page=organisation&orgcode=1946779"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'neovision-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-welgemoed', 'KFC Welgemoed',
  (SELECT id FROM suburbs WHERE slug = 'welgemoed'),
  (SELECT id FROM shopping_centers WHERE slug = 'welgemoed-forum-welgemoed'),
  'Welgemoed Forum, Cnr Jip De Jager Road & Kommissaris Street, Welgemoed, Cape Town, 7530', '021 913 8514', NULL, NULL,
  'KFC Welgemoed is a fried chicken fast-food restaurant in Welgemoed Forum, Welgemoed.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/welgemoed/welgemoed-forum-cnr-jip-de-jager-road-&-kommissaris-st-welgemoed-cape-town", "https://za.africabz.com/western-cape/kfc-welgemoed-195751"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-welgemoed'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
