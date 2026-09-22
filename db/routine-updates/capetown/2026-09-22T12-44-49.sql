INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pep-maitland', 'PEP',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  (SELECT id FROM shopping_centers WHERE slug = 'maitland-square-maitland'),
  'Shop 5-6, Maitland Square, 278 Voortrekker Road, Maitland, Cape Town, 7405', '021 510 4136', NULL, NULL,
  'PEP is a general retail store in Maitland Square, Maitland.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/cape-town/pep-stores-shop--maitland-square-voortrekker-road-maitland-cape-town-western-cape/70461", "https://www.yellosa.co.za/company/777169/pep-stores-pty-ltdbranchesmaitland-square"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pep-maitland'),
  (SELECT id FROM categories WHERE slug = 'general-retail'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'kfc-maitland', 'KFC Maitland',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  '389 Voortrekker Road, Maitland, Cape Town, 7405', '021 510 1099', NULL, NULL,
  'KFC Maitland is a fried chicken and fast food restaurant on Voortrekker Road in Maitland.',
  NULL, NULL,
  '["https://locations.kfc.co.za/western-cape/maitland/389-voortrekker-rd-maitland-cape-town-7405", "https://www.cylex.net.za/company/kfc-maitland-23708750.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'kfc-maitland'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'mcdonalds-maitland', 'McDonald''s Maitland',
  (SELECT id FROM suburbs WHERE slug = 'maitland'),
  'Corner Voortrekker Road and Colin Street, Maitland, Cape Town, 7405', '021 510 1130', NULL, NULL,
  'McDonald''s Maitland is a drive-thru fast food restaurant on Voortrekker Road in Maitland.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/mcdonalds-maitland-27937", "https://www.findmy.co.za/food/category-detail/mcdonalds-maitland/24332"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'mcdonalds-maitland'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);
