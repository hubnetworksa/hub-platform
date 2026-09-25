INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'woolworths-howard-centre-pinelands', 'Woolworths',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Shop 473, Howard Centre, Forest Drive, Pinelands, Cape Town, 7405', '021 530 7111', NULL, NULL,
  'Woolworths is a branch of the national department store chain, selling food, clothing and homeware from Howard Centre, Pinelands.',
  NULL, NULL,
  '["https://www.tiendeo.co.za/stores/milnerton/woolworths-shop-howard-centre-forest-dr-pinelands/44420", "https://my-catalogue.co.za/stores/pinelands/woolworths/shop-473-howard-centre-forest-dr"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'woolworths-howard-centre-pinelands'),
  (SELECT id FROM categories WHERE slug = 'supermarkets-groceries'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'bargain-books-howard-centre-pinelands', 'Bargain Books',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Shop G43a, Howard Centre, Corner Howard & Forest Drive, Pinelands, Cape Town, 7405', '021 532 2217', NULL, NULL,
  'Bargain Books is a branch of the book and stationery retail chain, trading from Howard Centre, Pinelands.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/bargain-books-pinelands-111008", "https://nearbyza.com/place/bargain-books-pinelands"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'bargain-books-howard-centre-pinelands'),
  (SELECT id FROM categories WHERE slug = 'books-stationery'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'cincinnati-spur-howard-centre-pinelands', 'Cincinnati Spur',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Shop 65, Howard Centre, Corner Howard & Forest Drive, Pinelands, Cape Town, 7405', '021 531 1559', NULL, NULL,
  'Cincinnati Spur is a branch of the Spur Steak Ranches family restaurant chain, serving steaks and grills from Howard Centre, Pinelands.',
  NULL, NULL,
  '["https://www.pinelandsdirectory.co.za/howardcentre/dir/spur.php", "https://crave.co.za/establishment.asp?est=17543"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'cincinnati-spur-howard-centre-pinelands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'wimpy-howard-centre-pinelands', 'Wimpy',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Shop G49 & G49 OA, Howard Centre, Corner Forest & Howard Drive, Pinelands, Cape Town, 7405', '021 531 9770', NULL, NULL,
  'Wimpy is a branch of the family restaurant chain, serving burgers and breakfasts from Howard Centre, Pinelands.',
  NULL, NULL,
  '["https://location.wimpy.co.za/howard-centre", "https://www.tripadvisor.com/Restaurant_Review-g2712907-d17788438-Reviews-Wimpy-Pinelands_Western_Cape.html"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'wimpy-howard-centre-pinelands'),
  (SELECT id FROM categories WHERE slug = 'restaurants-takeaways'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'specsavers-howard-centre-pinelands', 'Spec-Savers Pinelands',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'howard-centre-pinelands'),
  'Shop G06, Howard Centre, Corner Forest & Howard Drives, Pinelands, Cape Town, 7405', '021 531 0609', NULL, NULL,
  'Spec-Savers Pinelands is a branch of the optometry chain, offering eye tests and eyewear from Howard Centre, Pinelands.',
  NULL, NULL,
  '["https://www.specsavers.co.za/store/howard", "https://www.pinelandsdirectory.co.za/howardcentre/dir/specsavers.php"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'specsavers-howard-centre-pinelands'),
  (SELECT id FROM categories WHERE slug = 'opticians'),
  1
);

INSERT OR IGNORE INTO businesses
  (slug, name, suburb_id, shopping_center_id, address, phone, website, email, description, lat, lng, source_urls, status, origin)
VALUES (
  'pinelands-hardware-central-square-pinelands', 'Pinelands Hardware',
  (SELECT id FROM suburbs WHERE slug = 'pinelands'),
  (SELECT id FROM shopping_centers WHERE slug = 'central-square-pinelands'),
  '12 Central Square, Pinelands, Cape Town, 7405', '021 531 0390', NULL, NULL,
  'Pinelands Hardware is an independent hardware store trading from Central Square, Pinelands.',
  NULL, NULL,
  '["https://za.africabz.com/western-cape/pinelands-hardware-143091", "https://readymap.co.za/4/35916"]',
  'published', 'agent_research'
);
INSERT OR IGNORE INTO business_categories (business_id, category_id, is_primary)
VALUES (
  (SELECT id FROM businesses WHERE slug = 'pinelands-hardware-central-square-pinelands'),
  (SELECT id FROM categories WHERE slug = 'hardware-stores'),
  1
);
