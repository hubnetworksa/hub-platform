INSERT OR IGNORE INTO shopping_centers (slug, name, suburb_id, address, lat, lng, source_urls, type)
VALUES (
  'parow-centre-parow', 'Parow Centre',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  'Corner Voortrekker Road & De La Rey Street, Parow, Cape Town, 7500', NULL, NULL,
  '["https://parowcentre.co.za/", "https://getoccupi.com/malls/parow-centre", "https://www.tripadvisor.com/Attraction_Review-g312669-d8489409-Reviews-Parow_Centre-Parow_Western_Cape.html"]',
  'mall'
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'clicks-parow-centre-parow', 'Clicks Sanlam (Parow)',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  (SELECT id FROM shopping_centers WHERE slug = 'parow-centre-parow'),
  'Shop 168, Parow Centre, Voortrekker Road, Parow East, Cape Town, 7501', '021 930 6400', NULL, NULL,
  'Clicks Sanlam (Parow) is a branch of the Clicks pharmacy and health chain in Parow Centre, offering a pharmacy, health, beauty and personal care products.',
  NULL, NULL,
  '["https://clicks.co.za/store/Sanlam-(Parow)/111", "https://za.africabz.com/western-cape/clicks-pharmacy-32844"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'clicks-parow-centre-parow'),
  (SELECT id FROM categories WHERE slug = 'pharmacies'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'grill-baby-parow', 'Grill Baby',
  (SELECT id FROM suburbs WHERE slug = 'parow'),
  '262 Voortrekker Road, Parow East, Cape Town, 7501', '087 077 0429', 'https://www.grillbaby.co.za/', 'info@grillbaby.co.za',
  'Grill Baby is a grill restaurant on Voortrekker Road in Parow East, serving flame-grilled meat dishes.',
  NULL, NULL,
  '["https://www.grillbaby.co.za/", "https://za.africabz.com/western-cape/grill-baby-parow-416570"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'grill-baby-parow'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
