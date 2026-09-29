INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pahari-african-restaurant-salt-river', 'Pahari African Restaurant',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  '121 Cecil Road, Salt River, Cape Town', '078 107 1541', 'https://pahari.co.za', NULL,
  'Pahari African Restaurant serves traditional African and Zimbabwean cuisine, in Salt River.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/pahari-african-restaurant/", "https://pahari.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pahari-african-restaurant-salt-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'table-seven-salt-river', 'Table Seven',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  'Unit C5, Salt Orchard, Corner Briar and Yew Streets, Salt River, Cape Town', '082 588 7804', 'https://www.tableseven.co.za', NULL,
  'Table Seven is a private-dining and chef''s table restaurant offering daily blackboard lunches, at Salt Orchard in Salt River.',
  NULL, NULL,
  '["https://insideguide.co.za/cape-town/restaurants/table-seven/", "https://www.eatout.co.za/venue/table-seven/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'table-seven-salt-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'loaves-by-madame-baker-salt-river', 'Loaves by Madame Baker',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  'Unit B3, Salt Orchard, 12 Briar Road, Salt River, Cape Town, 8000', '081 046 6664', 'https://www.loaves.co.za', 'info@loaves.co.za',
  'Loaves by Madame Baker is an artisan bakery baking bread on-site with stone-ground flour, at Salt Orchard in Salt River.',
  NULL, NULL,
  '["https://www.eatout.co.za/venue/loaves-on-long/", "https://www.loaves.co.za/contact.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'loaves-by-madame-baker-salt-river'),
  (SELECT id FROM categories WHERE slug = 'bakeries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cannings-salt-river', 'Cannings',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  '10 Brickfield Road, Salt River, Cape Town', '021 422 1666', 'https://www.cannings.co.za', 'info@cannings.co.za',
  'Cannings is an automotive body repair and panel-beating specialist in Salt River, operating since 1973.',
  NULL, NULL,
  '["https://www.cannings.co.za/about/", "https://www.brabys.com/za/western-cape/cape-town/salt-river/panelbeaters-spraypainters/cannings"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cannings-salt-river'),
  (SELECT id FROM categories WHERE slug = 'panel-beaters-spray-painters'),
  1
);
