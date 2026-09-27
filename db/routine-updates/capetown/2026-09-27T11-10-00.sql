INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'prospur-shopping-centre-plumstead', 'Prospur Shopping Centre',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  '74 Churchill Road, Plumstead, Cape Town', NULL, NULL,
  '["https://www.mallguide.co.za/malls/view/980/prospur-shopping-centre", "https://www.guzzle.co.za/malls/814/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'intrinsic-hair-and-beauty-plumstead', 'Intrinsic Hair & Beauty',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = 'prospur-shopping-centre-plumstead'),
  'Prospur Centre, 88 Churchill Road, Plumstead, Cape Town', '021 768 0144', NULL, NULL,
  'Intrinsic Hair & Beauty is a hair and beauty salon inside Prospur Shopping Centre, Plumstead.',
  NULL, NULL,
  '["https://www.fresha.com/a/intrinsic-hair-beauty-cape-town-prospur-centre-88-churchill-road-dxpavs4a", "https://www.intrinsic-hair.co.za/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'intrinsic-hair-and-beauty-plumstead'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kwikspar-prospur-plumstead', 'Kwikspar Prospur',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = 'prospur-shopping-centre-plumstead'),
  '74 Churchill Road, Plumstead, Cape Town, 7945', '021 761 3341', NULL, NULL,
  'Kwikspar Prospur is a supermarket inside Prospur Shopping Centre, Plumstead.',
  NULL, NULL,
  '["https://prospurkwikspar.co.za/Contact-Find-Us/", "https://www.cylex.net.za/company/kwikspar-prospur-23858817.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kwikspar-prospur-plumstead'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-prospur-pharmacy-plumstead', 'Clicks Prospur Pharmacy',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = 'prospur-shopping-centre-plumstead'),
  '76 Churchill Road, Plumstead, Cape Town, 7800', '021 797 5386', NULL, NULL,
  'Clicks Prospur Pharmacy is a Clicks pharmacy and retail store inside Prospur Shopping Centre, Plumstead.',
  NULL, NULL,
  '["https://clicks.co.za/store/Prospur-Pharmacy/1841", "https://za.africabz.com/western-cape/clicks-pharmacy-294788"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-prospur-pharmacy-plumstead'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'plumstead-fisheries-plumstead', 'Plumstead Fisheries',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  '209-211 Main Road, Plumstead, Cape Town, 7800', '+27 21 797 9432', NULL, NULL,
  'Plumstead Fisheries is a long-standing fish and chips takeaway on Main Road, Plumstead, trading for more than 30 years.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/plumstead-fisheries-41339", "https://www.callupcontact.com/b/business/Plumstead_Fisheries/53508"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'plumstead-fisheries-plumstead'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'jem-hair-and-beauty-studio-plumstead', 'JEM Hair and Beauty Studio',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = '3arts-village-plumstead'),
  'Shop 11, Ground Floor, 3 Arts Village, 260 Main Road, Plumstead, Cape Town, 7800', '064 502 1207', NULL, NULL,
  'JEM Hair and Beauty Studio is a hair and beauty salon inside 3 Arts Village, Plumstead.',
  NULL, NULL,
  '["https://www.fresha.com/a/jem-3-arts-village-cape-town-jem-hair-and-beauty-studio-3-arts-village-260-main-road-ntdbrrkt", "https://epilfree.co.za/jem-hair-beauty-studio-plumstead/"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'jem-hair-and-beauty-studio-plumstead'),
  (SELECT id FROM categories WHERE slug = 'beauty-hair-salons'),
  1
);
