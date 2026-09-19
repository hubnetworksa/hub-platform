-- Plumstead suburb research (jobs 1-2)
INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  '3arts-village-plumstead', '3Arts Village',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  '260 Main Road, Plumstead, Cape Town', NULL, NULL,
  '["https://en.wikipedia.org/wiki/3Arts_Village", "https://3artsvillage.co.za/directory/"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-plumstead', 'Clicks',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = '3arts-village-plumstead'),
  'Shop G01, 3 Arts Village, Main Rd, Plumstead, Cape Town', '021 488 8090', NULL, NULL,
  'Clicks is a pharmacy and health-and-beauty retailer, in 3Arts Village, Plumstead.',
  NULL, NULL,
  '["https://clicks.co.za/store/3-Arts-Village/2005", "https://za.africabz.com/western-cape/clicks-pharmacy-7382"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-plumstead'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kauai-plumstead', 'Kauai',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = '3arts-village-plumstead'),
  'Shop GF-S09, 3 Arts Village, Main Road, Plumstead, Cape Town', '021 745 6685', NULL, NULL,
  'Kauai is a health-food and smoothie bar chain outlet, in 3Arts Village, Plumstead.',
  NULL, NULL,
  '["https://restaurants-in-cape-town.co.za/restaurants/kauai-3-arts/", "https://www.sluurpy.co.za/plumstead/restaurant/8614218/kauai-3-arts"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kauai-plumstead'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-plumstead', 'Woolworths',
  (SELECT id FROM suburbs WHERE slug = 'plumstead'),
  (SELECT id FROM shopping_centers WHERE slug = '3arts-village-plumstead'),
  '3Arts Village, 260 Main Rd, Plumstead, Cape Town', '021 710 7900', NULL, NULL,
  'Woolworths is a supermarket and department store, in 3Arts Village, Plumstead.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/woolworths-3arts-village-555571", "https://en.wikipedia.org/wiki/3Arts_Village"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-plumstead'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);
