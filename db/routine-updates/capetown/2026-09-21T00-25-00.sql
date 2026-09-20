-- Cape Town routine: Hout Bay suburb research (new Mainstream Mall + 2 tenants, 1 standalone)
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'mainstream-mall-hout-bay', 'Mainstream Mall',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  'Cnr Main Road & Princess Street, Hout Bay, Cape Town, 7806', NULL, NULL,
  '["https://www.mainstreammall.co.za/about-mainstream-mall/", "https://www.capepointroute.co.za/moreinfoOther.php?aID=326"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-pharmacy-hout-bay', 'Clicks Pharmacy Hout Bay',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'mainstream-mall-hout-bay'),
  'Mainstream Mall, Cnr Princess & Main Road, Hout Bay, Cape Town, 7806', '021 790 5077', NULL, NULL,
  'Clicks Pharmacy Hout Bay is a branch of the Clicks pharmacy and health-and-beauty retail chain in Mainstream Mall.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/clicks-pharmacy-46814", "https://za.textmap.info/3/444"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-pharmacy-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-hout-bay', 'Woolworths Hout Bay',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  (SELECT id FROM shopping_centers WHERE slug = 'mainstream-mall-hout-bay'),
  'Shop B8, Mainstream Mall, Mainstream Avenue, Hout Bay, Cape Town, 7806', '021 791 7500', NULL, NULL,
  'Woolworths Hout Bay is a branch of the Woolworths department store and food chain in Mainstream Mall.',
  NULL, NULL,
  '["https://opening-hours.co.za/0807772/WoolWorth_Hout_Bay", "https://2pos.co.za/2/17870"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'fish-on-the-rocks-hout-bay', 'Fish on the Rocks',
  (SELECT id FROM suburbs WHERE slug = 'hout-bay'),
  'Harbour Road, Hout Bay Harbour, Cape Town, 7806', '021 790 0001', 'https://fishontherocks.com/', NULL,
  'Fish on the Rocks is a casual, takeaway-style seafood spot on the rocks at the end of Hout Bay harbour, popular for fish and chips.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/fish-on-the-rocks-4979", "https://www.tripadvisor.com/Restaurant_Review-g469392-d1996396-Reviews-Fish_on_the_Rocks-Hout_Bay_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'fish-on-the-rocks-hout-bay'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
