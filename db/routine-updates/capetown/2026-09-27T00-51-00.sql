INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bootlegger-xs-salt-river-salt-river', 'Bootlegger XS Salt River',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  'Shop 6, 13 Brickfield Road, Salt River, Cape Town, 7925', '021 201 1499', NULL, NULL,
  'Bootlegger XS Salt River is a coffee shop and café in Salt River, part of the Bootlegger Coffee Company chain.',
  NULL, NULL,
  '["https://www.tripadvisor.co.za/Restaurant_Review-g312659-d13300302-Reviews-Bootlegger_Coffee_Company_Salt_River-Cape_Town_Central_Western_Cape.html", "https://ourcafes.bootlegger.coffee/FoodDrink-CapeTown-BootleggerXSSaltRiver"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bootlegger-xs-salt-river-salt-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bistro31-bar-eatery-salt-river', 'Bistro31 Bar & Eatery',
  (SELECT id FROM suburbs WHERE slug = 'salt-river'),
  '31 Brickfield Road, Salt River, Cape Town, 7925', '021 404 0570', NULL, NULL,
  'Bistro31 Bar & Eatery is a restaurant and bar on the ground floor of the DoubleTree by Hilton Cape Town Upper Eastside hotel in Salt River.',
  NULL, NULL,
  '["https://www.dineplan.com/restaurants/bistro31-at-upper-eastside", "https://www.facebook.com/bistro31woodstock/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bistro31-bar-eatery-salt-river'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
